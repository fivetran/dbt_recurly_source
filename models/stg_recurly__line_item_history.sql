with base as (

    select *
    from {{ ref('stg_recurly__line_item_history_tmp') }}
),

fields as (

    select 
        {{ 
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recurly__line_item_history_tmp')),
                staging_columns = get_line_item_history_columns()
            ) 
        }}
    from base
),

final as (

    select
        id as line_item_id, 
        description,
        cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        account_id,
        plan_id,
        plan_code,
        add_on_id,
        add_on_code,
        invoice_id,
        invoice_number,
        previous_line_item_id,
        original_line_item_invoice_id,
        subscription_id,
        uuid,
        type,
        state,
        origin,
        product_code,
        currency,
        cast(amount as {{ dbt_utils.type_float() }}) as amount,
        quantity,
        cast(unit_amount as {{ dbt_utils.type_float() }}) as unit_amount,
        subtotal,
        discount,
        tax,
        taxable as is_taxable,
        tax_exempt,
        tax_code,
        tax_type,
        tax_region,
        tax_rate,
        proration_rate,
        refund as has_refund,
        refunded_quantity,
        credit_applied,
        cast(start_date as {{ dbt_utils.type_timestamp() }}) as started_at,
        cast(end_date as {{ dbt_utils.type_timestamp() }}) as ended_at
    from fields
)

select *
from final

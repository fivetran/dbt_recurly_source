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
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        account_id,
        add_on_code,
        add_on_id,
        cast(amount as {{ dbt_utils.type_float() }}) as amount,
        cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        credit_applied,
        currency,
        description,
        discount,
        cast(end_date as {{ dbt_utils.type_timestamp() }}) as ended_at,
        refund as has_refund,
        invoice_id,
        invoice_number,
        taxable as is_taxable,
        original_line_item_invoice_id,
        origin,
        plan_code,
        plan_id,
        previous_line_item_id,
        product_code,
        proration_rate,
        quantity,
        refunded_quantity,
        cast(start_date as {{ dbt_utils.type_timestamp() }}) as started_at,
        state,
        subscription_id,
        subtotal,
        tax,
        tax_code,
        tax_exempt,
        tax_region,
        tax_rate,
        tax_type,
        type,
        cast(unit_amount as {{ dbt_utils.type_float() }}) as unit_amount,
        uuid
    from fields
)

select *
from final

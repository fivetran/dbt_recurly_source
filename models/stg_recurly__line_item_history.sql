with base as (
    select *
    from {{ ref('stg_recurly__line_item_history_tmp') }}
),
fields as (
    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_recurly_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_recurly_source/macros/).
        For more information refer to dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */
        {{ fivetran_utils.fill_staging_columns(
            source_columns = adapter.get_columns_in_relation(ref('stg_recurly__line_item_history_tmp')),
            staging_columns = get_line_item_history_columns()
        ) }}
    from
        base
),
final as (
    select
        id as line_item_id,
        description,
        created_at,
        updated_at,
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
        status,
        origin,
        product_code,
        UPPER(currency) as currency,
        amount,
        quantity,
        unit_amount,
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
        refund_quantity,
        credit_applied,
        start_date as started_at,
        end_date as ended_at
    from
        fields
)
select *
from final

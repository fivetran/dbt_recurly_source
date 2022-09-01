with base as (
    select *
    from {{ ref('stg_recurly__invoice_history_tmp') }}
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
            source_columns = adapter.get_columns_in_relation(ref('stg_recurly__invoice_history_tmp')),
            staging_columns = get_invoice_history_columns()
        ) }}
    from
        base
),
final as (
    select
        id as invoice_id,
        _fivetran_synced,
        created_at,
        updated_at,
        due_at,
        closed_at,
        account_id,
        previous_invoice_id,
        type,
        origin,
        state,
        number,
        collection_method,
        po_number,
        net_terms,
        UPPER(currency) as currency,
        balance,
        paid,
        total,
        subtotal,
        refundable_amount,
        discount,
        tax,
        tax_type,
        tax_region,
        tax_rate
    from
        fields
)
select *
from final

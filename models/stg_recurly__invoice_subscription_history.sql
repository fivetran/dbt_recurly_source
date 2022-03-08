with base as (
    select *
    from {{ ref('stg_recurly__invoice_subscription_history_tmp') }}
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
            source_columns = adapter.get_columns_in_relation(
                ref('stg_recurly__invoice_subscription_history_tmp')
            ),
            staging_columns = get_invoice_subscription_history_columns()
        ) }}
    from
        base
),
final as (
    select
        invoice_id,
        invoice_updated_at,
        subscription_id
    from
        fields
)
select *
from final

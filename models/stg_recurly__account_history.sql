with base as (
    select *
    from {{ ref('stg_recurly__account_history_tmp') }}
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
            source_columns = adapter.get_columns_in_relation(ref('stg_recurly__account_history_tmp')),
            staging_columns = get_account_history_columns()
        ) }}
    from
        base
),
final as (
    select
        id as account_id,
        code,
        bill_to,
        state,
        username,
        first_name,
        last_name,
        email,
        cc_emails,
        company,
        vat_number,
        tax_exempt as is_tax_exempt,
        account_country
        created_at,
        updated_at,
        deleted_at,
    from
        fields
)
select *
from final

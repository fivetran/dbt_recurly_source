with base as (

    select *
    from {{ ref('stg_recurly__account_history_tmp') }}
),

fields as (

    select 
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recurly__account_history_tmp')),
                staging_columns = get_account_history_columns()
            )
        }}
    from base
),

final as (

    select
        id as account_id
        , code
        , bill_to
        , state
        , username
        , first_name
        , last_name
        , email
        , cc_emails
        , company
        , vat_number
        , tax_exempt as is_tax_exempt
        , account_country
        , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at
        , cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
        , cast(deleted_at as {{ dbt_utils.type_timestamp() }}) as deleted_at
    from fields
)

select *
from final

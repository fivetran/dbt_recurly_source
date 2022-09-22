with base as (

    select *
    from {{ ref('stg_recurly__billing_info_history_tmp') }}
),

fields as (
    select
        {{ 
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recurly__billing_info_history_tmp')),
                staging_columns = get_billing_info_history_columns()
            ) 
        }}
    from base
),

final as (

    select
        id as billing_id 
        , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at
        , cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
        , account_id
        , first_name
        , last_name
        , company
        , vat_number
        , billing_phone
        , billing_street_1
        , billing_street_2
        , billing_city
        , billing_region
        , billing_postal_code
        , billing_country
        , updated_by_ip
        , updated_by_country
        , payment_method_object
        , payment_method_card_type
        , valid as is_valid
    from fields
)

select *
from final

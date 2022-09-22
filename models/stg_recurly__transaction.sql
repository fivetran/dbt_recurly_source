with base as (

    select *
    from {{ ref('stg_recurly__transaction_tmp') }}
),

fields as (

    select
        {{ fivetran_utils.fill_staging_columns(
            source_columns = adapter.get_columns_in_relation(ref('stg_recurly__transaction_tmp')),
            staging_columns = get_transaction_columns()
        ) }}
    from base
),

final as (

    select  
        id as transaction_id 
        , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        , cast(voided_at as {{ dbt_utils.type_timestamp() }}) as voided_at,
        , cast(collected_at as {{ dbt_utils.type_timestamp() }}) as collected_at,
        , original_transaction_id,
        , account_id,
        , invoice_id,
        , voided_by_invoice_id,
        , uuid, 
        , TYPE,
        , origin,
        , currency,
        , cast(amount as {{ dbt_utils.type_float() }}) as amount,
        , status,
        , success as is_successful,
        , refunded as is_refunded,
        , billing_first_name,
        , billing_last_name,
        , billing_phone,
        , billing_street_1,
        , billing_street_2,
        , billing_city,
        , billing_region,
        , billing_postal_code,
        , billing_country,
        , collection_method,
        , payment_method_object,
        , status_code,
        , status_message,
        , customer_message,
        , customer_message_locale,
        , gateway_message
        , gateway_reference
        , gateway_approval_code
        , gateway_response_code
        , gateway_response_time
        , payment_gateway_id
        , payment_gateway_type
        , payment_gateway_name
        , gateway_response_values
    from fields
)

select *
from final

--To disable this model, set the using_credit_payment_history variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_credit_payment_history', True)) }}

with base as (

    select * 
    from {{ ref('stg_recurly__credit_payment_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_recurly__credit_payment_history_tmp')),
                staging_columns=get_coupon_redemption_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as credit_payment_id
        , cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
        , account_id
        , applied_to_invoice_id
        , original_invoice_id
        , refund_transaction_id
        , original_credit_payment_id
        , uuid
        , action
        , currency
        , cast(amount as {{ dbt_utils.type_float() }}) as amount
        , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at
        , cast(voided_at as {{ dbt_utils.type_timestamp() }}) as voided_at
    from fields
) 

select *
from final
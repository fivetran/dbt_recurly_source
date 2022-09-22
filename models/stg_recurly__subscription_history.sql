with base as (

    select *
    from {{ ref('stg_recurly__subscription_history_tmp') }}
),

fields as (

    select 
        {{ fivetran_utils.fill_staging_columns(
            source_columns = adapter.get_columns_in_relation(ref('stg_recurly__subscription_history_tmp')),
            staging_columns = get_subscription_history_columns()
        ) }}
    from base
),

final as (

    select  
        id as subscription_id
        , created_at
        , updated_at
        , activated_at
        , canceled_at
        , expires_at
        , paused_at
        , converted_at
        , account_id
        , plan_id
        , object
        , uuid
        , state
        , current_period_started_at
        , current_period_ends_at as current_period_ended_at
        , current_term_started_at
        , current_term_ends_at as current_term_ended_at
        , trial_started_at
        , trial_ends_at
        , remaining_billing_cycles
        , total_billing_cycles
        , renewal_billing_cycles
        , auto_renew as has_auto_renew
        , remaining_pause_cycles
        , currency
        , cast(unit_amount as {{ dbt_utils.type_float() }}) as unit_amount
        , quantity
        , add_ons_total
        , subtotal
        , collection_method
        , expiration_reason
        , started_with_gift as has_started_with_gift 
    from fields
)

select *
from final

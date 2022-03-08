with base as (
    select *
    from {{ ref('stg_recurly__subscription_history_tmp') }}
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
            source_columns = adapter.get_columns_in_relation(ref('stg_recurly__subscription_history_tmp')),
            staging_columns = get_subscription_history_columns()
        ) }}
    from
        base
),
final as (
    select
        id as subscription_id,
        created_at,
        updated_at,
        activated_at,
        canceled_at,
        expires_at,
        paused_at,
        converted_at,
        account_id,
        plan_id,
        object,
        uuid,
        status,
        current_period_started_at,
        current_period_ends_at as current_period_ended_at,
        current_term_started_at,
        current_term_ends_at as current_term_ended_at,
        trial_started_at,
        trial_ended_at,
        remaining_billing_cycles,
        total_billing_cycles,
        renewal_billing_cycles,
        auto_renew as has_auto_renew,
        remaining_pause_cycles,
        UPPER(currency) as currency,
        unit_amount,
        quantity,
        add_ons_total,
        subtotal,
        collection_method,
        expiration_reason,
        started_with_gift as has_started_with_gift,
        custom_coupon_code
    from
        fields
)
select *
from final

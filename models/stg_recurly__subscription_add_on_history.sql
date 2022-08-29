
with base as (

    select * 
    from {{ ref('stg_recurly__subscription_add_on_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_recurly__subscription_add_on_history_tmp')),
                staging_columns=get_subscription_add_on_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        created_at,
        expired_at,
        id,
        object,
        plan_add_on_id,
        quantity,
        subscription_id,
        unit_amount,
        updated_at
    from fields
)

select *
from final

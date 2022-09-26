{{ config(enabled=var('recurly__using_subscription_change_history', true)) }}

with base as (

    select * 
    from {{ ref('stg_recurly__subscription_change_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_recurly__subscription_change_history_tmp')),
                staging_columns=get_subscription_change_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as subscription_change_id, 
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at, 
        plan_id,
        subscription_id,
        object,
        unit_amount,
        quantity,
        cast(activate_at as {{ dbt_utils.type_timestamp() }}) as activate_at,
        activated,
        cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        cast(deleted_at as {{ dbt_utils.type_timestamp() }}) as deleted_at
    from fields
) 

select *
from final
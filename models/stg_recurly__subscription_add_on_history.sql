--To disable this model, set the using_subscription_add_on_history variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_subscription_add_on_history', True)) }}

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
        id as subscription_id,
        _fivetran_synced,
        created_at,
        expired_at,
        object,
        plan_add_on_id,
        quantity,
        subscription_id,
        cast(unit_amount as {{ dbt_utils.type_float() }}) as unit_amount,
        updated_at
    from fields
)

select *
from final

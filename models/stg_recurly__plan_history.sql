with base as (

    select *
    from {{ ref('stg_recurly__plan_history_tmp') }}
),

fields as (

    select 
        {{ 
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recurly__plan_history_tmp')),
                staging_columns = get_plan_history_columns()
            ) 
        }}
    from base
),

final as (

    select
        id as plan_id 
        , code
        , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at
        , cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
        , cast(deleted_at as {{ dbt_utils.type_timestamp() }}) as deleted_at
        , state
        , name
        , description
        , interval_unit
        , interval_length
        , trial_unit
        , trial_length
        , total_billing_cycles
        , auto_renew as has_auto_renew
        , accounting_code
        , setup_fee_accounting_code
        , tax_code
        , tax_exempt
    from fields
)

select *
from final

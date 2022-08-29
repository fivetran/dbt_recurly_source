
with base as (

    select * 
    from {{ ref('stg_recurly__coupon_redemption_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_recurly__coupon_redemption_history_tmp')),
                staging_columns=get_coupon_redemption_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        account_id,
        coupon_id,
        created_at,
        currency,
        discounted,
        id,
        removed_at,
        state,
        updated_at
    from fields
)

select *
from final

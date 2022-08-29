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
        _fivetran_synced,
        id,
        updated_at,
        account_id,
        applied_to_invoice_id,
        original_invoice_id,
        refund_transaction_id,
        original_credit_payment_id,
        uuid,
        action,
        currency,
        amount,
        created_at,
        voided_at
    from fields
) 

select *
from final
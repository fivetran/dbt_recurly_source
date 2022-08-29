
with base as (

    select * 
    from {{ ref('stg_recurly__account_note_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_recurly__account_note_history_tmp')),
                staging_columns=get_account_note_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        account_id,
        account_updated_at,
        created_at,
        id,
        message,
        object,
        user_email,
        user_id
    from fields
)

select *
from final

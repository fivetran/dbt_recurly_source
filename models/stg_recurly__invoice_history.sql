with base as (

    select *
    from {{ ref('stg_recurly__invoice_history_tmp') }}
),

fields as (

    select
        {{ fivetran_utils.fill_staging_columns(
            source_columns = adapter.get_columns_in_relation(ref('stg_recurly__invoice_history_tmp')),
            staging_columns = get_invoice_history_columns()
        ) }}
    from base
),

final as (

    select
        id as invoice_id 
        , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at
        , cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
        , cast(due_at as {{ dbt_utils.type_timestamp() }}) as due_at
        , cast(closed_at as {{ dbt_utils.type_timestamp() }}) as closed_at
        , account_id
        , previous_invoice_id
        , type
        , origin
        , state
        , number
        , collection_method
        , po_number
        , net_terms
        , currency
        , cast(balance as {{ dbt_utils.type_float() }}) as balance
        , paid
        , total
        , subtotal
        , refundable_amount
        , discount
        , tax
        , tax_type
        , tax_region
        , tax_rate
    from fields
)

select *
from final

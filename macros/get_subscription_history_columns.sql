{% macro get_subscription_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "activated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "canceled_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "converted_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "expires_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "account_id", "datatype": dbt_utils.type_string()},
    {"name": "plan_id", "datatype": dbt_utils.type_string()},
    {"name": "object", "datatype": dbt_utils.type_string()},
    {"name": "uuid", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "current_period_started_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "current_period_ends_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "current_term_started_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "current_term_ends_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "trial_started_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "trial_ends_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "remaining_billing_cycles", "datatype": dbt_utils.type_int()},
    {"name": "total_billing_cycles", "datatype": dbt_utils.type_int()},
    {"name": "renewal_billing_cycles", "datatype": dbt_utils.type_int()},
    {"name": "auto_renew", "datatype": "boolean"},
    {"name": "paused_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "remaining_pause_cycles", "datatype": dbt_utils.type_int()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "unit_amount", "datatype": dbt_utils.type_int()},
    {"name": "quantity", "datatype": dbt_utils.type_int()},
    {"name": "add_ons_total", "datatype": dbt_utils.type_int()},
    {"name": "subtotal", "datatype": dbt_utils.type_int()},
    {"name": "collection_method", "datatype": dbt_utils.type_string()},
    {"name": "expiration_reason", "datatype": dbt_utils.type_string()},
    {"name": "started_with_gift", "datatype": "boolean"} 
] %}

{{ return(columns) }}

{% endmacro %}

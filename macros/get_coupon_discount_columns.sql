{% macro get_coupon_discount_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_string()},
    {"name": "coupon_id", "datatype": dbt_utils.type_string()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "fivetran_id", "datatype": dbt_utils.type_string()},
    {"name": "percentage", "datatype": dbt_utils.type_string()},
    {"name": "trial_length", "datatype": dbt_utils.type_int()},
    {"name": "trial_unit", "datatype": dbt_utils.type_string()},
    {"name": "type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

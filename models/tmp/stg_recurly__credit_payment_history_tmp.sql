--To disable this model, set the using_credit_payment_history variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_credit_payment_history', True)) }}

select * 
from {{ var('credit_payment_history') }}

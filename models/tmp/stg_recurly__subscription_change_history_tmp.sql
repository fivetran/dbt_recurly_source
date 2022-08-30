--To disable this model, set the using_subscription_add_on_history variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_subscription_change_history', True)) }}

select * 
from {{ var('subscription_change_history') }}

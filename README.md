# Recurly 

This package models Recurly data from [Fivetran's connector](https://fivetran.com/docs/applications/recurly). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/recurly#schemainformation).

This package enriches your Fivetran data by doing the following:
* Add descriptions to tables and columns that are synced using Fivetran
* Add freshness tests to source data
* Add column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Model staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [Recurly modeling package](https://github.com/fivetran/dbt_recurly). The staging models are designed to:
* Name columns consistently across all packages:
    * Boolean fields are prefixed with `is_` or `has_`
    * Timestamps are appended with `_at`
    * ID primary keys are prefixed with the name of the table.  For example, the card table's ID column is renamed `card_id`.

## Configuration
By default, this package will look for your Recurly data in the `recurly` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Recurly data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
    recurly_schema: your_schema_name
    recurly_database: your_database_name 
```
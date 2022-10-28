## dbt_recurly_source v0.1.0

Happy Halloween 👻 ! We're excited to introduce the not-so-spooky Recurly source package!

This package is designed to enrich your Fivetran Recurly data by doing the following:

- Cleans, tests, and prepares your Google Play data from [Fivetran's connector](https://fivetran.com/docs/applications/recurly) for analysis.
- Add descriptions to tables and columns that are synced using Fivetran.
- Add freshness tests to source data.
- Add column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Model staging tables which leverage data in the format described [here](https://fivetran.com/docs/applications/recurly#schemainformation), which can then be used simultaneously with our [Recurly modeling transformation package](https://github.com/fivetran/dbt_recurly).
- Currently the package supports Postgres, Redshift, BigQuery, Databricks, and Snowflake. Additionally, this package is designed to work with dbt versions [">=1.0.0", "<2.0.0"].

For more information refer to the [README](https://github.com/fivetran/dbt_recurly_source/blob/main/README.md).

## Contributors
- Thanks to [@dimoschi](https://github.com/[dimoschi](https://github.com/dimoschi)) for submitting the initial source request and getting Recurly package development off the ground! ([#1](https://github.com/fivetran/dbt_recurly_source/pull/1))

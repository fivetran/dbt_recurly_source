# dbt_recurly_source v0.2.0

## 🚨 Breaking Changes 🚨:
[PR #7](https://github.com/fivetran/dbt_recurly_source/pull/7) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- Dependencies on `fivetran/fivetran_utils` have been upgraded, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.


# dbt_recurly_source v0.1.0
🎉 Initial Release 🎉
- This is the initial release of this package. 
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

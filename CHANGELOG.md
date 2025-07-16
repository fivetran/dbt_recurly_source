[PR #22](https://github.com/fivetran/dbt_recurly_source/pull/22) includes the following updates:

### Under the Hood - July 2025 Updates

- Updated conditions in `.github/workflows/auto-release.yml`.
- Added `.github/workflows/generate-docs.yml`.
- Added `+docs: show: False` to `integration_tests/dbt_project.yml`.
- Migrated `flags` (e.g., `send_anonymous_usage_stats`, `use_colors`) from `sample.profiles.yml` to `integration_tests/dbt_project.yml`.
- Updated `maintainer_pull_request_template.md` with improved checklist.
- Refreshed README tag block:
  - Standardized Quickstart-compatible badge set
  - Left-aligned and positioned below the H1 title.
- Updated Python image version to `3.10.13` in `pipeline.yml`.
- Added `CI_DATABRICKS_DBT_CATALOG` to:
  - `.buildkite/hooks/pre-command` (as an export)
  - `pipeline.yml` (under the `environment` block, after `CI_DATABRICKS_DBT_TOKEN`)
- Added `certifi==2025.1.31` to `requirements.txt` (if missing).
- Updated `.gitignore` to exclude additional DBT, Python, and system artifacts.

# dbt_recurly_source v0.4.0

[PR #21](https://github.com/fivetran/dbt_recurly_source/pull/21) includes the following updates:

## Breaking Change for dbt Core < 1.9.6

> *Note: This is not relevant to Fivetran Quickstart users.*

Migrated `freshness` from a top-level source property to a source `config` in alignment with [recent updates](https://github.com/dbt-labs/dbt-core/issues/11506) from dbt Core. This will resolve the following deprecation warning that users running dbt >= 1.9.6 may have received:

```
[WARNING]: Deprecated functionality
Found `freshness` as a top-level property of `recurly` in file
`models/src_recurly.yml`. The `freshness` top-level property should be moved
into the `config` of `recurly`.
```

**IMPORTANT:** Users running dbt Core < 1.9.6 will not be able to utilize freshness tests in this release or any subsequent releases, as older versions of dbt will not recognize freshness as a source `config` and therefore not run the tests.

If you are using dbt Core < 1.9.6 and want to continue running Recurly freshness tests, please elect **one** of the following options:
  1. (Recommended) Upgrade to dbt Core >= 1.9.6
  2. Do not upgrade your installed version of the `recurly_source` package. Pin your dependency on v0.3.1 in your `packages.yml` file.
  3. Utilize a dbt [override](https://docs.getdbt.com/reference/resource-properties/overrides) to overwrite the package's `recurly` source and apply freshness via the previous release top-level property route. This will require you to copy and paste the entirety of the previous release `src_recurly.yml` file and add an `overrides: recurly_source` property.

## Under the Hood
- Updates to ensure integration tests use latest version of dbt.

# dbt_recurly_source v0.3.1

This release introduces the following updates:

## Under the Hood
- Prepends `materialized` configs in the package's `dbt_project.yml` file with `+` to improve compatibility with the newer versions of dbt-core starting with v1.10.0. ([PR #19](https://github.com/fivetran/dbt_recurly_source/pull/19))
- Updates the package maintainer pull request template. ([PR #20](https://github.com/fivetran/dbt_recurly_source/pull/20))

## Documentation
- Corrected references to connectors and connections in the README. ([#18](https://github.com/fivetran/dbt_recurly_source/pull/18))

## Contributors
- [@b-per](https://github.com/b-per) ([PR #19](https://github.com/fivetran/dbt_recurly_source/pull/19))

# dbt_recurly_source v0.3.0
[PR #16](https://github.com/fivetran/dbt_recurly_source/pull/16) introduces the following updates:

## Breaking Changes
- Removed unused fields from `stg_recurly__subscription_history`:
  - `converted_at`
  - `has_started_with_gift`
- These fields were removed since they are planned for future deprecation in the Fivetran Connector and are not utilized in the downstream transformation package.

## Under the Hood:
- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job. [(#14)](https://github.com/fivetran/dbt_recurly_source/pull/14)
- Updated the pull request templates. [(#14)](https://github.com/fivetran/dbt_recurly_source/pull/14)

# dbt_recurly_source v0.2.1 
## 🪲 Bug Fixes 🔧
- Added `invoice_id` to the `unique_combination_of_columns` test on `stg_recurly__invoice_coupon_redemption_history` to handle cases where coupon redemptions are applied to multiple invoices. Also modified relevant seed files to test these changes ([PR #11](https://github.com/fivetran/dbt_recurly_source/pull/11)).
- Added `currency` to the `unique_combination_of_columns` tests on `stg_recurly__account_balance_history` and `stg_recurly__plan_currency_history` to account for plans and account balances that hold multiple currencies. Also modified relevant seed files to test these changes ([PR #11](https://github.com/fivetran/dbt_recurly_source/pull/11)).

## 👷 Contributors
- [@benigls](https://github.com/benigls) ([PR #11](https://github.com/fivetran/dbt_recurly_source/pull/11))

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

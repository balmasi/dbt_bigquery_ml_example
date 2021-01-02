{{ config(materialized='view') }}

/*  Use the last 91 passengers as test data, first 800 passengers as training data */
SELECT
    *
FROM
    {{ ref('features') }}
ORDER BY
    PassengerId DESC
LIMIT 91
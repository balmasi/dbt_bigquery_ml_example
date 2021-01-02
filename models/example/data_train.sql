{{ config(materialized='view') }}

/* Use the first 800 passengers as training data , next 91 as test data */
SELECT
    *
FROM
    {{ ref('features') }}
ORDER BY
    PassengerId
LIMIT 800
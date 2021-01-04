{{
    config(
        materialized='table'
    )
}}

WITH predict_features AS (
    SELECT
        * EXCEPT(Name, Ticket, PassengerId)
    FROM
        {{ ref('predict_me') }}
)

SELECT * FROM {{ dbt_ml.predict(ref('ml_logreg'), 'predict_features') }}
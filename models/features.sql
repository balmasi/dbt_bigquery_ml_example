WITH final AS (
    SELECT
        Survived AS label,
        * EXCEPT(Survived, Name, Ticket, PassengerId)
    FROM
        {{ ref('raw_titanic') }}
)
SELECT * FROM final
    
WITH source AS (
    SELECT * FROM {{ source('raw', 'loans') }}
)

SELECT
    loan_id,
    account_id,
    date,
    TRY_TO_DATE(CASE WHEN LEFT(date, 2) BETWEEN '50' AND '99' THEN '19' || date
         ELSE '20' || date END) AS loan_granted_date,
    amount,
    duration,
    payments,
    status
FROM source

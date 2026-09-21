WITH source AS (
    SELECT * FROM {{ source('raw', 'accounts') }}
)

SELECT
    account_id,
    district_id,
    CASE WHEN frequency = 'POPLATEK MESICNE' THEN 'Monthly'
         WHEN frequency = 'POPLATEK TYDNE' THEN 'Weekly'
         WHEN frequency = 'POPLATEK PO OBRATU' THEN 'On Transaction'
         ELSE frequency END AS statement_frequency,
    date,
    TRY_TO_DATE(CASE WHEN LEFT(date, 2) BETWEEN '50' AND '99' THEN '19' || date
         ELSE '20' || date END) AS creation_date
FROM source

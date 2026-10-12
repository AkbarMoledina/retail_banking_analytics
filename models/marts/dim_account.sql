SELECT
    sa.account_id,
    district_id,
    COALESCE(afm.english, sa.frequency) AS statement_frequency,
    sa.date,
    sa.creation_date
FROM {{ ref('stg_accounts') }} sa
LEFT JOIN {{ ref('account_frequency_mapping') }}  afm
ON sa.frequency = afm.czech
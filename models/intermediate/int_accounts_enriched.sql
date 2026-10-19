SELECT
    sa.account_id,
    sa.district_id,
    sd.client_id,
    COALESCE(afm.english, sa.frequency) AS statement_frequency,
    sa.account_creation_date
FROM {{ ref('stg_account') }} sa
LEFT JOIN {{ ref('stg_disposition') }} sd
ON sa.account_id = sd.account_id
AND sd.disposition_type = 'Owner'
LEFT JOIN {{ ref('account_frequency_mapping') }}  afm
ON sa.frequency = afm.czech
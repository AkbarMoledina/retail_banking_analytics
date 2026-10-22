SELECT
    {{ dbt_utils.generate_surrogate_key(['account_id']) }} AS account_sk,
    account_id,
    district_id,
    client_id,
    statement_frequency,
    {{ generate_date_id('account_creation_date') }} AS account_creation_date_id
FROM {{ ref('int_accounts_enriched') }}
SELECT
    l.loan_id,
    l.account_id,
    l.loan_granted_date,
    l.amount,
    l.duration,
    l.payments,
    sm.is_defaulted,
    sm.is_active
FROM {{ ref('stg_loan') }} l
LEFT JOIN {{ ref('loan_status_mapping') }} sm
ON l.status = sm.loan_status_code
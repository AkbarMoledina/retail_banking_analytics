{% macro format_timestamp_ntz(date_and_time) %}

    TRY_TO_TIMESTAMP_NTZ(CASE WHEN LEFT({{ date_and_time }}, 2) BETWEEN '50' AND '99' THEN '19' || {{ date_and_time }}
        ELSE '20' || {{ date_and_time }} END, 'YYYYMMDD HH24:MI:SS')

{% endmacro %}

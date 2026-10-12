{% macro format_date(date) %}
    TRY_TO_DATE(CASE WHEN LEFT({{ date }}, 2) BETWEEN '50' AND '99' THEN '19' || {{ date }}
         ELSE '20' || {{ date }} END, 'YYYYMMDD')
{% endmacro %}
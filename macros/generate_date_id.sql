{% macro generate_date_id(date) %}

    TO_CHAR({{ date }}, 'YYYYMMDD')::INT

{% endmacro %}
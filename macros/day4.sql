{% macro day4(partition_by, order_by, rows_between_min, rows_between_max, col='word') %}
string_agg(c, '') over (partition by {{partition_by}} order by {{order_by}} rows between {{rows_between_min}} and {{rows_between_max}}) as {{col}}
{% endmacro %}

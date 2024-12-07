{% macro day3() %}
select
    sum(
        list_reduce(
            list_transform(regexp_extract_all(op, '\d+'), x -> x::int),
            (x, y) -> x * y
        ) * enabled
    ) as answer
from transformed
where op ^@ 'mul'
{% endmacro %}
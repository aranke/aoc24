{% macro day2() %}
transformed as (
    select
        *,
        list_reduce(
            list_transform(
                range(1, len(l)),
                i -> l[i+1] > l[i]
            ),
            (x, y) -> x and y
        ) as is_increasing,
        list_reduce(
            list_transform(
                range(1, len(l)),
                i -> l[i+1] < l[i]
            ),
            (x, y) -> x and y
        ) as is_decreasing,
        list_reduce(
            list_transform(
                range(1, len(l)),
                i -> abs(l[i+1] - l[i]) between 1 and 3
            ),
            (x, y) -> x and y
        ) as difference_in_range
    from input
)

select count(distinct report_id) as answer
from transformed
where (is_increasing or is_decreasing) and difference_in_range
{% endmacro %}

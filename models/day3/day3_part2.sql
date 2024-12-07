with input as (
    select
        *,
        case
            when op = 'do()' then 1
            when op = 'don''t()' then 0
            else null
        end as flags
    from {{ ref('day3_part0') }}
),

transformed as (
    select
        *,
        coalesce(
            last_value(flags ignore nulls) over (order by op_id rows unbounded preceding),
            1
        ) as enabled
    from input
)

{{ day3() }}

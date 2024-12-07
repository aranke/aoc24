with transformed as (
    select
        *,
        1 as enabled
    from {{ ref('day3_part0') }}
)

{{ day3() }}

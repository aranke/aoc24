with input as (
    select
        report_id,
        unnest(range(1, len(levels) + 1)) as index_to_remove,
        levels[1:index_to_remove - 1] || levels[index_to_remove + 1:len(levels)] as l
    from {{ ref('day2_part0') }}
),

{{ day2() }}

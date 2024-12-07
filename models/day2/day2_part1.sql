with input as (
    select
        report_id,
        levels as l
    from {{ ref('day2_part0') }}
),

{{ day2() }}

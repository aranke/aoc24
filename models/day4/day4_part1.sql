with input as (
    select * from {{ ref('day4_part0') }}
),

sequences as (
    select {{ day4('y', 'x', 'current row', '3 following') }} from input
    union all
    select {{ day4('x', 'y', 'current row', '3 following') }} from input
    union all
    select {{ day4('d1', 'y', 'current row', '3 following') }} from input
    union all
    select {{ day4('d2', 'y', 'current row', '3 following') }} from input
)

select count(*) as answer
from sequences where word in ('XMAS', 'SAMX')

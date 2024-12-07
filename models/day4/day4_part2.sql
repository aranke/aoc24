with input as (
    select * from {{ ref('day4_part0') }}
),

sequences as (
    select
        {{ day4('d1', 'x', '1 preceding', '1 following', 's1') }},
        {{ day4('d2', 'x', '1 preceding', '1 following', 's2') }},
    from input
)

select count(*) as answer
from sequences where s1 in ('MAS', 'SAM') and s2 in ('MAS', 'SAM')

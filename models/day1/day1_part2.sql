with input as (
   select * from {{ ref('day1_part0') }}
),

l as (
   select lcol from input
),

r as (
   select
      rcol,
      count(*) as count
   from input
   group by 1
)

select sum(l.lcol * r.count) as answer
from l join r on l.lcol = r.rcol

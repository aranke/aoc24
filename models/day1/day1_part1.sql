with input as (
   select * from {{ ref('day1_part0') }}
),

l as (
   select
      lcol,
      row_number() over (order by lcol) as rank
   from input
),

r as (
   select
      rcol,
      row_number() over (order by rcol) as rank
   from input
)

select sum(abs(l.lcol - r.rcol)) as answer
from l join r on l.rank = r.rank

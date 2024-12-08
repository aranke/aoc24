select
    column0::int as before,
    column1::int as after
from {{ source('input', 'day5') }}
where after is not null

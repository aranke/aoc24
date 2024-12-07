select
    column0 as lcol,
    column3 as rcol
from {{ source('input', 'day1') }}

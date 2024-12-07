select
    generate_subscripts(string_split(column0, ''), 1) AS x,
    row_number() OVER () as y,
    unnest(string_split(column0, '')) as c,
    x - y as d1,
    x + y as d2
from {{ source('input', 'day4') }}

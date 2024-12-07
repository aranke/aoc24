select
    row_number() OVER () as report_id,
    list_transform(string_split(column0, ' '), x -> x::int) as levels
from {{ source('input', 'day2') }}

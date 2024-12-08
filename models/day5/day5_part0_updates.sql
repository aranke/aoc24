select
    row_number() over () as update_number,
    list_transform(string_split(column0, ','), x -> x::int) as page_numbers
from {{ source('input', 'day5') }}
where column1 is null

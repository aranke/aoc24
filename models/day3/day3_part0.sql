select
    row_number() OVER () as op_id,
    unnest(regexp_extract_all(content, 'mul\(\d+,\d+\)|do\(\)|don''t\(\)')) as op
from {{ source('input', 'day3') }}

with updates as (
    select * from {{ ref('day5_part0_updates') }}
),

updates_in_correct_order as (
    select
        u.update_number,
        sum(
            case
                when list_position(u.page_numbers, r.before) > list_position(u.page_numbers, r.after) then 1
                else 0
            end
        ) as rules_violated
    from updates as u
    cross join {{ ref('day5_part0_rules') }} as r
    group by 1
    having rules_violated = 0
)

select sum(u.page_numbers[len(u.page_numbers)//2+1]) as answer
from updates_in_correct_order as uico
inner join updates as u on uico.update_number = u.update_number

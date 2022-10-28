with segments as (
    select * from {{ ref('stg_loyalty_segments') }}
),
 
customers as (
    select * from {{ ref('stg_customers') }}
),
 
segment_customers as (
    select 
        loyalty_segment_id,
        count(*) as number_of_customers
    from customers
    group by 1
    order by 1
),
 
final as (
    select
        segments.loyalty_segment_id,
        segments.loyalty_segment_description,
        segment_customers.number_of_customers
    from segments
    left join segment_customers on segments.loyalty_segment_id = segment_customers.loyalty_segment_id
)
select * from final

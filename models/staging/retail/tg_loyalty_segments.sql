with source as (
    select * from {{ source('retail','loyalty_segments') }}
),
 
staged as (
    select 
        loyalty_segment_id,
        loyalty_segment_description,
        unit_threshold,
        to_date(from_unixtime(valid_from,'yyyy-MM-dd')) as valid_from_date, 
        to_date(from_unixtime(valid_to,'yyyy-MM-dd')) as valid_to_date, 
    from source
)
 
select * from staged
with source as (
      select * from "L30_DM_Sales"."pbi"."dim_Customer"
),
renamed as (
    select
        "Customer_Id" as customer_id,
        "Customer_Segment_Id" as customer_segment_id,
        "Country_Id" as country_id,
        "Customer_Source_Code" as customer_source_code

    from source
)
select * from renamed
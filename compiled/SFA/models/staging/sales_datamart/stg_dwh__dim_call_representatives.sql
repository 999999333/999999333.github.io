with source as (
      select * from "L30_DM_Sales"."pbi"."dim_Call_Representative"
),
renamed as (
    select
        "Call_Representative_Id" as call_representative_id,
        "Call_Representative_Label" as call_representative_label

    from source
)
select * from renamed
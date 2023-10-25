with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Staff"
),
renamed as (
    select
        "Country_Code",
        "Staff_id",
        "Staff_Code",
        "GeographyID",
        "Name",
        "LName",
        "FName",
        "SName",
        "BirthDate",
        "Location",
        "Dept",
        "Position",
        "Comment",
        "EMail",
        "StaffType_id",
        "Status",
        "DLM",
        "ULM",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed
with source as (
    select * from "DWH_Fabric"."dbt"."dbo_InaccessibilityReasons"
),

renamed as (
    select
        ----------  ids
        "Reason_id" as inaccessibility_reason_id,
        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "Reason" as reason,

        ----------  numerics
        "Status",
        "ULM",

        ----------  booleans

        ----------  timestamps
        "ExternalCode",
        "Valid_From",
        "Valid_To"

        ----------  omited
        --"IsLegal",
        --"DLM",


    from source
)

select * from renamed
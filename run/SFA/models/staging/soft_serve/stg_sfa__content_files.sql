
    


    
    

    EXEC('create view "dbt"."stg_sfa__content_files__dbt_tmp" as with
source as (select * from "DWH_Fabric"."dbt"."dbo_ContentFiles"),

renamed as (
    select
    
        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast("ContentFileID" as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Valid_From as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as _id,
        "ContentFileID" as content_file_id,
        "ContentID" as content_id,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "ContentFileName",
        "ContentFileUniqueName",
        "Hash",
        "Comment",

        ----------  numerics
        "Status",
        "ULM",
        "Size",

        ----------  booleans
        "IsEdited",

        ----------  timestamps
        "CreationDate",
        "ReceivingResultDate",
        "DLM",
        "Valid_From",
        "Valid_To"

        ----------  omited
        -- "Activity_ID",
        -- "PhotoTypeId",

    from source
)

select *
from renamed;');




    


    
    

    EXEC('create view "dbt"."stg_sfa__files__dbt_tmp" as with
source as (select * from "DWH_Fabric"."dbt"."dbo_ContentFiles"),

renamed as (
    select
    
        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(ContentFileID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as content_file_id,
        "ContentFileID" as content_file_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(ContentID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as sfa_file_id,
        "ContentID" as sfa_file_key,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_code,

        ----------  strings
        "ContentFileName" as sfa_file_name,
        "ContentFileUniqueName" as sfa_file_name_unique ,
        "Hash" as hash,
        "Comment" as comment,

        ----------  numerics
        "Status" as status,
        "Size" as size,

        ----------  booleans
        "IsEdited" as is_edited,

        ----------  timestamps
        "CreationDate",
        "ReceivingResultDate",
        "DLM" as dlm,
        "Valid_From",
        "Valid_To"

        ----------  omited
        -- "Activity_ID",
        -- "PhotoTypeId",
        -- "ULM",

    from source
)

select *
from renamed;');



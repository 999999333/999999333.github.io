
    


    
    

    EXEC('create view "dbt"."stg_sfa__outlet_distributions__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."dbo_OutletDistribution"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OLCard_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Product_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as distribution_id,
        
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OLCard_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as visit_id,
        "OLCard_ID" as visit_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Product_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as product_id,
        "Product_id" as product_key,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings

        ----------  numerics
        "Price" as price,
        ----------  booleans
        case
            when "IsPresent" = ''1'' then 1
            else 0
        end as is_present,
        "IsSetup" as is_setup

        ----------  timestamps
        -- "Valid_From",
        -- "Valid_To"

        ----------  omited
        -- "OutOfStockReason",        

    from source
)

select * from renamed;');



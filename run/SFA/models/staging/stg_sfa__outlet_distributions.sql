
    


    
    

    EXEC('create view "dbt"."stg_sfa__outlet_distributions__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."dbo_OutletDistribution"
),

renamed as (
    select

        ----------  ids
        
CONCAT(
        ISNULL(CAST(OLCard_ID AS NVARCHAR(MAX)), ''-1''),
        ISNULL(CAST(Valid_To AS NVARCHAR(MAX)), ''-1'')
    )
    as _surrogate_key

,
        "OLCard_ID" as visit_id,
        "Product_id" as product_id,
        
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

        ----------  booleans
        "IsPresent",

        ----------  timestamps
        "Valid_From",
        "Valid_To"

        ----------  omited
        -- "Price",
        -- "IsSetup",
        -- "OutOfStockReason",        

    from source
)

select * from renamed;');



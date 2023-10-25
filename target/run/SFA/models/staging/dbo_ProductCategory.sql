
    


    
    

    EXEC('create view "dbt"."dbo_ProductCategory__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ProductCategory"

),

renamed as (

    select
        country_code,
        prodcategory_id,
        prodcategoryname,
        prodcategoryshortname,
        sortorder,
        dlm,
        status,
        ulm,
        isconcurrent,
        prodcategorycode,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



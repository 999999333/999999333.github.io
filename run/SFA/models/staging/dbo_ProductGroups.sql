
    


    
    

    EXEC('create view "dbt"."dbo_ProductGroups__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ProductGroups"

),

renamed as (

    select
        country_code,
        prodgroup_id,
        prodgroupname,
        prodgroupshortname,
        sortorder,
        dlm,
        status,
        ulm,
        isconcurrent,
        prodcategory_id,
        prodgroupcode,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



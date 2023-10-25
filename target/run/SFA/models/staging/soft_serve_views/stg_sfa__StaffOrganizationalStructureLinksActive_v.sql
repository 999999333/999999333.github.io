
    


    
    

    EXEC('create view "dbt"."stg_sfa__StaffOrganizationalStructureLinksActive_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_StaffOrganizationalStructureLinksActive_v"
),
renamed as (
    select
        *

    from source
)
select * from renamed;');



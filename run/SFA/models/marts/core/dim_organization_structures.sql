
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."dim_organization_structures__dbt_tmp_temp_view" as 

with org_structure as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__organization_structures_v"
),

final as (
    select
        org_structure.organizational_structure_id,
        org_structure.structure_node_key,
        org_structure.structure_node_level,
        org_structure.structure_node_tree_hierarchy,
        org_structure.country_id,
        org_structure.country_code,
        org_structure.structure_whole_node_tree,
        org_structure.structure_name,
        org_structure.structure_telephone,
        org_structure.structure_email,
        org_structure.structure_name_detail

    from
        org_structure
)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."dim_organization_structures__dbt_tmp" AS (SELECT * FROM "dbt"."dim_organization_structures__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."dim_organization_structures__dbt_tmp_temp_view";');




  
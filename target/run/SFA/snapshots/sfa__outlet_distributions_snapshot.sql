
      
  
    
   

   

    
    


    
    

    EXEC('create view "snapshots"."sfa__outlet_distributions_snapshot_temp_view" as 

    select *,
        
    CONVERT(VARCHAR(32), HashBytes(''MD5'', 
        coalesce(cast(concat(Country_Code, OLCard_ID, Product_id) as varchar(8000)), '''')  + ''|'' + 
    
        coalesce(cast(DLM as varchar(8000)), '''') 
    ), 2)
 as dbt_scd_id,
        DLM as dbt_updated_at,
        DLM as dbt_valid_from,
        nullif(DLM, DLM) as dbt_valid_to
    from (
        

    

    select 
    *
    from "DWH_Fabric"."dbt"."dbo_OutletDistribution_v"

    ) sbq


;');



    
      EXEC('CREATE TABLE "snapshots"."sfa__outlet_distributions_snapshot" AS (SELECT * FROM "snapshots"."sfa__outlet_distributions_snapshot_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "snapshots"."sfa__outlet_distributions_snapshot_temp_view";');




  
  
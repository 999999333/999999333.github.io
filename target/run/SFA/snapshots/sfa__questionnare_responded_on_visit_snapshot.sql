
      
  
    
   

   

    
    


    
    

    EXEC('create view "snapshots"."sfa__questionnare_responded_on_visit_snapshot_temp_view" as 

    select *,
        
    CONVERT(VARCHAR(32), HashBytes(''MD5'', 
        coalesce(cast(concat(Country_Code, Response_ID) as varchar(8000)), '''')  + ''|'' + 
    
        coalesce(cast(DLM as varchar(8000)), '''') 
    ), 2)
 as dbt_scd_id,
        DLM as dbt_updated_at,
        DLM as dbt_valid_from,
        nullif(DLM, DLM) as dbt_valid_to
    from (
        

    

    select 
    *
    from "DWH_Fabric"."dbt"."dbo_QuestionnaireResponseOnVisit_v"

    ) sbq


;');



    
      EXEC('CREATE TABLE "snapshots"."sfa__questionnare_responded_on_visit_snapshot" AS (SELECT * FROM "snapshots"."sfa__questionnare_responded_on_visit_snapshot_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "snapshots"."sfa__questionnare_responded_on_visit_snapshot_temp_view";');




  
  
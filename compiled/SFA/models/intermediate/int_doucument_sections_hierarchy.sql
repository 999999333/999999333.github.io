with source as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__document_sections"
),


SELECT 
    t1.Section_ID AS Level1_ID,
    t2.Section_ID AS Level2_ID,
    t3.Section_ID AS Level3_ID,
    t4.Section_ID AS Level4_ID,
    t5.Section_ID AS Level5_ID
FROM 
    source AS t1
LEFT JOIN 
    source AS t2 ON t1.Section_ID = t2.ParentSection_ID
LEFT JOIN 
    source AS t3 ON t2.Section_ID = t3.ParentSection_ID
LEFT JOIN 
    source AS t4 ON t3.Section_ID = t4.ParentSection_ID
LEFT JOIN 
    source AS t5 ON t4.Section_ID = t5.ParentSection_ID
WHERE 
    t1.ParentSection_ID IS NULL;

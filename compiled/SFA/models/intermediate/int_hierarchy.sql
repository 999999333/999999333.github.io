with source as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__document_sections"
),


hierarchy AS (
    -- Base case: Get rows with no parent (top-level nodes)
    SELECT 
        1 AS level,
        questionnaire_section_id,
        questionnaire_section_parent_id
    FROM source
    WHERE questionnaire_section_parent_id IS NULL

    UNION ALL

    -- Recursive case: Get child nodes
    SELECT 
        h.level + 1,
        t.questionnaire_section_id,
        t.questionnaire_section_parent_id
    FROM source t
    JOIN hierarchy h ON t.questionnaire_section_parent_id = h.questionnaire_section_id
)

SELECT * FROM hierarchy

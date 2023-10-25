

with document as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__documents"

),

document_section as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__document_sections"

),

document_item as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__document_items"

),

final as (
    select 
        document_item.country_id,
        document_item.country_code,


        document.document_name,
        document.document_details,
        document.document_external_code,
        document.document_status,

        
        
        
        document.dbt_valid_from,
        
        
        
        document.dbt_valid_to

        from document 
        left join document as document2
        on document.document_id = document2.document_id and document.dbt_valid_to < document2.dbt_valid_to
        where document2.document_id is null

)

select * from final
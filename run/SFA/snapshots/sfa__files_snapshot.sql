
      
  merge into "L50_SB_Vitek"."snapshots"."sfa__content_files_snapshot" as DBT_INTERNAL_DEST
    using "L50_SB_Vitek"."snapshots"."#sfa__content_files_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
    on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id

    when matched
     and DBT_INTERNAL_DEST.dbt_valid_to is null
     and DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete')
        then update
        set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to

    when not matched
     and DBT_INTERNAL_SOURCE.dbt_change_type = 'insert'
        then insert ("Country_Code", "ContentFileID", "ContentID", "ContentFileName", "ContentFileUniqueName", "Hash", "Status", "DLM", "ULM", "Comment", "PhotoTypeId", "Size", "Activity_ID", "CreationDate", "IsEdited", "ReceivingResultDate", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
        values ("Country_Code", "ContentFileID", "ContentID", "ContentFileName", "ContentFileUniqueName", "Hash", "Status", "DLM", "ULM", "Comment", "PhotoTypeId", "Size", "Activity_ID", "CreationDate", "IsEdited", "ReceivingResultDate", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")

;

  
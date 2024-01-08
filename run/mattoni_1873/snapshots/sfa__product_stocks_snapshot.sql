
      
  merge into "L50_SB_Vitek"."snapshots"."sfa__product_stocks_snapshot" as DBT_INTERNAL_DEST
    using "L50_SB_Vitek"."snapshots"."#sfa__product_stocks_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
    on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id

    when matched
     and DBT_INTERNAL_DEST.dbt_valid_to is null
     and DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete')
        then update
        set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to

    when not matched
     and DBT_INTERNAL_SOURCE.dbt_change_type = 'insert'
        then insert ("Country_Code", "W_id", "Product_id", "Stock", "Required", "DLM", "StockEditAdd", "StockEditTotal", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
        values ("Country_Code", "W_id", "Product_id", "Stock", "Required", "DLM", "StockEditAdd", "StockEditTotal", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")

;

  
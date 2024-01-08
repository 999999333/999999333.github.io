with source as (
      select * from "L01_Stage"."sap"."bad_with_cost_closed_v"
),
renamed as (
    select
        "document_id",
        "document_type",
        "document_number",
        "document_item_number",
        "country_id",
        "document_date_id",
        "sold_to_customer_id",
        "sales_channel_level_1_code",
        "sales_channel_level_1_name",
        "sales_channel_level_2_code",
        "sales_channel_level_2_name",
        "sales_channel_level_3_code",
        "sales_channel_level_3_name",
        "sales_channel_level_4_code",
        "sales_channel_level_4_name",
        "ship_to_customer_id" as shipto_customer_id,
        "bill_to_customer_id" as soldto_customer_id,
        "payer_customer_id" as payer_id,
        "sold_by_cr_id" as call_representative_id,
        "sales_route_id",
        "distributor_id",
        "product_id",
        "material_type_code",
        "currency_id",
        "order_type_id",
        "distribution_channel",
        "payment_term",
        "order_reason_id",
        "payment_term_category_id",
        "rrc_quantity" as rrc_quantity,
        "rrc_quantity_ord",
        "rrc_quantity_del",
        "rrc_quantity_inv",
        "rc_quantity",
        "rc_quantity_ord",
        "rc_quantity_del",
        "rc_quantity_inv",
        "oz8_quantity" as oz8_quantity,
        "oz8_quantity_ord",
        "oz8_quantity_del",
        "oz8_quantity_inv",
        "liter_quantity" as liter_quantity,
        "liter_quantity_ord",
        "liter_quantity_del",
        "liter_quantity_inv",
        "piece_quantity" as piece_quantity,
        "piece_quantity_ord",
        "piece_quantity_del",
        "piece_quantity_inv",
        "net_value_lc" as net_revenue_lc,
        "net_value_ord_lc",
        "net_value_del_lc",
        "net_value_inv_lc",
        "discount_value_lc",
        "discount_value_ord_lc",
        "discount_value_del_lc",
        "discount_value_inv_lc",
        "net_value_usd",
        "net_value_ord_usd",
        "net_value_del_usd",
        "net_value_inv_usd",
        "dv_old",
        "discount_value_usd",
        "discount_value_ord_usd",
        "discount_value_del_usd",
        "discount_value_inv_usd",
        "pvc_lc",
        "pvc_ord_lc",
        "pvc_del_lc",
        "pvc_inv_lc",
        "pvc_usd",
        "pvc_ord_usd",
        "pvc_del_usd",
        "pvc_inv_usd",
        "cda_lc",
        "cda_ord_lc",
        "cda_del_lc",
        "cda_inv_lc",
        "cda_usd",
        "cda_ord_usd",
        "cda_del_usd",
        "cda_inv_usd",
        "fmoh_lc",
        "fmoh_ord_lc",
        "fmoh_del_lc",
        "fmoh_inv_lc",
        "fmoh_usd",
        "fmoh_ordusd",
        "fmoh_del_usd",
        "fmoh_inv_usd",
        "pt_lc",
        "pt_ord_lc",
        "pt_del_lc",
        "pt_inv_lc",
        "pt_usd",
        "pt_ord_usd",
        "pt_del_usd",
        "pt_inv_usd",
        "mc_lc",
        "mc_ord_lc",
        "mc_del_lc",
        "mc_inv_lc",
        "mc_usd",
        "mc_ord_usd",
        "mc_del_usd",
        "mc_inv_usd",
        "gross_profit_lc",
        "gross_profit_ord_lc",
        "gross_profit_del_lc",
        "gross_profit_inv_lc",
        "gross_profit_usd",
        "gross_profit_ord_usd",
        "gross_profit_del_usd",
        "gross_profit_inv_usd",
        "cogs_lc",
        "cogs_ord_lc",
        "cogs_del_lc",
        "cogs_inv_lc",
        "cogs_usd",
        "cogs_ord_usd",
        "cogs_del_usd",
        "cogs_inv_usd"

    from source
)
select * from renamed
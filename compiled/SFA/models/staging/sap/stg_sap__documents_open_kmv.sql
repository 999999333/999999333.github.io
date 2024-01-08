with source as (
      select * from "L01_Stage"."kmv"."consolidated_open_v"
),
renamed as (
    select
        "country_id",
        "company_code",
        "document_type",
        "document_number",
        "document_item_number",
        "order_number",
        "order_item_number",
        "document_date_id",
        "soldto_customer_id",
        "shipto_customer_id",
        "payer_customer_id",
        "product_id",
        "order_type_id",
        "rrc_quantity_ordered",
        "rrc_quantity_delivered",
        "rrc_quantity_invoiced",
        "rrc_quantity_bad" as rrc_quantity,
        "rc_quantity_ordered",
        "rc_quantity_delivered",
        "rc_quantity_invoiced",
        "rc_quantity_bad",
        "oz8_quantity_ordered",
        "oz8_quantity_delivered",
        "oz8_quantity_invoiced",
        "oz8_quantity_bad" as oz8_quantity,
        "liter_quantity_ordered",
        "liter_quantity_delivered",
        "liter_quantity_invoiced",
        "liter_quantity_bad" as liter_quantity,
        "piece_quantity_ordered",
        "piece_quantity_delivered",
        "piece_quantity_invoiced",
        "piece_quantity_bad" as piece_quantity,
        "kg_quantity_ordered",
        "kg_quantity_delivered",
        "kg_quantity_invoiced",
        "kg_quantity_bad",
        "net_value_local_ordered",
        "net_value_local_delivered",
        "net_value_local_invoiced",
        "net_value_local_bad" as net_revenue_lc,
        "net_value_czk_ordered",
        "net_value_czk_delivered",
        "net_value_czk_invoiced",
        "net_value_czk_bad" as net_revenue_czk,
        "gross_revenue_local",
        "promo_discount_local",
        "customer_discount_local",
        "free_goods_discount_local",
        "gross_revenue_czk",
        "promo_discount_czk",
        "customer_discount_czk",
        "free_goods_discount_czk"

    from source
)
select * from renamed
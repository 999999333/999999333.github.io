
    


    
    

    EXEC('create view "dbt"."cust_OrdersDataMart__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."cust_OrdersDataMart"

),

renamed as (

    select
        country_code,
        cust_id,
        monthid,
        os_namel1,
        os_codel1,
        os_namel2,
        os_codel2,
        os_namel3,
        os_codel3,
        os_namel4,
        os_codel4,
        os_namel5,
        os_codel5,
        os_namel6,
        os_codel6,
        os_namel7,
        os_codel7,
        os_srstaff,
        outlet_swcode,
        outlet_erpcode,
        outlet_legalname,
        outlet_legaladdress,
        outlet_actualname,
        outlet_deliveryaddress,
        outlet_status,
        outlet_network,
        outlet_subtype,
        outlet_type,
        outlet_group,
        product_category,
        product_type,
        product_swcode,
        product_code,
        product_name,
        product_shortname,
        product_barcode,
        product_packageqty,
        visit_number,
        visit_date,
        orderintothevisit,
        order_date,
        order_number,
        paymentform,
        paymentformtype,
        order_type,
        warehouse_code,
        warehouse_shortname,
        warehouse_name,
        warehouse_type,
        order_qty,
        order_pricewithoutvat,
        order_pricewithvat,
        order_sumwithoutvat,
        order_sumwithvat,
        order_packageqty,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



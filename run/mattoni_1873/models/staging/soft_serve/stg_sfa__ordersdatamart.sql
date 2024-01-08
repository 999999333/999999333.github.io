
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__ordersdatamart__dbt_tmp" as
        with source as (
    select * from "L01_Stage"."sfa"."cust_OrdersDataMart"
),

renamed as (
    select
        "Country_Code",
        "Cust_id",
        "MonthID",
        "OS_NameL1",
        "OS_CodeL1",
        "OS_NameL2",
        "OS_CodeL2",
        "OS_NameL3",
        "OS_CodeL3",
        "OS_NameL4",
        "OS_CodeL4",
        "OS_NameL5",
        "OS_CodeL5",
        "OS_NameL6",
        "OS_CodeL6",
        "OS_NameL7",
        "OS_CodeL7",
        "OS_SRStaff",
        "Outlet_SWCode",
        "Outlet_ERPCode",
        "Outlet_LegalName",
        "Outlet_LegalAddress",
        "Outlet_ActualName",
        "Outlet_DeliveryAddress",
        "Outlet_Status",
        "Outlet_Network",
        "Outlet_SubType",
        "Outlet_Type",
        "Outlet_Group",
        "Product_Category",
        "Product_Type",
        "Product_SWCode",
        "Product_Code",
        "Product_Name",
        "Product_ShortName",
        "Product_BarCode",
        "Product_PackageQty",
        "Visit_Number",
        "Visit_Date",
        "OrderIntoTheVisit",
        "Order_Date",
        "Order_Number",
        "PaymentForm",
        "PaymentFormType",
        "Order_Type",
        "Warehouse_Code",
        "Warehouse_ShortName",
        "Warehouse_Name",
        "Warehouse_Type",
        "Order_Qty",
        "Order_PriceWithoutVAT",
        "Order_PriceWithVAT",
        "Order_SumWithoutVAT",
        "Order_SumWithVAT",
        "Order_PackageQty",
        "Valid_From",
        "Valid_To"

    from source
)

select * from renamed
    ');



    


    
    

    EXEC('create view "dbt"."stg_sfa__OutletOrderH_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutletOrderH_v"
),
renamed as (
    select
        "Country_Code",
        "OlCard_id",
        "OrderNo",
        "OlOrderDate",
        "OrderExecutionDate",
        "PayForm_id",
        "ResponsiblePerson",
        "OLOrderAmount",
        "Discount",
        "Cust_id",
        "ConsumerUnit",
        "OrderYear",
        "OrderMonth",
        "OrderWeek",
        "OlDeliveryAddress",
        "VATCalcMode",
        "VAT_Sum",
        "ProxySeries",
        "ProxyNumber",
        "ProxyDate",
        "TransportCost",
        "Operation_id",
        "W_id",
        "Comments",
        "IsReturn",
        "TaxFactureNo",
        "IsLocalProducts",
        "HasUnboundPayments",
        "SyncWithDBF",
        "DLM",
        "PayDate",
        "IsConfirm",
        "OrderInPackages",
        "OrderingTime",
        "Signature",
        "PComp_id",
        "CustNumber",
        "PayFormType",
        "InvestmentId",
        "NextVisitDate",
        "Postpay",
        "SyncMMDate",
        "PCDistr_id",
        "DistributorEntity",
        "IsPromoActivity",
        "PromoActivities_ID",
        "AcceptStatus",
        "BaseOrderNo",
        "AgreementId"
        --"Valid_From",
       -- "Valid_To"

    from source
)
select * from renamed;');



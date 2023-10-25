
    


    
    

    EXEC('create view "dbt"."stg_sfa__distributions_datamart__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."cust_DistributionsDataMart"
),

renamed as (
    select
        "Country_Code",
        "ASMMonthOfVisit",
        "ASMYearOfVisit",
        "Ol_id",
        "OutletExternalCode",
        "OutletName",
        "OutletAddress",
        "ASMOlCardId",
        "SROlCardId",
        "ASMName",
        "ASMStaffName",
        "SRName",
        "SRStaffName",
        "ASMDate",
        "SRDate",
        "ASMLastVisitInMonth",
        "ASMQuestionExternalCode",
        "SRQuestionExternalCode",
        "ProdGroupName",
        "ProductCode",
        "ProductName",
        "ASMCheck",
        "ASMOOSReason",
        "SRCheck",
        "SROOSReason",
        "MonthID",
        "ASMCustId",
        "Valid_From",
        "Valid_To"

    from source
)

select * from renamed;');



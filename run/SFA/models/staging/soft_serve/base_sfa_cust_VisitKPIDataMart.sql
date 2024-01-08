
    USE [L50_SB_Vitek];
    execute('create view "sfa"."base_sfa_cust_VisitKPIDataMart__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sfa"."cust_VisitKPIDataMart"
),
renamed as (
    select
        "Country_Code",
        "VisitDate",
        "Month",
        "IsLastVisit",
        "ClosedMonth",
        "OlCard_id",
        "Country",
        "City",
        "Area",
        "Supervisor",
        "ASM",
        "SR",
        "OutletGroups",
        "OutletTypes",
        "OLSubTypeName",
        "Network",
        "AtrernativeOutletClassification",
        "OL_id",
        "OLCode",
        "OLName",
        "OLAddress",
        "Payer",
        "VisitCycle",
        "VisitDays",
        "VisitFrequency",
        "SGR",
        "PricelistID",
        "Listing",
        "delinst",
        "AdditionalName",
        "VersionId",
        "KpiId",
        "KName0",
        "KName1",
        "KName2",
        "KName3",
        "KName4",
        "KName5",
        "KPISPTT",
        "KPICalcStatus",
        "KTypeName",
        "KLevel",
        "KExternalCode",
        "KNameALL",
        "Actual",
        "TargetKPI",
        "TargetSP",
        "MonthID",
        "Cust_id",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed
    ');


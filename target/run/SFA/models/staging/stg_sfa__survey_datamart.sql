
    


    
    

    EXEC('create view "dbt"."stg_sfa__survey_datamart__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."cust_SurveyDataMart"
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
        "UniqGroup",
        "ASMDocument_ID",
        "SRDocument_ID",
        "QuestionExternalCodeRN",
        "QKeyValue",
        "OrderKey",
        "QuestionExternalCode",
        "Question",
        "ASMResponse",
        "SRResponse",
        "MonthID",
        "ASMCustId",
        "Valid_From",
        "Valid_To"

    from source
)

select * from renamed;');



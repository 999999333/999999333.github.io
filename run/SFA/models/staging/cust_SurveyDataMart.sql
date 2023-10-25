
    


    
    

    EXEC('create view "dbt"."cust_SurveyDataMart__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."cust_SurveyDataMart"

),

renamed as (

    select
        country_code,
        asmmonthofvisit,
        asmyearofvisit,
        ol_id,
        outletexternalcode,
        outletname,
        outletaddress,
        asmolcardid,
        srolcardid,
        asmname,
        asmstaffname,
        srname,
        srstaffname,
        asmdate,
        srdate,
        asmlastvisitinmonth,
        uniqgroup,
        asmdocument_id,
        srdocument_id,
        questionexternalcodern,
        qkeyvalue,
        orderkey,
        questionexternalcode,
        question,
        asmresponse,
        srresponse,
        monthid,
        asmcustid,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



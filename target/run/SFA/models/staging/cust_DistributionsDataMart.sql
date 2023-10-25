
    


    
    

    EXEC('create view "dbt"."cust_DistributionsDataMart__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."cust_DistributionsDataMart"

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
        asmquestionexternalcode,
        srquestionexternalcode,
        prodgroupname,
        productcode,
        productname,
        asmcheck,
        asmoosreason,
        srcheck,
        sroosreason,
        monthid,
        asmcustid,
        valid_from,
        valid_to

    from source

)

select * from renamed;');




    


    
    

    EXEC('create view "dbt"."dbo_OutletOrderH__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutletOrderH"

),

renamed as (

    select
        country_code,
        olcard_id,
        orderno,
        olorderdate,
        orderexecutiondate,
        payform_id,
        responsibleperson,
        olorderamount,
        discount,
        cust_id,
        consumerunit,
        orderyear,
        ordermonth,
        orderweek,
        oldeliveryaddress,
        vatcalcmode,
        vat_sum,
        proxyseries,
        proxynumber,
        proxydate,
        transportcost,
        operation_id,
        w_id,
        comments,
        isreturn,
        taxfactureno,
        islocalproducts,
        hasunboundpayments,
        syncwithdbf,
        dlm,
        paydate,
        isconfirm,
        orderinpackages,
        orderingtime,
        signature,
        pcomp_id,
        custnumber,
        payformtype,
        investmentid,
        nextvisitdate,
        postpay,
        syncmmdate,
        pcdistr_id,
        distributorentity,
        ispromoactivity,
        promoactivities_id,
        acceptstatus,
        baseorderno,
        agreementid,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



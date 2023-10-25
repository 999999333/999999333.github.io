with source as (

    select * from "SFA_Warehouse"."dbt"."cust_VisitKPIDataMart"

),

renamed as (

    select
        country_code,
        visitdate,
        month,
        islastvisit,
        closedmonth,
        olcard_id,
        country,
        city,
        area,
        supervisor,
        asm,
        sr,
        outletgroups,
        outlettypes,
        olsubtypename,
        network,
        atrernativeoutletclassification,
        ol_id,
        olcode,
        olname,
        oladdress,
        payer,
        visitcycle,
        visitdays,
        visitfrequency,
        sgr,
        pricelistid,
        listing,
        delinst,
        additionalname,
        versionid,
        kpiid,
        kname0,
        kname1,
        kname2,
        kname3,
        kname4,
        kname5,
        kpisptt,
        kpicalcstatus,
        ktypename,
        klevel,
        kexternalcode,
        knameall,
        actual,
        targetkpi,
        targetsp,
        monthid,
        cust_id,
        valid_from,
        valid_to

    from source

)

select * from renamed
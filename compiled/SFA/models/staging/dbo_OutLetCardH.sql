with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutLetCardH"

),

renamed as (

    select
        country_code,
        ol_id,
        merch_id,
        olcard_id,
        olcarddate,
        begintime,
        endtime,
        inaccessible,
        reason_id,
        comments,
        olcardyear,
        olcardmonth,
        olcardweek,
        distributioncapturemode,
        commentsdestination,
        route_id,
        visittimesec,
        facingcapturemode,
        syncwithdbf,
        orgstructureid,
        cust_id,
        olcardtype,
        syncmainwithdbf,
        quickorder,
        delegatedorgstructureid,
        endtimechange,
        status,
        dlm,
        isfromddb,
        hasstartimage,
        hasendimage,
        distancetooutlet,
        completionreasonts,
        t1commentts,
        incomplete,
        distancetooutlet_end,
        documentisfilled,
        userstepcount,
        valid_from,
        valid_to

    from source

)

select * from renamed
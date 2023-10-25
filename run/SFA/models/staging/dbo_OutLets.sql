
    


    
    

    EXEC('create view "dbt"."dbo_OutLets__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutLets"

),

renamed as (

    select
        country_code,
        ol_id,
        olsubtype_id,
        area_id,
        olname,
        oltradingname,
        oldirector,
        oladdress,
        oldeliveryaddress,
        oltelephone,
        olfax,
        olemail,
        olaccountant,
        olaccountantphone,
        olmarkmanager,
        olmarkmanagerphone,
        olpurchmanager,
        olopentime,
        olclosetime,
        olbreaktimefrom,
        olbreaktimeto,
        zkpo,
        ipn,
        vatn,
        rr,
        network_id,
        olsize,
        olwhsize,
        visitrate_id,
        olstockcoverdays,
        cashflow_id,
        dlm,
        status,
        olcode,
        proximity,
        location,
        visitfrequency,
        ol_code,
        bankcode,
        bankname,
        bankaddress,
        owner_id,
        contractnumber,
        contractdate,
        parentcomp_id,
        creationdate,
        cust_id,
        cpcode,
        dc_allow,
        oldistributioncentre,
        oldistributionshare,
        dc_delivery,
        dc_payer,
        licenseusage,
        appartments,
        kladr_id,
        contractdatefinish,
        at_id,
        ulm,
        saletype,
        orgstructureid,
        geographyid,
        deliverydelay,
        deactivatedate,
        externalformat_id,
        block,
        blockletter,
        houseletter,
        place,
        comment,
        closereason,
        inactivationcandidate,
        hascoordinates,
        houseid,
        prevol_code,
        postalcode,
        koatuu,
        outletparsingaddressid,
        returnorderonly,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



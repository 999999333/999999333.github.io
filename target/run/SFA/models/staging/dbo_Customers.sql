
    


    
    

    EXEC('create view "dbt"."dbo_Customers__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_Customers"

),

renamed as (

    select
        country_code,
        cust_id,
        cust_name,
        cust_tradingname,
        zkpo,
        mfo,
        bank_account,
        tax_number,
        vat_number,
        cust_address,
        cust_tradingaddress,
        bank_name,
        director,
        city_id,
        email,
        phone,
        tradingphone,
        comments,
        distr_id,
        passwd,
        dlm,
        status,
        payformminvalue,
        payformcurrentvalue,
        payformmaxvalue,
        discountminvalue,
        discountcurrentvalue,
        discountmaxvalue,
        lastsyncdatetime,
        renewsupervisorpasswd,
        renewadminpasswd,
        ulm,
        desktopoutletminvalue,
        desktopoutletcurrentvalue,
        desktopoutletmaxvalue,
        desktoporderminvalue,
        desktopordercurrentvalue,
        desktopordermaxvalue,
        merchminvalue,
        merchmaxvalue,
        desktoprouteminvalue,
        desktoproutecurrentvalue,
        desktoproutemaxvalue,
        desktopvisitminvalue,
        desktopvisitcurrentvalue,
        desktopvisitmaxvalue,
        checkschedule,
        area_id,
        ieconfiguration,
        salesorgcode,
        isblocked,
        syncinprogress,
        ol_id,
        geographyid,
        is2levelmode,
        warehousebaseid,
        externalcode,
        db_id,
        isinexchangeequipment,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



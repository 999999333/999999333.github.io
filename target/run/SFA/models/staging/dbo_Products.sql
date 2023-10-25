
    


    
    

    EXEC('create view "dbt"."dbo_Products__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_Products"

),

renamed as (

    select
        country_code,
        product_id,
        productcode,
        producttype_id,
        productname,
        productshortname,
        unit_id,
        unitweight,
        package_qty,
        sortorder,
        dlm,
        status,
        ulm,
        price,
        ismix,
        istare,
        tare_id,
        tarepack_qty,
        isreturnable,
        isconcurrent,
        productvolume,
        isproductweight,
        certificateno,
        certificatebegindate,
        certificateenddate,
        hlcode,
        isbonuse,
        eancode,
        licensetype_id,
        productbrand_id,
        delisted,
        quant_qty,
        productcode2,
        synctoddb,
        servicebit,
        ispromotional,
        islinkedtoallcustomers,
        frontwidth,
        frontheight,
        hasactivecontentfile,
        isseasonal,
        isbaseproduct,
        forrecognition,
        isexchangebottle,
        isposm,
        valid_from,
        valid_to

    from source

)

select * from renamed;');



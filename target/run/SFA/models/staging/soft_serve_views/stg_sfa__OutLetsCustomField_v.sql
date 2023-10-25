
    


    
    

    EXEC('create view "dbt"."stg_sfa__OutLetsCustomField_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutLetsCustomField_v"
),
renamed as (
    select
        "Country_Code",
        "CustomKey",
        "FI1",
        "FI2",
        "FI3",
        "FI4",
        "FI5",
        "FI6",
        "FI7",
        "FI8",
        "FI9",
        "FI10",
        "FI11",
        "FI12",
        "FI13",
        "FI14",
        "FI15",
        "FI16",
        "FI17",
        "FI18",
        "FI19",
        "FI20",
        "FI21",
        "FI22",
        "FI23",
        "FI24",
        "FI25",
        "FI26",
        "FI27",
        "FI28",
        "FI29",
        "FI30",
        "FI31",
        "FI32",
        "FI33",
        "FI34",
        "FI35",
        "FI36",
        "FI37",
        "FI38",
        "FI39",
        "FI40",
        "FS1",
        "FS2",
        "FS3",
        "FS4",
        "FS5",
        "FS6",
        "FS7",
        "FS8",
        "FS9",
        "FS10",
        "FS11",
        "FS12",
        "FS13",
        "FS14",
        "FS15",
        "FS16",
        "FS17",
        "FS18",
        "FS19",
        "FS20",
        "FB1",
        "FB2",
        "FB3",
        "FB4",
        "FB5",
        "FB6",
        "FB7",
        "FB8",
        "FB9",
        "FB10",
        "FB11",
        "FB12",
        "FB13",
        "FB14",
        "FB15",
        "FB16",
        "FB17",
        "FB18",
        "FB19",
        "FB20",
        "FD1",
        "FD2",
        "FD3",
        "FD4",
        "FD5",
        "FD6",
        "FD7",
        "FD8",
        "FD9",
        "FD10",
        "FD11",
        "FD12",
        "FD13",
        "FD14",
        "FD15",
        "FD16",
        "FD17",
        "FD18",
        "FD19",
        "FD20",
        "FN1",
        "FN2",
        "FN3",
        "FN4",
        "FN5",
        "FN6",
        "FN7",
        "FN8",
        "FN9",
        "FN10",
        "FN11",
        "FN12",
        "FN13",
        "FN14",
        "FN15",
        "FN16",
        "FN17",
        "FN18",
        "FN19",
        "FN20"

    from source
)
select * from renamed;');



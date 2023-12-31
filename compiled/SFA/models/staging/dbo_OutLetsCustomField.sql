with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutLetsCustomField"

),

renamed as (

    select
        country_code,
        customkey,
        fi1,
        fi2,
        fi3,
        fi4,
        fi5,
        fi6,
        fi7,
        fi8,
        fi9,
        fi10,
        fi11,
        fi12,
        fi13,
        fi14,
        fi15,
        fi16,
        fi17,
        fi18,
        fi19,
        fi20,
        fi21,
        fi22,
        fi23,
        fi24,
        fi25,
        fi26,
        fi27,
        fi28,
        fi29,
        fi30,
        fi31,
        fi32,
        fi33,
        fi34,
        fi35,
        fi36,
        fi37,
        fi38,
        fi39,
        fi40,
        fs1,
        fs2,
        fs3,
        fs4,
        fs5,
        fs6,
        fs7,
        fs8,
        fs9,
        fs10,
        fs11,
        fs12,
        fs13,
        fs14,
        fs15,
        fs16,
        fs17,
        fs18,
        fs19,
        fs20,
        fb1,
        fb2,
        fb3,
        fb4,
        fb5,
        fb6,
        fb7,
        fb8,
        fb9,
        fb10,
        fb11,
        fb12,
        fb13,
        fb14,
        fb15,
        fb16,
        fb17,
        fb18,
        fb19,
        fb20,
        fd1,
        fd2,
        fd3,
        fd4,
        fd5,
        fd6,
        fd7,
        fd8,
        fd9,
        fd10,
        fd11,
        fd12,
        fd13,
        fd14,
        fd15,
        fd16,
        fd17,
        fd18,
        fd19,
        fd20,
        fn1,
        fn2,
        fn3,
        fn4,
        fn5,
        fn6,
        fn7,
        fn8,
        fn9,
        fn10,
        fn11,
        fn12,
        fn13,
        fn14,
        fn15,
        fn16,
        fn17,
        fn18,
        fn19,
        fn20,
        valid_from,
        valid_to

    from source

)

select * from renamed
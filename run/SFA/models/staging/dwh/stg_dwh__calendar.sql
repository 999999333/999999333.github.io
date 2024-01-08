
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_dwh__calendar__dbt_tmp" as
        with source as (
      select * from "L10_Core"."dbo"."Calendar_v"
),
renamed as (
    select
        "Calendar_Id" as calendar_id,
        cast(
            replace(
                cast("Last_Of_Month" as varchar(10)),
                ''-'',
                '''')
            as int) as last_of_month

    from source
)
select * from renamed
    ');


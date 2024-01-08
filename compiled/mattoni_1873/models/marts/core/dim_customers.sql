

with customer as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__customers"
),

final as (

    select
        ----------  ids
        customer_id,
        country_id,
        country_code,

        ----------  strings
        customer_name,
        customer_trading_name

        ----------  numerics

        ----------  booleans

        ----------  timestamps   

        ----------  omited

    from customer
    
    where
        dbt_valid_to >= cast('2299-12-31' as datetime2)
)

select * from final
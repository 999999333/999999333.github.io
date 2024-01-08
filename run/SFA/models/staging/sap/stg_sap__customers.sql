
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sap__customers__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sap"."customer_now_dvt_c_hv"
),
renamed as (
    select
        "customer_id",
        "customer_logical_id",
        "country_id",
        "customer_code",
        "customer_name_1",
        "customer_name_2",
        "customer_name_3",
        "customer_name_4",
        "customer_country_id",
        "eu_member_country_flag",
        "country_name",
        "city",
        "zipcode",
        "address",
        "customer_account_group_code",
        "customer_account_group",
        "customer_group_code",
        "customer_group",
        "transportation_zone_code",
        "transportation_zone",
        "central_order_block_id",
        "central_delivery_block_id",
        "central_billing_block_id",
        "seasonal_customer_code",
        "seasonal_customer",
        "one_time_account_flag",
        "chain_customer_code",
        "chain_customer",
        "service_type_code",
        "service_type",
        "default_depot_code",
        "default_depot_id",
        "distributor_logical_id",
        "distributor_id",
        "price_group_code",
        "price_group",
        "sales_channel_id",
        "pepsi_club_type_code",
        "pepsi_club_type",
        "key_account_code",
        "key_account",
        "region_code",
        "region_name",
        "county_code",
        "county_name",
        "city_code",
        "city_code_name",
        "tax_code_1",
        "tax_code_2",
        "vat_registration_number",
        "operating_permit_number",
        "created_on_date",
        "modified_on_date",
        "changed_by",
        "visit_valid_from",
        "visit_valid_to",
        "visit_suspended_from",
        "visit_suspended_to",
        "visit_day_1",
        "visit_day_2",
        "visit_day_3",
        "visit_day_4",
        "visit_day_5",
        "visit_day_6",
        "visit_day_7",
        "visiting_frequency_id",
        "contact_person_code",
        "organizational_category_1_code",
        "organizational_category_1_description",
        "organizational_category_2_code",
        "organizational_category_2_description",
        "kam_code",
        "kam_id",
        "payment_term_category_id",
        "_name_id"

    from source
)
select * from renamed
    ');

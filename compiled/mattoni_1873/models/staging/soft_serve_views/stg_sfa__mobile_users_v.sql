with source as (
      select * from "L01_Stage"."sfa"."dbo_MobileModuleUser_v"
),
renamed as (
    select

        ----------  ids

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(MobileModuleUserID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as mobile_user_id,
        "MobileModuleUserID" as mobile_user_key,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(OrgStructureID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as organizational_structure_id,
        "OrgStructureID" as organizational_structure_key,

        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_code


        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps
    
        ----------  omited
--        "DeviceSerialNumber",
--        "MerchStatus",
--        "OLCardMinValue",
--        "OLCardCurrentValue",
--        "OLCardMaxValue",
--        "OrderNoMinValue",
--        "OrderNoCurrentvalue",
--        "OrderNoMaxValue",
--        "OutletMinValue",
--        "OutletCurrentValue",
--        "OutletMaxValue",
--        "RouteMinValue",
--        "RouteCurrentValue",
--        "RouteMaxValue",
--        "TaxFactureNoCurrentValue",
--        "Prefix",
--        "MobileVersion",
--        "DevOsVersion",
--        "DevModelName",
--        "SyncDate",
--        "DLM",
--        "Status",
--        "ULM",
--        "Cust_id",
--        "PinCode",
--        "Password",
--        "PasswordValidTo",
--        "ReportsDenyAccess",
--        "MobileModuleUserProfileID",
--        "ChangePassword",
--        "UseCustNumber",
--        "StartCustNumber",
--        "LastFivePasswordsHistory",
--        "WOrderRequestMinValue",
--        "WOrderRequestMaxValue",
--        "WOrderRequestCurrentValue",
--        "DeviceFcmToken",
--        "MMAllowedVersion",
--        "SyncType",
--        "ShardId",
--        "SyncVersion",
--        "CPU_Info",
--        "Camera",
--        "GPS_Type",
--        "RAM",
--        "ROM",
--        "TypeDevice",
--        "DisplaySize"

    from source
)
select * from renamed
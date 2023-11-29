

with staff as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__staff"
    where
    dbt_valid_to >= cast('2299-12-31' as datetime2)
),

staff_link_org_structure as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__staff_link_org_structures_v"
),

org_structure as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__organization_structures_v"
),

final as (
    select
        staff.staff_id,
        staff.staff_key,
        staff.country_id,
        staff.country_code,
        staff.staff_name_whole,
        staff.staff_name_first,
        staff.staff_name_last,
        staff.staff_position,
        staff.staff_comment,
        staff.staff_sap_code,
        staff.staff_email,
        staff.staff_telephone,
        staff_link_org_structure.organizational_structure_id


    from
    staff
    left join
    staff_link_org_structure
    on staff.staff_id = staff_link_org_structure.staff_id
)

select * from final
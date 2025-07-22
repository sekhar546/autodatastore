
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    vehicle_trim_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."vehicle_trims"
where vehicle_trim_id is not null
group by vehicle_trim_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
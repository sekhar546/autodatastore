
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select vehicle_trim_id
from "vehicle_specs_db"."public"."vehicle_trims"
where vehicle_trim_id is null



  
  
      
    ) dbt_internal_test
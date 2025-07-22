
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select year
from "vehicle_specs_db"."public"."vehicle_trims"
where year is null



  
  
      
    ) dbt_internal_test
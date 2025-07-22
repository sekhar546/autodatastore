
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select number_of_airbags
from "vehicle_specs_db"."public"."safety_features"
where number_of_airbags is null



  
  
      
    ) dbt_internal_test
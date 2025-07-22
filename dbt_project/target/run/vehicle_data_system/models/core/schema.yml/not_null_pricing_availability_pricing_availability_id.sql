
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select pricing_availability_id
from "vehicle_specs_db"."public"."pricing_availability"
where pricing_availability_id is null



  
  
      
    ) dbt_internal_test
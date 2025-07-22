
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dimensions_capacity_id
from "vehicle_specs_db"."public"."dimensions_capacity"
where dimensions_capacity_id is null



  
  
      
    ) dbt_internal_test

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select seating_material
from "vehicle_specs_db"."public"."interior_features"
where seating_material is null



  
  
      
    ) dbt_internal_test
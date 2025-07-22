
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select msrp_cad
from "vehicle_specs_db"."public"."pricing_availability"
where msrp_cad is null



  
  
      
    ) dbt_internal_test
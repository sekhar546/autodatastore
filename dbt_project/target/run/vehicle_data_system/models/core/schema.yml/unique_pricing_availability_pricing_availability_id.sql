
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    pricing_availability_id as unique_field,
    count(*) as n_records

from "vehicle_specs_db"."public"."pricing_availability"
where pricing_availability_id is not null
group by pricing_availability_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
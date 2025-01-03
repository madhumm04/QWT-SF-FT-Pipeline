{{config(materilized='table', schema='transforming')}}

select 
a.orderid,
a.lineno,
a.shipmentdate,
a.status,
b.companyname as shipmentcompanyname

from 
{{ref('shipments_snapshot')}} a
inner join 
{{ref('lkp_shippers')}} b
on a.shipperid=b.shipperid
where a.dbt_valid_to is null
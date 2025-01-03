{{config(materilized='table', schema='transforming')}}

select 
a.productid,
a.productname,
c.companyname as suppliercompanyname,
c.contactname as suppliercontactname,
c.city as suppliercity,
c.country as suppliercountry,
b.categoryname ,
a.quantityperunit ,
a.unitcost ,
a.unitprice ,
a.unitsinstock ,
a.unitsonorder,
(a.unitprice - a.unitcost) as unitprofit,
iff(a.unitsinstock-a.unitsonorder> 0,'yes','no') as availibility

 from 
{{ref('stg_products')}} as  a
left join 
{{ref('lkp_categories')}} as b
on a.categoryid=b.categoryid
left join 
{{ref('trf_suppliers')}} c
on a.supplierid=c.supplierid
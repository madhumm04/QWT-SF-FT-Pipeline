{{config(materilized='table', schema='transforming')}}

select 
a.customerid,
a.companyname,
a.contactname,
a.city,
a.country,
b.divisionname,
a.address,
a.fax,
a.phone,
a.postalcode,
iff(a.stateprovince='','NA',a.stateprovince) as stateprovince
 from 
{{ref('stg_customer')}} as  a
left join {{ref("lkp_divisions")}} as b
on a.divisionid=b.divisionid
{{config(materialized='view', schema='reporting')}}

select 
a.companyname,
a.contactname,
min(c.orderdate) as first_order_date,
max(c.orderdate) as recent_order_date,
count(c.productid) as countproducts,
sum(c.quantity) as total_quantity,
sum(c.linesalesamount) as total_sales,
avg(margin) as avgmargin
from {{ref("dim_customers")}} as a
left join {{ref("fct_orders")}} as c
on a.customerid=c.employeeid
left join {{ref("dim_products")}} b
on c.productid=b.productid
group by 
a.companyname,
a.contactname
having first_order_date is not null
order by total_sales

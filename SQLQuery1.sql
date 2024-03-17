--showing clients who made unrealized orders
select name, lastName
from clients
inner join orders
on clients.id_client = orders.id_client
where orders.isRealized = 0

--same, but with realized orders
select name, lastName
from clients
inner join orders
on clients.id_client = orders.id_client
where orders.isRealized = 1

--names of products that were ordered
select name
from products
inner join order_details
on products.id_product = order_details.id_product

--name of products with their categories
select products.name, product_categories.name
from products
inner join product_categories
on products.id_category = product_categories.id_category

--printing products that were part of unrealized orders
select name
from products
inner join order_details
on products.id_product = order_details.id_product
inner join orders
on order_details.order_id = orders.order_id
where orders.realizationDate is null

--clients credentials and dates of making orders
select c.name, c.lastName, orders.orderDate
from clients as c
right join orders
on c.id_client = orders.id_client

--select clients who bought products with price over 100 
select c.name, c.lastName
from clients as c
inner join orders as o
on o.id_client = c.id_client
inner join order_details as od
on od.order_id = o.order_id
inner join products as p
on p.id_product = od.id_product
where p.price > 100

--select categories of products that are part of realized orders
select distinct pc.name
from product_categories as pc
inner join products as p
on pc.id_category = p.id_category
inner join order_details as od
on od.id_product = p.id_product
inner join orders as o
on o.order_id = od.order_id
where isRealized = 1

--select products that were ordered in 2022
select p.name, p.description
from products as p
inner join order_details as od
on od.id_product = p.id_product
inner join orders as o
on o.order_id = od.order_id
where YEAR(o.orderDate) = '2022'


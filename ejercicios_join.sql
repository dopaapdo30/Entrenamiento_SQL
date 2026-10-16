----- ejercicio 1----------
select gerentes.nombre_gerente, sales.product_name 
from gerentes
left join sales on gerentes.branch = sales.branch;
-------ejercicio 2-----------
select gerentes.nombre_gerente, sales.customer_type 
from gerentes 
left join sales on gerentes.branch = sales. branch
where sales.customer_type is null;
-------ejercicio 3----------------
select gerentes.nombre_gerente, sum (sales.quantity)
from gerentes 
left join sales on gerentes.branch = sales.branch
group by gerentes.nombre_gerente 
-------ejercicio 4---------------
select gerentes.nombre_gerente, sum (sales.quantity) as total_unidades_vendidas
from gerentes 
left join sales on gerentes.branch = sales.branch
group by gerentes.nombre_gerente 
order by total_unidades_vendidas desc nulls last;

-------ejercicio 5---------------
select 
    sale_id, 
    product_name, 
    quantity,
    case 
        when quantity >= 15 then 'Venta Mayorista'
        else 'Venta Minorista'
    end as categoria_venta
from sales;
--------ejercicio 6---------------
select sale_id, customer_type, total_price,
case 
    when total_price > 100 then 'Venta VIP'
    when total_price >= 50 then 'Venta Regular'
    else 'Venta Pequeña'
end as nivel_compra
from sales; 
--------ejercicio 7------------
select sale_id, product_name, tax,
case
	when tax = 0 OR tax is null then 'Exento' else 'con impuesto'
	end as estado_impuesto
	from sales;
---------ejercicio 8---------
select  sale_id, quantity,
case 
	when quantity >= 20 then 'Volumen Alto'
	when quantity >= 10 and quantity < 20 then 'Volumen Medio'
	else 'Volumen bajo'
end as escala_volumen
from sales;
---------ejercicio 9------------
select gerentes.nombre_gerente, sales.total_price, gerentes.branch,
case
	when gerentes.branch = 'Norte' then 'prioridad alta'
	when gerentes.branch = 'sur'  then 'prioridad media'
	else 'prioridad estandar'
	end as prioridad_concursal
	from gerentes
left join sales on gerentes.branch = sales.branch;
-----ejercicio 10------
select sale_id, total_price, quantity,
case 
	when total_price > 200 or quantity >= 30 then 'Revision Prioritaria'
	else 'Sin Riesgo'
end as alerta_transaccion
from sales;
-----ejercicio 11----------
select sale_id, product_name, total_price
from sales
where total_price > (select avg(total_price) from sales);
-------ejercicio 12----------
select sale_id, city, product_category, total_price,
case 
    when total_price >= 100 then 'Ticket Alto'
    else 'Ticket Normal'
end as tipo_ticket
from sales
where city in ('New York', 'Chicago');
-------ejercicio 13------------------
select sale_id, quantity, total_price
from sales
where quantity > (select avg(quantity) from sales);
------ejercicio 14-------------
select sale_id, city, customer_type
from sales 
where city in ('Los Angeles', 'Chicago');
------ejercicio 15--------------
select 
    sale_id, 
    city, 
    customer_type, 
    total_price,
    case 
        when total_price >= 100  then 'Ticket Alto'
        else 'Ticket Normal'
    end as tipo_ticket
from sales
where city in ('Los Angeles', 'Chicago');
------ejercicio 16-----------------------
select sale_id, city, total_price
from sales
where city = 'New York' and total_price > 50;
------ejercicio 17------------------------
select sale_id, product_category, city
from sales
where city in ('Chicago', 'Los Angeles')
-------ejercicio 18-------------------------
select total_price, city
from sales
group by city
order by total_price desc;
---------ejercicio 19-------------------------
select city, sum(total_price) as ingreso_total
from sales
group by city
order by ingreso_total desc;
----------ejercicio 20------------------
select customer_type, count(*) as cantidad_ventas
from sales
group by customer_type
having count(*) > 10;
-----------ejercicio 21-------------------
select sale_id, city, total_price
from sales
where (city = 'New York' or city = 'Chicago') and total_price > 100;
-----------ejercicio 22-----------------------
select sale_id, city, product_category 
from sales
where city in ('Chicago', 'Los Angeles');
----------ejercicio 23----------------
select sum(total_price) as suma_total
from sales;
---------ejercicio 24-------------
select city, sum(total_price) as ingreso_total
from sales 
group by city
having sum(total_price) > 10000
order by ingreso_total desc;
---------ejercicio 25-------------------
select city, count(*) as cantidad_ventas
from sales 
group by city
having count(*) > 100
order by cantidad_ventas desc;
-------ejercicio 26-------------
SELECT 
    sales.sale_id, 
    sales.total_price, 
    gerentes.nombre_gerente
FROM sales
INNER JOIN gerentes
ON sales.branch = gerentes.branch;
--------ejercicio 27-----------------
SELECT 
    gerentes.nombre_gerente, 
    sales.sale_id, 
    sales.total_price
FROM gerentes
LEFT JOIN sales
ON gerentes.branch = sales.branch;
----------ejercicio 28-----------
SELECT 
    sale_id,
    total_price,
    CASE 
        WHEN total_price > 100 THEN 'VIP'
        ELSE 'Regular'
    END AS categoria_cliente
FROM sales;
----------ejercicio 29------------
SELECT sale_id, product_name, total_price AS ventas_mayor_200
FROM sales
WHERE total_price > 200
ORDER BY ventas_mayor_200 DESC;
----------ejercicio 30---------------------
SELECT product_category, 
       SUM(total_price) AS total_dinero, 
       COUNT(*) AS cantidad_ventas
FROM sales
GROUP BY product_category
ORDER BY total_dinero DESC;
-------ejercicio 31--------------------
SELECT sales.sale_id, sales.product_name, gerentes.nombre_gerente
FROM sales
INNER JOIN gerentes
ON sales.branch = gerentes.branch;
-----------ejercicio 32----------
SELECT gerentes.nombre_gerente, sales.sale_id
FROM gerentes
LEFT JOIN sales
ON gerentes.branch = sales.branch;
--------ejercicio 33----------------
SELECT sale_id, product_name, quantity,
    CASE 
        WHEN quantity > 5 THEN 'CAJA GRANDE'
        ELSE 'CAJA PEQUEÑA'
    END AS tipo_caja
FROM sales;
-------ejercico 34-----------
select sale_id, product_name, total_price
from sales 
where total_price > (select AVG(total_price)
from sales )
order by total_price desc;
-----------ejercico 35-----------
select  sale_id, city, total_price as venta_mas_cara
from sales
where total_price = (select MAX(total_price)
from sales)
order by venta_mas_cara desc;
----------ejercicio 36-----------
select sales.sale_id, sales.product_name, sales.total_price, gerentes.nombre_gerente as gerente_ganador
from sales 
left join gerentes
on sales.branch = gerentes.branch
where total_price > (select AVG(total_price)
from sales)
order by sales.total_price desc;
----------ejercicio 37-----------------
--------Reporte de Inventario (Filtro y Orden)-----------
SELECT sale_id, product_name, quantity
FROM sales
WHERE quantity < 3
ORDER BY quantity ASC;
----------ejercicio 38---------------
---------Métricas de Sede (Agrupación)---------
select city, sum(total_price), count(branch) as tickes_ventas
from sales
group by city
order by tickes_ventas desc;
--------ejercicio 39------------------
----Auditoría de Personal (Cruce con retención)---
SELECT gerentes.nombre_gerente, sales.product_name
FROM gerentes
LEFT JOIN sales
ON gerentes.branch = sales.branch;
---------ejercicio 40------------
-------Etiquetado de Tickets (Condicionales)---------
SELECT sale_id, total_price,
    CASE 
        WHEN total_price >= 150 THEN 'PREMIUM'
        ELSE 'ECONÓMICO'
    END AS rango_precio
FROM sales
ORDER BY rango_precio DESC;
---------ejercicio 41----------------
--------El Vendedor Récord (Subconsultas y Cruce)--------
SELECT gerentes.nombre_gerente, sales.total_price AS vendedor_historico
FROM gerentes
INNER JOIN sales
ON gerentes.branch = sales.branch
WHERE sales.total_price = (
    SELECT MAX(total_price) 
    FROM sales
);
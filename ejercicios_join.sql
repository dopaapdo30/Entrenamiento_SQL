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




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



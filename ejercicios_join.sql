select gerentes.nombre_gerente, sum (sales.total_price) as total_recaudado
from sales
inner join gerentes on sales.branch = gerentes.branch
group by gerentes.nombre_gerente
order by total_recaudado desc;

----ejercico----
select gerentes.nombre_gerente, sum(sales.quantity) as ventas_articulos
from sales
inner join gerentes on sales.branch = gerentes.branch
group by gerentes.nombre_gerente
order by  ventas_articulos asc;


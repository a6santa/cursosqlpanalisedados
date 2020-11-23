-- # Vendedores
select
    date_format(data_hora, '%Y-%m') ano_mes, count(distinct id_vendedor) n_vendores
from data d
inner join (
select
    id_vendedor, nome, time, lider, data_ini, coalesce(data_fim, current_date()) data_fim, abs(datediff(data_ini, coalesce(data_fim, current_date())))
from vendedor ) v on d.data_hora between data_ini and data_fim
group by 1;

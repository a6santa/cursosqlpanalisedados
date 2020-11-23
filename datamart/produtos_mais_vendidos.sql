-- # Produtos mais vendidos
select
       fk_produto, sum(qtd_venda)
from vendas v
group by 1
order by 2 desc ;

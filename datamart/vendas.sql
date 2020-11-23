-- $ vendas # vendas
select
       data_hora,
       v2.nome,
       v2.time,
       p.categoria,
       p.nome_produto,
       p.valor_venda,
       sum(v.qtd_venda) qtd_vendas,
       sum(v.valor_venda) valor_venda
from vendas v
left join data d on d.id_data = v.fk_data
left join vendedor v2 on v.fk_vendedor = v2.id_vendedor
left join produto p on v.fk_produto = p.id_produto
group by data_hora, v2.nome, v2.time, p.categoria, p.nome_produto, p.valor_venda;


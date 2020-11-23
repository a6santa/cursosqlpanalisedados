-- vendas X metas
select
    vendas.*,
    m.valor valor_meta
from (
         select date_format(data_hora, '%Y-%m') ano_mes,
                v2.nome,
                id_vendedor,
                sum(v.qtd_venda)                qtd_vendas,
                sum(v.valor_venda)              valor_venda
         from vendas v
                  left join data d on d.id_data = v.fk_data
                  left join vendedor v2 on v.fk_vendedor = v2.id_vendedor
         where data_hora >= '2020-01-01'
         group by date_format(data_hora, '%Y-%m'), v2.nome, id_vendedor
    ) vendas
left join metas m on vendas.id_vendedor = m.id_vendedor;

select * from metas;

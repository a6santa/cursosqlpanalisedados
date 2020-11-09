
-- DATA MART VENDAS
-- DIM: data
CREATE TABLE data (
    id_data INTEGER  NOT NULL,
    data_hora INTEGER  NULL,
    dia_da_semana INTEGER  NOT NULL,
    semana_do_ano INTEGER  NOT NULL,
    mes_do_ano INTEGER  NOT NULL,
    ano INTEGER  NOT NULL,
    CONSTRAINT data_pk PRIMARY KEY (id_data)
);

-- DIM: metas
CREATE TABLE metas (
    id_meta INTEGER  NOT NULL,
    valor DECIMAL(17,9)  NULL,
    id_vendedor INTEGER  NULL,
    diaria bool  NULL,
    mensal bool  NULL,
    data_inicio date  NULL,
    data_fim date  NULL,
    CONSTRAINT metas_pk PRIMARY KEY (id_meta)
);

-- DIM: produto
CREATE TABLE produto (
    id_produto INTEGER  NOT NULL,
    nome_produto VARCHAR(500)  NULL,
    categoria VARCHAR(500)  NULL,
    valor_bruto DECIMAL(17,9)  NULL,
    valor_venda DECIMAL(17,9)  NULL,
    limite_desconto DECIMAL(17,9)  NULL,
    CONSTRAINT produto_pk PRIMARY KEY (id_produto)
);

-- DIM: vendedor
CREATE TABLE vendedor (
    id_vendedor INTEGER  NOT NULL,
    nome VARCHAR(500)  NULL,
    time VARCHAR(500)  NULL,
    lider VARCHAR(500)  NULL,
    data_ini date  NOT NULL,
    data_fim date  NULL,
    CONSTRAINT vendedor_pk PRIMARY KEY (id_vendedor)
);

-- FATO: vendas
CREATE TABLE vendas (
    fk_vendedor INTEGER  NOT NULL,
    fk_produto INTEGER  NOT NULL,
    fk_data INTEGER  NOT NULL,
    fk_metas INTEGER  NOT NULL,
    qtd_venda INTEGER  NOT NULL,
    valor_venda DECIMAL(17,9)  NOT NULL,
    CONSTRAINT vendas_data FOREIGN KEY (fk_data) REFERENCES data (id_data),
    CONSTRAINT vendas_metas FOREIGN KEY (fk_metas) REFERENCES metas (id_meta),
    CONSTRAINT vendas_produto FOREIGN KEY (fk_produto) REFERENCES produto (id_produto),
    CONSTRAINT vendas_vendedor FOREIGN KEY (fk_vendedor) REFERENCES vendedor (id_vendedor)
);

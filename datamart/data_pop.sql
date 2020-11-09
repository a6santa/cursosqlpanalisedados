DROP TABLE IF EXISTS numbers_small;
CREATE TABLE numbers_small (number INT);
INSERT INTO numbers_small VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

DROP TABLE IF EXISTS numbers;
CREATE TABLE numbers (number BIGINT);
INSERT INTO numbers
SELECT thousands.number * 1000 + hundreds.number * 100 + tens.number * 10 + ones.number
  FROM numbers_small thousands, numbers_small hundreds, numbers_small tens, numbers_small ones
LIMIT 1000000;

insert into  data (id_data, data_hora, dia_da_semana, semana_do_ano, mes_do_ano, ano)
    SELECT
        number id_data,
        DATE_ADD( '2010-01-01', INTERVAL number DAY ) data_hora,
        date_format( DATE_ADD( '2010-01-01', INTERVAL number DAY ), '%w') dia_da_semana,
        weekofyear( DATE_ADD( '2010-01-01', INTERVAL number DAY ))  semana_do_ano,
        date_format( DATE_ADD( '2010-01-01', INTERVAL number DAY ), '%m') mes_do_ano,
        date_format( DATE_ADD( '2010-01-01', INTERVAL number DAY ), '%Y') ano
    FROM numbers
    WHERE DATE_ADD( '2010-01-01', INTERVAL number DAY ) BETWEEN '2018-01-01' AND '2021-01-01';
    
 DROP TABLE numbers_small;
 DROP TABLE numbers;


CREATE DATABASE IF NOT EXISTS DWAtv5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE DWAtv5;
SET SESSION SQL_SAFE_UPDATES = 0;

-- 1) STAGING: criar e carregar CSVs (dados brutos)
DROP TABLE IF EXISTS cidades_staging, clientes_staging, produtos_staging, pedidos_staging,
itens_pedidos_staging, entregas_staging, lojas_staging, vendedor_staging;

CREATE TABLE cidades_staging (
  id_cidade VARCHAR(300),
  nome_cidade VARCHAR(300),
  uf VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cidades.csv'
INTO TABLE cidades_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_cidade, nome_cidade, uf);

CREATE TABLE clientes_staging (
  id_cliente VARCHAR(300),
  nome VARCHAR(300),
  data_nascimento VARCHAR(300),
  sexo VARCHAR(300),
  id_cidade VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clientes.csv'
INTO TABLE clientes_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_cliente, nome, data_nascimento, sexo, id_cidade);

CREATE TABLE produtos_staging (
  id_produto VARCHAR(300),
  nome VARCHAR(300),
  categoria VARCHAR(300),
  marca VARCHAR(300),
  preco_unitario VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/produtos.csv'
INTO TABLE produtos_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_produto, nome, categoria, marca, preco_unitario);

CREATE TABLE pedidos_staging (
  id_pedido VARCHAR(300),
  id_cliente VARCHAR(300),
  id_vendedor VARCHAR(300),
  data_pedido VARCHAR(300),
  valor_total VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pedidos.csv'
INTO TABLE pedidos_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_pedido, id_cliente, id_vendedor, data_pedido, valor_total);

CREATE TABLE itens_pedidos_staging (
  id_pedido VARCHAR(300),
  id_produto VARCHAR(300),
  quantidade VARCHAR(300),
  preco_unitario VARCHAR(300),
  desconto VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/itens_pedidos.csv'
INTO TABLE itens_pedidos_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_pedido, id_produto, quantidade, preco_unitario, desconto);

CREATE TABLE entregas_staging (
  id_entrega VARCHAR(300),
  id_pedido VARCHAR(300),
  data_entrega VARCHAR(300),
  transportadora VARCHAR(300),
  custo_frete VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/entregas.csv'
INTO TABLE entregas_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_entrega, id_pedido, data_entrega, transportadora, custo_frete);

CREATE TABLE lojas_staging (
  id_loja VARCHAR(300),
  nome VARCHAR(300),
  id_cidade VARCHAR(300),
  gerente VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/lojas.csv'
INTO TABLE lojas_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_loja, nome, id_cidade, gerente);

CREATE TABLE vendedor_staging (
  id_vendedor VARCHAR(300),
  nome VARCHAR(300),
  id_loja VARCHAR(300)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/vendedor.csv'
INTO TABLE vendedor_staging
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES (id_vendedor, nome, id_loja);

-- 2) LIMPEZA:
UPDATE cidades_staging
 SET id_cidade = TRIM(REPLACE(id_cidade, CONCAT(CHAR(239),CHAR(187),CHAR(191)), '')),
     nome_cidade = TRIM(REPLACE(nome_cidade, CONCAT(CHAR(239),CHAR(187),CHAR(191)), '')),
     uf = TRIM(uf);

UPDATE clientes_staging
 SET id_cliente = TRIM(REPLACE(id_cliente, CONCAT(CHAR(239),CHAR(187),CHAR(191)), '')),
     nome = TRIM(nome),
     data_nascimento = TRIM(data_nascimento),
     sexo = TRIM(sexo),
     id_cidade = TRIM(id_cidade);

UPDATE produtos_staging
 SET id_produto = TRIM(id_produto),
     nome = TRIM(nome),
     categoria = TRIM(categoria),
     marca = TRIM(marca),
     preco_unitario = TRIM(preco_unitario);

UPDATE pedidos_staging
 SET id_pedido = TRIM(id_pedido),
     id_cliente = TRIM(id_cliente),
     id_vendedor = TRIM(id_vendedor),
     data_pedido = TRIM(data_pedido),
     valor_total = TRIM(valor_total);

UPDATE itens_pedidos_staging
 SET id_pedido = TRIM(id_pedido),
     id_produto = TRIM(id_produto),
     quantidade = TRIM(quantidade),
     preco_unitario = TRIM(preco_unitario),
     desconto = TRIM(desconto);

UPDATE entregas_staging
 SET id_entrega = TRIM(id_entrega),
     id_pedido = TRIM(id_pedido),
     data_entrega = TRIM(data_entrega),
     transportadora = TRIM(transportadora),
     custo_frete = TRIM(custo_frete);

UPDATE lojas_staging
 SET id_loja = TRIM(id_loja),
     nome = TRIM(nome),
     id_cidade = TRIM(id_cidade),
     gerente = TRIM(gerente);

UPDATE vendedor_staging
 SET id_vendedor = TRIM(id_vendedor),
     nome = TRIM(nome),
     id_loja = TRIM(id_loja);

-- 3) TEMPORÁRIAS: consolidar entregas e agregar itens/descontos
DROP TEMPORARY TABLE IF EXISTS tmp_entregas;
CREATE TEMPORARY TABLE tmp_entregas AS
SELECT
  TRIM(id_pedido) AS id_pedido,
  MIN(DATE(STR_TO_DATE(TRIM(data_entrega), '%d/%m/%Y'))) AS data_entrega,
  MIN(TRIM(transportadora)) AS transportadora,
  SUM(
    CASE
      WHEN COALESCE(TRIM(custo_frete),'') = '' THEN 0
      ELSE
        CASE
          WHEN REPLACE(REGEXP_REPLACE(TRIM(custo_frete),'[^0-9,.-]',''), ',', '.') REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
          THEN CAST(REPLACE(REGEXP_REPLACE(TRIM(custo_frete),'[^0-9,.-]',''), ',', '.') AS DECIMAL(18,4))
          ELSE 0
        END
    END
  ) AS custo_frete
FROM entregas_staging
WHERE TRIM(id_pedido) <> ''
GROUP BY TRIM(id_pedido);

DROP TEMPORARY TABLE IF EXISTS tmp_itens_agg;
CREATE TEMPORARY TABLE tmp_itens_agg AS
SELECT
  TRIM(id_pedido) AS id_pedido,
  TRIM(id_produto) AS id_produto,
  SUM(
    CASE
      WHEN REPLACE(TRIM(quantidade), ',', '.') REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
      THEN CAST(REPLACE(TRIM(quantidade), ',', '.') AS DECIMAL(18,4))
      ELSE 0
    END
  ) AS qtde_total,
  AVG(
    CASE
      WHEN REPLACE(TRIM(preco_unitario), ',', '.') REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
      THEN CAST(REPLACE(TRIM(preco_unitario), ',', '.') AS DECIMAL(18,4))
      ELSE NULL
    END
  ) AS preco_medio
FROM itens_pedidos_staging
WHERE TRIM(id_pedido) <> '' AND TRIM(id_produto) <> ''
GROUP BY TRIM(id_pedido), TRIM(id_produto);

DROP TEMPORARY TABLE IF EXISTS tmp_descontos;
CREATE TEMPORARY TABLE tmp_descontos AS
SELECT
  TRIM(id_pedido) AS id_pedido,
  TRIM(id_produto) AS id_produto,
  SUM(
    CASE
      WHEN REPLACE(TRIM(desconto), ',', '.') REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
      THEN CAST(REPLACE(TRIM(desconto), ',', '.') AS DECIMAL(18,4))
           * CASE WHEN REPLACE(TRIM(quantidade), ',', '.') REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
                  THEN CAST(REPLACE(TRIM(quantidade), ',', '.') AS DECIMAL(18,4))
                  ELSE 0 END
      ELSE 0
    END
  ) AS vl_desconto
FROM itens_pedidos_staging
GROUP BY TRIM(id_pedido), TRIM(id_produto);

-- 4) DIMENSÕES
DROP TABLE IF EXISTS dim_transporte;
CREATE TABLE dim_transporte (
  id_transportadora INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome_transportadora VARCHAR(150)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_transporte (nome_transportadora)
SELECT DISTINCT TRIM(transportadora)
FROM tmp_entregas
WHERE TRIM(transportadora) IS NOT NULL AND TRIM(transportadora) <> '';

DROP TABLE IF EXISTS dim_cidade;
CREATE TABLE dim_cidade (
  id_cidade INT NOT NULL PRIMARY KEY,
  nome_cidade VARCHAR(150)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_cidade (id_cidade, nome_cidade)
SELECT DISTINCT CAST(TRIM(id_cidade) AS UNSIGNED), TRIM(nome_cidade)
FROM cidades_staging
WHERE TRIM(id_cidade) <> '' AND TRIM(id_cidade) REGEXP '^[0-9]+$' AND TRIM(nome_cidade) <> '';

DROP TABLE IF EXISTS dim_fx_etaria;
CREATE TABLE dim_fx_etaria (
  id_fx_etaria INT NOT NULL PRIMARY KEY,
  faixa_etaria VARCHAR(50),
  idade_min INT,
  idade_max INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_fx_etaria (id_fx_etaria, faixa_etaria, idade_min, idade_max) VALUES
(1,'até 18 anos',0,18),
(2,'19 a 30 anos',19,30),
(3,'31 a 45 anos',31,45),
(4,'46 a 65 anos',46,65),
(5,'acima de 65 anos',66,200);

DROP TABLE IF EXISTS dim_tempo;
CREATE TABLE dim_tempo (
  id_data DATE NOT NULL PRIMARY KEY,
  dia_semana CHAR(3),
  mes CHAR(3),
  ano INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO dim_tempo (id_data)
SELECT DISTINCT DATE(STR_TO_DATE(TRIM(data_pedido), '%d/%m/%Y')) FROM pedidos_staging WHERE TRIM(data_pedido) <> '';

INSERT IGNORE INTO dim_tempo (id_data)
SELECT DISTINCT data_entrega FROM tmp_entregas WHERE data_entrega IS NOT NULL;

UPDATE dim_tempo
SET dia_semana = LEFT(DAYNAME(id_data),3),
    mes = LEFT(MONTHNAME(id_data),3),
    ano = YEAR(id_data);

DROP TABLE IF EXISTS dim_produto;
CREATE TABLE dim_produto (
  id_produto INT NOT NULL PRIMARY KEY,
  nome_produto VARCHAR(300),
  categ_produto VARCHAR(200),
  marca_produto VARCHAR(150)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_produto (id_produto, nome_produto, categ_produto, marca_produto)
SELECT DISTINCT CAST(TRIM(id_produto) AS UNSIGNED), TRIM(nome), TRIM(categoria), TRIM(marca)
FROM produtos_staging
WHERE TRIM(id_produto) <> '' AND TRIM(id_produto) REGEXP '^[0-9]+$';

DROP TABLE IF EXISTS dim_cliente;
CREATE TABLE dim_cliente (
  id_cliente INT NOT NULL PRIMARY KEY,
  nome_cliente VARCHAR(150),
  sexo CHAR(1),
  data_nascimento DATE,
  idade INT,
  id_fx_etaria INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_cliente (id_cliente, nome_cliente, sexo, data_nascimento, idade, id_fx_etaria)
SELECT
  CAST(TRIM(id_cliente) AS UNSIGNED) AS id_cliente,
  TRIM(nome) AS nome_cliente,
  LEFT(TRIM(sexo),1) AS sexo,
  STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y') AS data_nascimento,
  TIMESTAMPDIFF(YEAR, STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y'), CURDATE()) AS idade,
  CASE
    WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y'), CURDATE()) BETWEEN 0 AND 18 THEN 1
    WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y'), CURDATE()) BETWEEN 19 AND 30 THEN 2
    WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y'), CURDATE()) BETWEEN 31 AND 45 THEN 3
    WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y'), CURDATE()) BETWEEN 46 AND 65 THEN 4
    WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y'), CURDATE()) >= 66 THEN 5
    ELSE NULL
  END AS id_fx_etaria
FROM clientes_staging
WHERE TRIM(id_cliente) <> '' AND TRIM(id_cliente) REGEXP '^[0-9]+$'
  AND STR_TO_DATE(TRIM(data_nascimento), '%d/%m/%Y') IS NOT NULL;

DROP TABLE IF EXISTS dim_vendedor;
CREATE TABLE dim_vendedor (
  id_vendedor INT NOT NULL PRIMARY KEY,
  nome_vendedor VARCHAR(150),
  id_loja INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_vendedor (id_vendedor, nome_vendedor, id_loja)
SELECT DISTINCT CAST(TRIM(id_vendedor) AS UNSIGNED), TRIM(nome),
       CASE WHEN TRIM(id_loja) REGEXP '^[0-9]+$' THEN CAST(TRIM(id_loja) AS UNSIGNED) ELSE NULL END
FROM vendedor_staging
WHERE TRIM(id_vendedor) <> '' AND TRIM(id_vendedor) REGEXP '^[0-9]+$';

-- dim_gerente: normaliza nomes para mapping
DROP TABLE IF EXISTS dim_gerente;
CREATE TABLE dim_gerente (
  id_gerente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome_gerente VARCHAR(150),
  nome_gerente_norm VARCHAR(150)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_gerente (nome_gerente, nome_gerente_norm)
SELECT DISTINCT
  TRIM(gerente) AS nome_gerente,
  LOWER(
    REPLACE(
      REPLACE(
        REPLACE(
          REPLACE(
            REPLACE(
              REPLACE(
                REPLACE(
                  REPLACE(
                    REPLACE(
                      REPLACE(TRIM(gerente),
                      'á','a'),'à','a'),'ã','a'),'â','a'),'é','e'),'ê','e'),'í','i'),'ó','o'),'ô','o'),'ç','c')
  ) AS nome_gerente_norm
FROM lojas_staging
WHERE COALESCE(TRIM(gerente),'') <> '';

-- dim_loja: tenta mapear id_gerente por nome normalizado
DROP TABLE IF EXISTS dim_loja;
CREATE TABLE dim_loja (
  id_loja INT NOT NULL PRIMARY KEY,
  nome_loja VARCHAR(150),
  id_cidade_loja INT,
  id_gerente INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO dim_loja (id_loja, nome_loja, id_cidade_loja, id_gerente)
SELECT DISTINCT
  CAST(TRIM(ls.id_loja) AS UNSIGNED) AS id_loja,
  TRIM(ls.nome) AS nome_loja,
  CASE WHEN TRIM(ls.id_cidade) REGEXP '^[0-9]+$' THEN CAST(TRIM(ls.id_cidade) AS UNSIGNED) ELSE NULL END,
  (SELECT dg.id_gerente
   FROM dim_gerente dg
   WHERE dg.nome_gerente_norm = LOWER(
     REPLACE(
       REPLACE(
         REPLACE(
           REPLACE(
             REPLACE(
               REPLACE(
                 REPLACE(
                   REPLACE(
                     REPLACE(
                       REPLACE(TRIM(ls.gerente),
                       'á','a'),'à','a'),'ã','a'),'â','a'),'é','e'),'ê','e'),'í','i'),'ó','o'),'ô','o'),'ç','c')
   )
   LIMIT 1) AS id_gerente
FROM lojas_staging ls
WHERE TRIM(ls.id_loja) <> '' AND TRIM(ls.id_loja) REGEXP '^[0-9]+$';

-- 5) FATO: agregação de pedido-produto (usa valores das dimensões/temporárias)
DROP TABLE IF EXISTS fato_venda;
CREATE TABLE fato_venda (
  sk_venda VARCHAR(100) NOT NULL PRIMARY KEY,
  id_data DATE,
  id_cliente INT,
  id_produto INT,
  id_vendedor INT,
  id_loja INT,
  id_cidade_cli INT,
  id_cidade_loja INT,
  id_fx_etaria INT,
  id_transportadora INT,
  id_gerente INT,
  qtde_vendida INT,
  vl_bruto_venda DECIMAL(18,2),
  vl_desconto DECIMAL(18,2),
  vl_frete DECIMAL(18,2),
  vl_liq_venda DECIMAL(18,2),
  tmp_envio INT,
  tmp_preparo INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO fato_venda (
  sk_venda, id_data, id_cliente, id_produto, id_vendedor, id_loja,
  id_cidade_cli, id_cidade_loja, id_fx_etaria, id_transportadora, id_gerente,
  qtde_vendida, vl_bruto_venda, vl_desconto, vl_frete, vl_liq_venda, tmp_envio, tmp_preparo
)
SELECT
  CONCAT(ANY_VALUE(TRIM(i.id_pedido)),'_',ANY_VALUE(TRIM(i.id_produto))) AS sk_venda,

  DATE(STR_TO_DATE(MAX(TRIM(p.data_pedido)), '%d/%m/%Y')) AS id_data,

  ANY_VALUE(dc.id_cliente) AS id_cliente,
  ANY_VALUE(dp.id_produto) AS id_produto,
  ANY_VALUE(dv.id_vendedor) AS id_vendedor,

  COALESCE(ANY_VALUE(dv.id_loja), ANY_VALUE(dl.id_loja)) AS id_loja,

  CASE WHEN COALESCE(ANY_VALUE(cst.id_cidade), '') REGEXP '^[0-9]+$' THEN CAST(ANY_VALUE(TRIM(cst.id_cidade)) AS UNSIGNED) ELSE NULL END AS id_cidade_cli,
  ANY_VALUE(dl.id_cidade_loja) AS id_cidade_loja,

  ANY_VALUE(dc.id_fx_etaria) AS id_fx_etaria,

  ANY_VALUE(dt.id_transportadora) AS id_transportadora,

  ANY_VALUE(dl.id_gerente) AS id_gerente,

  CAST(SUM(i.qtde_total) AS SIGNED) AS qtde_vendida,
  SUM(i.qtde_total * COALESCE(i.preco_medio,0)) AS vl_bruto_venda,

  COALESCE(MAX(td.vl_desconto), 0) AS vl_desconto,

  -- frete: valor agregado por pedido em tmp_entregas.custo_frete
  COALESCE(MAX(t.custo_frete), 0) AS vl_frete,

  (SUM(i.qtde_total * COALESCE(i.preco_medio,0)) - COALESCE(MAX(td.vl_desconto),0) + COALESCE(MAX(t.custo_frete),0)) AS vl_liq_venda,

  -- tmp_envio: dias entre pedido e entrega (entrega = data_entrega de tmp_entregas)
  CASE WHEN MIN(t.data_entrega) IS NULL THEN NULL
       ELSE DATEDIFF(MIN(t.data_entrega), DATE(STR_TO_DATE(MAX(TRIM(p.data_pedido)),'%d/%m/%Y')))
  END AS tmp_envio,

  -- tmp_preparo: para seu caso usamos a mesma saída pq não achamos data_envio 
  CASE WHEN MIN(t.data_entrega) IS NULL THEN NULL
       ELSE DATEDIFF(MIN(t.data_envio), DATE(STR_TO_DATE(MAX(TRIM(p.data_pedido)),'%d/%m/%Y')))
  END AS tmp_preparo

FROM tmp_itens_agg i
LEFT JOIN pedidos_staging p ON TRIM(p.id_pedido) = TRIM(i.id_pedido)
LEFT JOIN tmp_entregas t ON TRIM(t.id_pedido) = TRIM(i.id_pedido)
LEFT JOIN tmp_descontos td ON TRIM(td.id_pedido) = TRIM(i.id_pedido) AND TRIM(td.id_produto) = TRIM(i.id_produto)

LEFT JOIN dim_produto dp ON dp.id_produto = CAST(TRIM(i.id_produto) AS UNSIGNED)
LEFT JOIN dim_cliente dc ON dc.id_cliente = CAST(TRIM(p.id_cliente) AS UNSIGNED)
LEFT JOIN dim_vendedor dv ON dv.id_vendedor = CAST(TRIM(p.id_vendedor) AS UNSIGNED)

LEFT JOIN vendedor_staging vs ON TRIM(vs.id_vendedor) = TRIM(p.id_vendedor)
LEFT JOIN lojas_staging ls ON TRIM(ls.id_loja) = TRIM(vs.id_loja)
LEFT JOIN dim_loja dl ON dl.id_loja = CAST(NULLIF(TRIM(vs.id_loja), '') AS UNSIGNED)

LEFT JOIN clientes_staging cst ON TRIM(cst.id_cliente) = TRIM(p.id_cliente)

LEFT JOIN dim_transporte dt ON LOWER(TRIM(dt.nome_transportadora)) = LOWER(COALESCE(TRIM(t.transportadora),''))

GROUP BY TRIM(i.id_pedido), TRIM(i.id_produto);

-- 6) VALIDAÇÃO: contagens e amostras
SELECT 'cidades_staging' AS tabela, COUNT(*) AS linhas FROM cidades_staging
UNION ALL SELECT 'clientes_staging', COUNT(*) FROM clientes_staging
UNION ALL SELECT 'produtos_staging', COUNT(*) FROM produtos_staging
UNION ALL SELECT 'pedidos_staging', COUNT(*) FROM pedidos_staging
UNION ALL SELECT 'itens_pedidos_staging', COUNT(*) FROM itens_pedidos_staging
UNION ALL SELECT 'entregas_staging', COUNT(*) FROM entregas_staging
UNION ALL SELECT 'lojas_staging', COUNT(*) FROM lojas_staging
UNION ALL SELECT 'vendedor_staging', COUNT(*) FROM vendedor_staging;

SELECT 'tmp_entregas' AS tabela, COUNT(*) FROM tmp_entregas
UNION ALL SELECT 'tmp_itens_agg', COUNT(*) FROM tmp_itens_agg
UNION ALL SELECT 'tmp_descontos', COUNT(*) FROM tmp_descontos
UNION ALL SELECT 'dim_transporte', COUNT(*) FROM dim_transporte
UNION ALL SELECT 'dim_cidade', COUNT(*) FROM dim_cidade
UNION ALL SELECT 'dim_fx_etaria', COUNT(*) FROM dim_fx_etaria
UNION ALL SELECT 'dim_tempo', COUNT(*) FROM dim_tempo
UNION ALL SELECT 'dim_produto', COUNT(*) FROM dim_produto
UNION ALL SELECT 'dim_cliente', COUNT(*) FROM dim_cliente
UNION ALL SELECT 'dim_loja', COUNT(*) FROM dim_loja
UNION ALL SELECT 'dim_vendedor', COUNT(*) FROM dim_vendedor
UNION ALL SELECT 'dim_gerente', COUNT(*) FROM dim_gerente
UNION ALL SELECT 'fato_venda', COUNT(*) FROM fato_venda;

-- amostras
SELECT id_pedido, data_entrega, transportadora, custo_frete FROM tmp_entregas LIMIT 200; -- checar fretes parseados
SELECT * FROM tmp_itens_agg LIMIT 200;
SELECT * FROM tmp_descontos LIMIT 200;

SELECT * FROM dim_transporte LIMIT 100;
SELECT * FROM dim_cidade LIMIT 100;
SELECT * FROM dim_fx_etaria LIMIT 100;
SELECT * FROM dim_tempo LIMIT 100;
SELECT * FROM dim_produto LIMIT 100;
SELECT * FROM dim_cliente LIMIT 100;
SELECT * FROM dim_loja LIMIT 100;
SELECT * FROM dim_vendedor LIMIT 100;
SELECT * FROM dim_gerente LIMIT 100;
SELECT * FROM fato_venda LIMIT 200;

SET SESSION SQL_SAFE_UPDATES = 1;

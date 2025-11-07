SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS PAGAMENTO;
DROP TABLE IF EXISTS ITEM_PEDIDO;
DROP TABLE IF EXISTS PEDIDO;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS CARGO;
DROP TABLE IF EXISTS TIPO_PAGTO;
DROP TABLE IF EXISTS CATEGORIA;

SET FOREIGN_KEY_CHECKS = 1;

-- 1) CRIAÇÃO DAS TABELAS
CREATE TABLE CATEGORIA (
  id_categ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome_categ VARCHAR(80) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE CLIENTE (
  id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) UNIQUE,
  email VARCHAR(150),
  telefone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE PRODUTO (
  id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  id_categ INT NOT NULL,
  preco DECIMAL(12,2) NOT NULL,
  estoque INT NOT NULL,
  FOREIGN KEY (id_categ) REFERENCES CATEGORIA(id_categ)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE PEDIDO (
  id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  dt_pedido DATE NOT NULL,
  vl_total DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE ITEM_PEDIDO (
  id_item INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  vl_item DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE CARGO (
  id_cargo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome_cargo VARCHAR(80) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE FUNCIONARIO (
  id_funcionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  id_cargo INT NOT NULL,
  salario DECIMAL(12,2) NOT NULL,
  dt_contratacao DATE,
  FOREIGN KEY (id_cargo) REFERENCES CARGO(id_cargo)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE TIPO_PAGTO (
  id_tp_pagto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tipo_pagto VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE PAGAMENTO (
  id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_tp_pagto INT,
  id_funcionario INT,
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_tp_pagto) REFERENCES TIPO_PAGTO(id_tp_pagto)
    ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

-- 2) INSERÇÕES 
INSERT INTO CATEGORIA (nome_categ) VALUES
('Futebol'), ('Vestuário'), ('Corrida');

INSERT INTO CLIENTE (nome, cpf, email, telefone) VALUES
('Mariana Silva',   123456789, 'mariana.silva@gmail.com', '(11) 9 8123-4567'),
('Carlos Souza',    987654321, 'c.souza@gmail.com',        '(21) 9 8765-4321'),
('Ana Paula Oliveira',111222333, 'ana.paula@gmail.com.br',   '(31) 9 9988-7766');

INSERT INTO PRODUTO (nome, id_categ, preco, estoque) VALUES
('Bola de Futebol - Tamanho 5', 1, 89.90, 30),
('Camisa de Treino Masculina - G', 2, 129.90, 25),
('Tênis Corrida Feminino', 3, 349.50, 12);

INSERT INTO CARGO (nome_cargo) VALUES ('Vendedor'), ('Gerente');

INSERT INTO FUNCIONARIO (nome, id_cargo, salario, dt_contratacao) VALUES
('Rafael Mendes', 1, 2800.00, '2024-01-10'),
('Sônia Carvalho', 2, 5200.00, '2020-05-01');

INSERT INTO TIPO_PAGTO (tipo_pagto) VALUES ('Cartão'), ('Boleto');

-- PEDIDOS
INSERT INTO PEDIDO (id_cliente, dt_pedido, vl_total) VALUES
(1, '2025-09-10', 219.80),
(2, '2025-08-20', 89.90);

-- ITEM_PEDIDO
INSERT INTO ITEM_PEDIDO (id_pedido, id_produto, quantidade, vl_item) VALUES
(1, 1, 1, 89.90),
(1, 2, 1, 129.90),
(2, 1, 1, 89.90);

-- PAGAMENTO
INSERT INTO PAGAMENTO (id_pedido, id_tp_pagto, id_funcionario) VALUES
(1, 1, 2);


-- 2) CONSULTAS
-- A) Liste o nome e email de todos os clientes cadastrados
SELECT nome, email FROM CLIENTE;

-- B) Exiba os produtos disponíveis e seus preços, ordenados por categoria
SELECT p.id_produto, p.nome, c.nome_categ, p.preco
FROM PRODUTO  AS p
JOIN CATEGORIA AS c ON p.id_categ = c.id_categ
ORDER BY c.nome_categ;

-- C) Mostre os pedidos realizados por um cliente específico (ex.: id_cliente = 1)
SELECT * FROM PEDIDO WHERE id_cliente = 1;

-- 3) ATUALIZAÇÂO DE DADOS
-- A) Atualizar telefone de um cliente (ex.: cliente id 2 mudou o telefone)
UPDATE CLIENTE
SET telefone = '(13) 9 9999-0000'
WHERE id_cliente = 2;

SELECT id_cliente, nome, telefone FROM CLIENTE WHERE id_cliente = 2;

-- B) Atualizar preço de um produto (ex.: aumentar 10% no produto id 3)
UPDATE PRODUTO
SET preco = ROUND(preco * 1.10, 2)
WHERE id_produto = 3;

SELECT id_produto, nome, preco FROM PRODUTO WHERE id_produto = 3;

-- C) Atualizar salário de um funcionário (ex.: adicionar R$300 ao funcionário id 1)
UPDATE FUNCIONARIO
SET salario = salario + 300.00
WHERE id_funcionario = 1;

SELECT id_funcionario, nome, salario FROM FUNCIONARIO WHERE id_funcionario = 1;

-- 4) DELETES

-- A) Apagar um pedido
DELETE FROM PEDIDO WHERE id_pedido = 2;

SELECT * FROM PEDIDO WHERE id_pedido = 2;

-- 5) CONSULTA COM FILTRO 
-- A) Liste todos os pedidos com valor total acima de R$ 200,00.
SELECT id_pedido, id_cliente, dt_pedido, vl_total
FROM PEDIDO
WHERE vl_total > 200.00
ORDER BY vl_total DESC;

-- B) Exiba os pagamentos que ainda estão pendentes (pedidos não pagos)
SELECT p.id_pedido, p.id_cliente, p.dt_pedido, p.vl_total
FROM PEDIDO p
LEFT JOIN PAGAMENTO pg ON p.id_pedido = pg.id_pedido
WHERE pg.id_pagamento IS NULL;

-- c) Mostre os clientes que compraram um determinado produto
SELECT DISTINCT c.id_cliente, c.nome, c.email
FROM CLIENTE c
JOIN PEDIDO p ON c.id_cliente = p.id_cliente
JOIN ITEM_PEDIDO ip ON p.id_pedido = ip.id_pedido
WHERE ip.id_produto = 1;
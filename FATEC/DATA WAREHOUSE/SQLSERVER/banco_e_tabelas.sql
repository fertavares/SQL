CREATE DATABASE PEDIDO
 ON  PRIMARY 
( NAME = N'PEDIDO', FILENAME = N'C:\CLAUDIA\PEDIDO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PEDIDO_log', FILENAME = N'C:\CLAUDIA\PEDIDO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB );


--CRIAÇÃO DAS TABELAS PARA O LANDIGN DOS DADOS (RAW AREA)
USE [PEDIDO];

CREATE TABLE cidades(
	id_cidade varchar(50) NULL,
	nome_cidade varchar(50) NULL,
	uf varchar(50) NULL);

CREATE TABLE clientes(
	id_cliente varchar(50) NULL,
	nome varchar(50) NULL,
	data_nasciment] date NULL,
	sexo varchar(50) NULL,
	id_cidade varchar(50) NULL); 

CREATE TABLE entregas(
	id_entrega varchar(50) NULL,
	id_pedido varchar(50) NULL,
	data_entrega date NULL,
	transportadora varchar(50) NULL,
	custo_frete varchar(50) NULL);

CREATE TABLE itens_pedidos(
	id_pedido varchar(50) NULL,
	id_produto varchar(50) NULL,
	quantidade varchar(50) NULL,
	preco_unitario varchar(50) NULL,
	desconto varchar(50) NULL);

CREATE TABLE lojas(
	id_loja varchar(50) NULL,
	nome varchar(50) NULL,
	id_cidade varchar(50) NULL,
	gerente varchar(50) NULL);

CREATE TABLE pedidos(
	id_pedido varchar(50) NULL,
	id_cliente varchar(50) NULL,
	id_vendedor varchar(50) NULL,
	data_pedido date NULL,
	valor_total varchar(50) NULL);

CREATE TABLE produtos(
	id_produto varchar(50) NULL,
	nome varchar(50) NULL,
	categoria varchar(50) NULL,
	marca varchar(50) NULL,
	preco_unitario varchar](50) NULL);

CREATE TABLE [dbo].[vendedor](
	[id_vendedor] [varchar](50) NULL,
	[nome] [varchar](50) NULL,
	[id_loja] [varchar](50) NULL);


--CRIAÇÃO DAS TABELAS PARA OS DADOS TRANSFORMADOS (AREA DE PRE_CARGA)

CREATE TABLE DIM_CIDADE(
	id_cidade int NOT NULL,
	nome_cidade varchar(50) NULL,
	nome_estado varchar(50) NULL,
 CONSTRAINT PK_DIM_CIDADE PRIMARY KEY CLUSTERED (id_cidade));

CREATE TABLE DIM_CLIENTE(
	id_cliente int NOT NULL,
	nome_cliente varchar(50) NULL,
	sexo varchar(10) NULL,
 CONSTRAINT PK_DIM_CLIENTE PRIMARY KEY CLUSTERED (id_cliente));

CREATE TABLE DIM_FX_ETARIA(
	id_fx_etaria int NOT NULL,
	faixa_etaria varchar(50) NULL,
 CONSTRAINT PK_DIM_FX_ETARIA PRIMARY KEY CLUSTERED (id_fx_etaria));

CREATE TABLE DIM_GERENTE(
	id_gerente char(3) NOT NULL,
	nome_gerente varchar(50) NULL,
 CONSTRAINT PK_DIM_GERENTE PRIMARY KEY CLUSTERED (id_gerente));

CREATE TABLE DIM_LOJA(
	id_loja int NOT NULL,
	nome_loja varchar(50) NULL,
 CONSTRAINT PK_DIM_LOJA PRIMARY KEY CLUSTERED (id_loja));

CREATE TABLE DIM_PRODUTO(
	id_produto int NOT NULL,
	nome_produto varchar(50) NULL,
	marca varchar(50) NULL,
	categoria varchar(50) NULL,
 CONSTRAINT PK_DIM_PRODUTO PRIMARY KEY CLUSTERED (id_produto));

CREATE TABLE DIM_TEMPO(
	id_data date NOT NULL,
	dia_semana varchar(50) NULL,
	mes varchar(50) NULL,
	ano varchar(4) NULL,
 CONSTRAINT PK_DIM_TEMPO PRIMARY KEY CLUSTERED (id_data));

CREATE TABLE DIM_TRANSPORTE(
	id_transportadora char(3) NOT NULL,
	nome_transportadora varchar(50) NULL,
 CONSTRAINT PK_DIM_TRANSPORTE PRIMARY KEY CLUSTERED (id_transportadora));

CREATE TABLE DIM_VENDEDOR(
	id_vendedor int NOT NULL,
	nome_vendedor varchar(50) NULL,
 CONSTRAINT PK_DIM_VENDEDOR PRIMARY KEY CLUSTERED (id_vendedor));
 

CREATE TABLE FATO_VENDA(
	sk_venda varchar(50) NOT NULL,
	dt_venda date NULL,
	dt_envio date NULL,
	dt_entrega date NULL,
	id_cliente int NULL,
	id_fx_etaria int NULL,
	id_cidade_cli int NULL,
	id_produto int NULL,
	id_vendedor int NULL,
	id_loja int NULL,
	id_cidade_loja int NULL,
	id_gerente char(3) NULL,
	id_transportadora char(3) NULL,
	qtde_vendida float NULL,
	vl_bruto_venda float NULL,
	vl_liq_venda float NULL,
	vl_desconto float NULL,
	vl_frete float NULL,
	tmp_envio int NULL,
	tmp_preparo int NULL,
 CONSTRAINT PK_FATO_VENDA PRIMARY KEY CLUSTERED (sk_venda));

-- chaves estrangeiras da fato para conectar com as dimensões
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_CIDADE FOREIGN KEY(id_cidade_cli) REFERENCES DIM_CIDADE (id_cidade)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_CIDADE1 FOREIGN KEY(id_cidade_loja) REFERENCES DIM_CIDADE (id_cidade)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_CLIENTE FOREIGN KEY(id_cliente) REFERENCES DIM_CLIENTE] (id_cliente)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_FX_ETARIA FOREIGN KEY(id_fx_etaria) REFERENCES DIM_FX_ETARIA (id_fx_etaria)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_GERENTE FOREIGN KEY(id_gerente) REFERENCES DIM_GERENTE (id_gerente)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_LOJA	FOREIGN KEY(id_loja) REFERENCES DIM_LOJA (id_loja)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_PRODUTO FOREIGN KEY(id_produto) REFERENCES DIM_PRODUTO (id_produto)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_TEMPO FOREIGN KEY(dt_venda) REFERENCES DIM_TEMPO (id_data)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_TEMPO1 FOREIGN KEY(dt_envio) REFERENCES DIM_TEMPO (id_data)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_TEMPO2 FOREIGN KEY(dt_entrega) REFERENCES DIM_TEMPO (id_data)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_TRANSPORTE FOREIGN KEY(id_transportadora) REFERENCES DIM_TRANSPORTE (id_transportadora)
ALTER TABLE FATO_VENDA WITH CHECK ADD CONSTRAINT FK_FATO_VENDA_DIM_VENDEDOR FOREIGN KEY(id_vendedor) REFERENCES DIM_VENDEDOR (id_vendedor)


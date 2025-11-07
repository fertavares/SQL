-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Jun-2023 às 00:06
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_skedoo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start_event` date DEFAULT NULL,
  `end_event` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_05_15_181627_create_events_table', 0),
(2, '2023_05_15_181627_create_tb_aluno_table', 0),
(3, '2023_05_15_181627_create_tb_bairro_table', 0),
(4, '2023_05_15_181627_create_tb_cadastro_table', 0),
(5, '2023_05_15_181627_create_tb_cardapio_table', 0),
(6, '2023_05_15_181627_create_tb_cidade_table', 0),
(7, '2023_05_15_181627_create_tb_contato_table', 0),
(8, '2023_05_15_181627_create_tb_endereco_table', 0),
(9, '2023_05_15_181627_create_tb_forma_pagamento_table', 0),
(10, '2023_05_15_181627_create_tb_instituicao_table', 0),
(11, '2023_05_15_181627_create_tb_login_table', 0),
(12, '2023_05_15_181627_create_tb_mensagem_table', 0),
(13, '2023_05_15_181627_create_tb_pagamento_table', 0),
(14, '2023_05_15_181627_create_tb_profissional_table', 0),
(15, '2023_05_15_181627_create_tb_responsavel_table', 0),
(16, '2023_05_15_181627_create_tb_responsavel_aluno_table', 0),
(17, '2023_05_15_181627_create_tb_status_pagamento_table', 0),
(18, '2023_05_15_181627_create_tb_turma_table', 0),
(19, '2023_05_15_181627_create_tb_uf_table', 0),
(20, '2023_05_15_181630_add_foreign_keys_to_tb_aluno_table', 0),
(21, '2023_05_15_181630_add_foreign_keys_to_tb_bairro_table', 0),
(22, '2023_05_15_181630_add_foreign_keys_to_tb_cidade_table', 0),
(23, '2023_05_15_181630_add_foreign_keys_to_tb_contato_table', 0),
(24, '2023_05_15_181630_add_foreign_keys_to_tb_endereco_table', 0),
(25, '2023_05_15_181630_add_foreign_keys_to_tb_instituicao_table', 0),
(26, '2023_05_15_181630_add_foreign_keys_to_tb_login_table', 0),
(27, '2023_05_15_181630_add_foreign_keys_to_tb_mensagem_table', 0),
(28, '2023_05_15_181630_add_foreign_keys_to_tb_pagamento_table', 0),
(29, '2023_05_15_181630_add_foreign_keys_to_tb_profissional_table', 0),
(30, '2023_05_15_181630_add_foreign_keys_to_tb_responsavel_table', 0),
(31, '2023_05_15_181630_add_foreign_keys_to_tb_responsavel_aluno_table', 0),
(32, '2023_05_15_190143_create_tb_cardapio_table', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_aluno`
--

CREATE TABLE `tb_aluno` (
  `cd_aluno` int(11) NOT NULL,
  `nm_aluno` varchar(80) DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `cd_certidao` varchar(32) DEFAULT NULL,
  `im_vacinacao` tinyblob DEFAULT NULL,
  `im_aluno` tinyblob DEFAULT NULL,
  `cd_contato` char(14) DEFAULT NULL,
  `se_problema_saude` int(11) DEFAULT NULL,
  `nm_problema_saude` varchar(100) DEFAULT NULL,
  `nm_grav_saude` varchar(12) NOT NULL,
  `ds_problema_saude` varchar(300) DEFAULT NULL,
  `nm_tipo_ps` varchar(20) DEFAULT NULL,
  `cd_turma` int(11) DEFAULT NULL,
  `cd_instituicao` int(11) DEFAULT NULL,
  `cd_responsavel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_aluno`
--

INSERT INTO `tb_aluno` (`cd_aluno`, `nm_aluno`, `dt_nascimento`, `cd_certidao`, `im_vacinacao`, `im_aluno`, `cd_contato`, `se_problema_saude`, `nm_problema_saude`, `nm_grav_saude`, `ds_problema_saude`, `nm_tipo_ps`, `cd_turma`, `cd_instituicao`, `cd_responsavel`) VALUES
(1000001, 'Olivia Francisca Marcela Barbosa', '2019-04-13', '27838601552018142389640541258941', NULL, NULL, '11159', NULL, 'sopro Cardíaco', 'Gravissima', 'Teste para verificação', 'cardiaco', 123, 90001, 1),
(1000002, 'Pietro Paulo Assunção', '2019-05-14', '19067201552022149175876147902901', NULL, NULL, '11111', NULL, 'Asma com risco de exacerbações', 'Grave', 'O tratamento é feito com: Broncodilatadores inalatórios (beta-2-agonistas).', 'respiratorio', 321, 90001, 2),
(1000003, 'Nicole Benedita Araújo', '2018-01-02', '22454301552015192012866818453511', NULL, NULL, '11112', NULL, 'Diabetes', 'Grave', 'deve-se fazer acompanhamento.', 'outro', 321, 90002, 3),
(1000004, 'Guilherme Osvaldo Paulo da Paz', '2020-07-01', '2776760155201214366679096791113', NULL, NULL, '11113', NULL, 'Alergias alimentares', 'Grave', 'Evitar comida de porco. Controlar com medicamento.', 'alergico', 147, 90001, 4),
(1000005, 'Cláudio Arthur Nelson Souza', '2019-05-21', '21447101552019138206926529142811', NULL, NULL, '11114', NULL, 'Transtornos do sono moderados', 'Moderada', 'fazer uso de medicamentos para tratar a condição e melhorar, a qualidade do sono.', 'outro', 147, 90002, 5),
(1000006, 'Silvana Clarice Isabel Farias', '2019-07-04', '29655401552017120405398956206315', NULL, NULL, '11115', NULL, NULL, '', NULL, NULL, 123, 90001, 6),
(1000007, 'Anthony Filipe Bruno Drumond', '2019-07-14', '29685801552019164100651908366447', NULL, NULL, '11116', NULL, NULL, '', NULL, NULL, 321, 90001, 7),
(1000008, 'Pietra Rebeca dos Santos', '2019-02-10', '15544001552011171897952609631211', NULL, NULL, '11117', NULL, NULL, '', NULL, NULL, 321, 90002, 8),
(1000009, 'Isaac Tomás Moreira', '2019-03-03', '19299401552012166034195190866854', NULL, NULL, '11118', NULL, NULL, '', NULL, NULL, 321, 90001, 9),
(1000010, 'Rosa Patrícia Vera Teixeira', '2019-03-07', '18640501552020152714672575288689', NULL, NULL, '11119', NULL, NULL, '', NULL, NULL, 321, 90001, 10),
(1000011, 'Anderson Elias Tiago Figueiredo', '2020-01-04', '21944901552016155291627658335211', NULL, NULL, '11120', NULL, NULL, '', NULL, NULL, 321, 90001, 11),
(1000012, 'César Kaique Juan Silveira', '2019-05-07', '16845901552018110644922344654787', NULL, NULL, '11121', NULL, NULL, '', NULL, NULL, 321, 90001, 12),
(1000013, 'Camila Luzia Yasmin Pires', '2019-09-01', '19513701552018167158616695827449', NULL, NULL, '11122', NULL, NULL, '', NULL, NULL, 321, 90002, 13),
(1000014, 'Miguel César Martins', '2019-08-11', '23861601552013152104509166728669', NULL, NULL, '11123', NULL, NULL, '', NULL, NULL, 321, 90001, 14),
(1000015, 'Igor Nicolas Victor Nogueira', '2019-12-30', '10562701552019124739381251258511', NULL, NULL, '11124', NULL, NULL, '', NULL, NULL, 123, 90001, 15),
(1000016, 'Andrea Yasmin Sales', '2019-09-04', '23046701552021167124965257800162', NULL, NULL, '11125', NULL, NULL, '', NULL, NULL, 123, 90001, 16),
(1000017, 'Rita Alessandra Ferreira', '2019-06-01', '22741301552013163042972734151411', NULL, NULL, '11126', NULL, NULL, '', NULL, NULL, 147, 90001, 17),
(1000018, 'Ryan Leonardo Lucas Caldeira', '2018-06-17', '16485801552010112566816464834215', NULL, NULL, '11127', NULL, NULL, '', NULL, NULL, 321, 90001, 18),
(1000019, 'Ricardo Ruan Nascimento', '2018-06-06', '20899101552019146152197763158374', NULL, NULL, '11128', NULL, NULL, '', NULL, NULL, 123, 90001, 19),
(1000020, 'Jennifer Vera Dias', '2018-12-30', '22265801552022111303900156851580', NULL, NULL, '11129', NULL, NULL, '', NULL, NULL, 123, 90001, 20),
(1000021, 'Pietro Emanuel Rocha', '2019-09-21', '13207401552012146085440127478619', NULL, NULL, '11130', NULL, NULL, '', NULL, NULL, 147, 90001, 21),
(1000022, 'Samuel Tiago Ryan Rodrigues', '2018-06-22', '21341901552018199927449802334592', NULL, NULL, '11131', NULL, NULL, '', NULL, NULL, 147, 90001, 22),
(1000023, 'Sandra Luciana Ramos', '2018-06-11', '17067401552015106111482843704122', NULL, NULL, '11131', NULL, NULL, '', NULL, NULL, 147, 90001, 23),
(1000024, 'Yuri Raimundo Nelson Barros', '2018-07-07', '19537801552018108390265382318160', NULL, NULL, '11132', NULL, NULL, '', NULL, NULL, 147, 90001, 24),
(1000025, 'Alice Nina Evelyn Baptista', '2019-08-02', '16930601552013133072145102509563', NULL, NULL, '11133', NULL, NULL, '', NULL, NULL, 147, 90001, 25),
(1000026, 'Sarah Sarah Nair Bernardes', '2019-07-01', '25815501552016180001232232457634', NULL, NULL, '11134', NULL, NULL, '', NULL, NULL, 123, 90001, 26),
(1000027, 'Marina Daiane Raimunda Campos', '2020-01-07', '12781001552012172707932998318442', NULL, NULL, '11135', NULL, NULL, '', NULL, NULL, 123, 90001, 27),
(1000028, 'Carlos Eduardo Guilherme Enrico da Rocha', '2020-02-20', '24831201552012153456744149418298', NULL, NULL, '11136', NULL, NULL, '', NULL, NULL, 147, 90001, 28),
(1000029, 'Gael Manuel Fernandes', '2020-01-13', '16472201552012195222131902824966', NULL, NULL, '11137', NULL, NULL, '', NULL, NULL, 321, 90001, 29),
(1000030, 'Andrea Sabrina Lívia Almada', '2019-07-19', '28105501552022126002009471264719', NULL, NULL, '11138', NULL, NULL, '', NULL, NULL, 321, 90001, 30),
(1000031, 'Gustavo Ricardo Caleb Teixeira', '2020-09-01', '28432701552010129884365926564095', NULL, NULL, '11139', NULL, NULL, '', NULL, NULL, 321, 90001, 31),
(1000032, 'Vanessa Melissa Agatha Costa', '2020-11-02', '16569001552010151797893484006973', NULL, NULL, '11140', NULL, NULL, '', NULL, NULL, 123, 90001, 32),
(1000033, 'Vicente Carlos Campos', '2019-12-04', '15443901552015129297825527091288', NULL, NULL, '11141', NULL, NULL, '', NULL, NULL, 147, 90002, 33),
(1000034, 'Valentina Eduarda Santos', '2019-05-05', '11535701552017137498734239963697', NULL, NULL, '11142', NULL, NULL, '', NULL, NULL, 147, 90002, 34),
(1000035, 'Anthony Francisco Edson Nunes', '2020-09-01', '21580001552015140061282779102095', NULL, NULL, '11143', NULL, NULL, '', NULL, NULL, 147, 90002, 35),
(1000036, 'Igor Márcio Viana', '2019-09-06', '1055950155201214596763042771288', NULL, NULL, '11144', NULL, NULL, '', NULL, NULL, 147, 90002, 36),
(1000037, 'Julio Gustavo da Rocha', '2020-02-14', '27534601552021114245854430962461', NULL, NULL, '11145', NULL, NULL, '', NULL, NULL, 147, 90002, 37),
(1000038, 'Hadassa Manuela Novaes', '2022-09-23', '16820201552010195916709780589011', NULL, NULL, '11146', NULL, NULL, '', NULL, NULL, 147, 90002, 38),
(1000039, 'Raimunda Isabela Martins', '2020-01-18', '2440550155201316741965086427711', NULL, NULL, '11147', NULL, NULL, '', NULL, NULL, 147, 90002, 39),
(1000040, 'Caleb André Vieira', '2020-01-21', '14311601552020163990665924292303', NULL, NULL, '11148', NULL, NULL, '', NULL, NULL, 147, 90002, 40),
(1000041, 'Jéssica Lívia Alessandra Pinto', '2020-02-02', '2407850155202211420504880245237', NULL, NULL, '11149', NULL, NULL, '', NULL, NULL, 147, 90002, 41),
(1000042, 'Ian Eduardo Thiago Nascimento', '2020-08-01', '14921901552019169805164931442875', NULL, NULL, '11150', NULL, NULL, '', NULL, NULL, 147, 90002, 42),
(1000043, 'Carlos Otávio André Ramos', '2019-07-16', '15790801552014148473306632862001', NULL, NULL, '11151', NULL, NULL, '', NULL, NULL, 147, 90002, 43),
(1000044, 'Esther Cristiane Nogueira', '2018-12-04', '1321740155201612831340425944481', NULL, NULL, '11152', NULL, NULL, '', NULL, NULL, 147, 90002, 44),
(1000045, 'Evelyn Agatha Stella Porto', '2021-07-13', '22748701552017172815901506435535', NULL, NULL, '11153', NULL, NULL, '', NULL, NULL, 147, 90002, 45),
(1000046, 'Osvaldo Sebastião Moraes', '2020-04-17', '26493201552018172502300297270168', NULL, NULL, '11154', NULL, NULL, '', NULL, NULL, 123, 90002, 46),
(1000047, 'Benício Lucas Lorenzo da Mota', '2019-06-17', '16504601552021158146344397179164', NULL, NULL, '11155', NULL, NULL, '', NULL, NULL, 321, 90002, 47),
(1000048, 'Giovanni Luan Caio Pires', '2020-04-09', '24050801552011101233850428189253', NULL, NULL, '11156', NULL, NULL, '', NULL, NULL, 321, 90002, 48),
(1000049, 'Letícia Elza Giovana Pereira', '2020-10-10', '2347180155201816542602423681508', NULL, NULL, '11157', NULL, NULL, '', NULL, NULL, 123, 90002, 49),
(1000050, 'Tomás Guilherme Cláudio da Mata', '2020-08-17', '2816620155201311193000136605710', NULL, NULL, '11158', NULL, NULL, '', NULL, NULL, 123, 90002, 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bairro`
--

CREATE TABLE `tb_bairro` (
  `cd_bairro` int(11) NOT NULL,
  `nm_bairro` varchar(45) DEFAULT NULL,
  `cd_cidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_bairro`
--

INSERT INTO `tb_bairro` (`cd_bairro`, `nm_bairro`, `cd_cidade`) VALUES
(101, 'Catiapoa', 10101010),
(102, 'Centro', 10101010),
(103, 'Cidade Naútica', 10101010),
(104, 'Conjunto Residencial Humaitá', 10101010),
(105, 'Conjunto Residencial Tancredo Neves', 10101010),
(106, 'Esplanada dos Barreiros', 10101010),
(107, 'Jardim Guassu', 10101010),
(108, 'Jardim Irmã Dolores', 10101010),
(109, 'Jardim Rio Branco', 10101010),
(110, 'Morro dos Barbosas', 10101010),
(111, 'Parque Continental', 10101010),
(112, 'Parque das Bandeiras', 10101010),
(113, 'Parque São Vicente', 10101010),
(114, 'Samarita', 10101010),
(115, 'Vila Cascatinha', 10101010),
(117, 'Vila Jockei Clube', 10101010),
(118, 'Vila Margarida', 10101010),
(119, 'Vila Mateo Bei', 10101010),
(120, 'Vila Nova São Vicente', 10101010),
(121, 'Vila Valença', 10101010);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cadastro`
--

CREATE TABLE `tb_cadastro` (
  `cd_cadastro` int(11) NOT NULL,
  `nm_login` varchar(45) DEFAULT NULL,
  `cd_senha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cadastro`
--

INSERT INTO `tb_cadastro` (`cd_cadastro`, `nm_login`, `cd_senha`) VALUES
(200001, 'lorenzo_assis', 'w1TWu00PAe '),
(200002, 'nair.giovana.fogaca', 'y0q2jLPtna '),
(200003, 'rafael_figueiredo', '8emoE95MsF '),
(200004, 'aurora_patricia_rezende', 'hxxQjBLEgl '),
(200005, 'rita-almeida90', 'FKH90LsAUY '),
(200006, 'paulo.luan.silva', 'OY2RemGcxt '),
(200007, 'sabrina-cavalcanti88', 'wylA1oTnWL '),
(200008, 'murilo.tomas.barros', 'kot6QqlJql '),
(200009, 'antonia_goncalves', '2GQiLMQdyK '),
(200010, 'geraldohenryjesus', 'dJpgOY4Yl8 '),
(200011, 'felipejosedapaz', 'wi9DOyLt77 '),
(200012, 'adriana-lima84', 'IlxJai02xT'),
(200013, 'roberto.daniel.vieira', 'sr7Em9RHg0'),
(200014, 'luna_viana', '3j6SinGohz'),
(200015, 'clarice_ribeiro', '5C9L3509R9'),
(200016, 'marcela_depaula', 'eG2wENmtO9'),
(200017, 'marcianataliasilveira', 'M4JYcmWre5'),
(200018, 'victor-daconceicao90 ', 'y6WEU0IsQ7'),
(200019, 'allana_santos ', 'b3xDRX8YFi'),
(200020, 'mariana.joana.cardoso ', 'MIAiadXjyU'),
(200021, 'thiagovictornascimento ', 'Q3Hjuy5bfF'),
(200022, 'heloisa_jennifer_dossantos ', '5KIWGDrUqF'),
(200023, 'leticiaalinepereira ', 'XO5Tydjrp3'),
(200024, 'sandra.marcia.cortereal ', 'rK31MlHxP4'),
(200025, 'caroline-damota98 ', 'YLRiFFuYCY'),
(200026, 'guilherme-alves85 ', 'WRT3TmEsCf'),
(200027, 'vanessa-fernandes86 ', '6FyRCiGdRC'),
(200028, 'rodrigo-baptista73 ', 'CCttXWAckW'),
(200029, 'aurora_novaes ', '0c8C5tCYy1'),
(200030, 'lara_castro ', '3ilHoTC7En'),
(200031, 'cauafabiogoncalves', 'nIt9HDSt3f'),
(200032, 'cristiane-martins99 ', 'f8HS4iT7xu'),
(200033, 'daiane_louise_galvao ', 'mp9kZsDbMc'),
(200034, 'kamilly.flavia.fernandes ', 'fDe6CfdsZq'),
(200035, 'filipe_dasneves ', '02TXhrGLfP'),
(200036, 'carla.vitoria.cardoso ', 'N9gg3QiYfl'),
(200037, 'enrico-ribeiro79 ', 'GLZD0rBOCR'),
(200038, 'tomasthomassantos ', 'w6YZ0XoALf'),
(200039, 'esther_ferreira ', 'NFJ7FRqL6D'),
(200040, 'elzacamilavieira ', 'm1ay2AKcdw'),
(200041, 'julia_moura ', 'eAgCGULfjH'),
(200042, 'vinicius_damota ', 'eBkEWhDmng'),
(200043, 'sergio_kaique_daconceicao ', 'CXg2OB7jkM'),
(200044, 'diego.joaquim.gomes ', 'cznSQGXIiT'),
(200045, 'caroline_sabrina_pires ', 'zqjMTBaxeF'),
(200046, 'enzobeneditoalmeida ', 'opHW87Wa4H'),
(200047, 'eduardosergiosilva ', 'ePXhkGLzyn'),
(200048, 'emanuelly-porto80 ', 'rNESeosZNi'),
(200049, 'alice_darocha ', 'mZAarEnC05'),
(200050, 'raimundaisabelledias ', 'H6BxpM3o8Y'),
(200051, 'Creche.ep ', 'Gd9bMJtNn5'),
(200052, 'SC_cuida ', '7gPMDYY4pM'),
(200053, 'Cristiane-Francisca', 'r312osZNi'),
(200054, 'Manuela-Fabiana', 'mvxerwrEnC05'),
(200055, 'Daiane-Lima', 'H6BxpM3o8Y'),
(200056, 'Giovanna-Baptista', 'Gd9b432n5'),
(200057, 'Fabiana-Marina', '7gPMD21pM'),
(200058, 'Betina-Gomes', 'QWR47sZNi'),
(200059, 'Mirella-Sandra', 'm231dfsxc05'),
(200060, 'Isabella-Sales', 'HDSAD12o8Y'),
(200061, 'Ayla-Carolina', 'G2RSADMNn5'),
(200062, 'Alice_Vieira', '123PMDYY4psM'),
(200063, 'Andreia-Barbosa', 'ofd321ASD'),
(200064, 'Andrea-Alves', 'cxzASEnC05'),
(200065, 'Isabelle-Cavalcanti', 'BVCM3o8Y'),
(200066, 'Carlos-Santos', '5ASDJtNn5'),
(200067, 'Vinicius-Silva', '721AS4pM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cardapio`
--

CREATE TABLE `tb_cardapio` (
  `id_cardapio` int(11) NOT NULL,
  `dt_cardapio` date DEFAULT NULL,
  `nm_ddsemana` varchar(20) DEFAULT NULL,
  `nm_prato` varchar(70) DEFAULT NULL,
  `desc_prato` varchar(150) DEFAULT NULL,
  `cd_cor` varchar(10) DEFAULT NULL,
  `img_prato` varchar(100) DEFAULT NULL,
  `nm_sobremessa` varchar(30) DEFAULT NULL,
  `desc_sobremessa` varchar(100) DEFAULT NULL,
  `img_sobremssa` varchar(70) DEFAULT NULL,
  `img_pdf` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade`
--

CREATE TABLE `tb_cidade` (
  `cd_cidade` int(11) NOT NULL,
  `nm_cidade` varchar(45) DEFAULT NULL,
  `sg_uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cidade`
--

INSERT INTO `tb_cidade` (`cd_cidade`, `nm_cidade`, `sg_uf`) VALUES
(10101010, 'São Vicente', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contato`
--

CREATE TABLE `tb_contato` (
  `cd_contato` int(11) NOT NULL,
  `cd_telefone` varchar(11) DEFAULT NULL,
  `ds_contato` varchar(100) DEFAULT NULL,
  `cd_instituicao` int(11) DEFAULT NULL,
  `cd_responsavel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_contato`
--

INSERT INTO `tb_contato` (`cd_contato`, `cd_telefone`, `ds_contato`, `cd_instituicao`, `cd_responsavel`) VALUES
(11111, '13996470314', 'telefone_fixo: 1338458880', NULL, 1),
(11112, '13997586963', 'telefone_fixo: 1338942116', NULL, 2),
(11113, '13998475894', 'telefone_fix: 1328825287', NULL, 3),
(11114, '13982770835', 'telefone_fixo: 1335161343', NULL, 4),
(11115, '13981234014', 'telefone_fixo: 1336959549', NULL, 5),
(11116, '13988989363', 'telefone_fixo: 1335052825', NULL, 6),
(11117, '13982847004', 'telefone_fixo: 1338693802', NULL, 7),
(11118, '13996081090', 'telefone_fixo: 1325961217', NULL, 8),
(11119, '13987725476', 'telefone_fixo: 1328172504', NULL, 9),
(11120, '13994144461', 'telefone_fixo: 1326323513', NULL, 10),
(11121, '13984006294', 'telefone_fixo: 1326539949', NULL, 11),
(11122, '13982716675', 'telefone_fixo: 1328326420', NULL, 12),
(11123, '13998719077', 'telefone_fixo: 1337026158', NULL, 13),
(11124, '13997208367', 'telefone_fixo: 1335039550', NULL, 14),
(11125, '13981389315', 'telefone_fixo: 1329659904', NULL, 15),
(11126, '13997917201', 'telefone_fixo: 1339867345', NULL, 16),
(11127, '13985629578', 'telefone_fixo: 1336363236', NULL, 17),
(11128, '13995658894', 'telefone_fixo: 1335102583', NULL, 18),
(11129, '13985557064', 'telefone_fixo: 1328343969', NULL, 19),
(11130, '13986128565', 'telefone_fixo: 1327977593', NULL, 20),
(11131, '13986425934', 'telefone_fixo: 1327430643', NULL, 21),
(11132, '13993770111', 'telefone_fixo: 1325221281', NULL, 22),
(11133, '13997225583', 'telefone_fixo: 1335897340', NULL, 23),
(11134, '13987419447', 'telefone_fixo: 1339318009', NULL, 24),
(11135, '13983916955', 'telefone_fixo: 1329322234', NULL, 25),
(11136, '13985037949', 'telefone_fixo: 1338314918', NULL, 26),
(11137, '13987571767', 'telefone_fixo: 1325846284', NULL, 27),
(11138, '13985652400', 'telefone_fixo: 1339671263', NULL, 28),
(11139, '13982991471', 'telefone_fixo: 1339342323', NULL, 29),
(11140, '13983349108', 'telefone_fixo: 1327387890', NULL, 30),
(11141, '13999954442', 'telefone_fixo: 1326618269', NULL, 31),
(11142, '13986421080', 'telefone_fixo: 1338176406', NULL, 32),
(11143, '13987826772', 'telefone_fixo: 1338319000', NULL, 33),
(11144, '13992121158', 'telefone_fixo: 1335537126', NULL, 34),
(11145, '13994296035', 'telefone_fixo: 1325330120', NULL, 35),
(11146, '13985537891', 'telefone_fixo: 1339292519', NULL, 36),
(11147, '13998162065', 'telefone_fixo: 1328126913', NULL, 37),
(11148, '13985606648', 'telefone_fixo: 1337079784', NULL, 38),
(11149, '13994081866', 'telefone_fixo: 1337751752', NULL, 39),
(11150, '13998252299', 'telefone_fixo: 1336206687', NULL, 40),
(11151, '13985547755', 'telefone_fixo: 1327017488', NULL, 41),
(11152, '13997607520', 'telefone_fixo: 1325068520', NULL, 42),
(11153, '13983335473', 'telefone_fixo: 1325304193', NULL, 43),
(11154, '13996069852', 'telefone_fixo: 1325136693', NULL, 44),
(11155, '13981595689', 'telefone_fixo: 1329836497', NULL, 45),
(11156, '13984465619', 'telefone_fixo: 1337820910', NULL, 46),
(11157, '13981846242', 'telefone_fixo: 1325736239', NULL, 47),
(11158, '13991781104', 'telefone_fixo: 1326959125', NULL, 48),
(11159, '13999574761', 'telefone_fixo: 1329045848', NULL, 49),
(11160, '13997630571', 'telefone_fixo: 1336891930', NULL, 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
--

CREATE TABLE `tb_endereco` (
  `cd_endereco` int(11) NOT NULL,
  `nm_endereco` varchar(100) DEFAULT NULL,
  `cd_cep` int(11) DEFAULT NULL,
  `cd_bairro` int(11) DEFAULT NULL,
  `cd_numcasa` int(11) DEFAULT NULL,
  `ds_complemento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_endereco`
--

INSERT INTO `tb_endereco` (`cd_endereco`, `nm_endereco`, `cd_cep`, `cd_bairro`, `cd_numcasa`, `ds_complemento`) VALUES
(1001, 'Rua Eliézer Lopes Fernandes', 11370280, 101, 738, NULL),
(1002, 'Praça Vinte e Dois de Janeiro 336', 11310921, 102, 141, NULL),
(1003, 'Rua José Joaquim de Azevedo', 11355040, 103, 695, NULL),
(1004, 'Rua Antonio Pacífico', 11349285, 104, 686, NULL),
(1005, 'Rua Luís Esteves Cordeiro', 11350410, 105, 268, NULL),
(1006, 'Rua Pio XII', 11340080, 106, 100, NULL),
(1007, 'Avenida Antônio Emmerick', 11370001, 107, 712, NULL),
(1008, 'Rua Jacobina', 11347665, 108, 959, NULL),
(1009, 'Rua José Fagundes Bezerra', 11347070, 109, 554, NULL),
(1010, 'Avenida Presidente Getúlio Vargas', 11310100, 110, 620, NULL),
(1111, 'Rua Oito', 11348440, 111, 773, NULL),
(1112, 'Rua Cid dos Santos', 11346240, 112, 253, NULL),
(1113, 'Parque São Vicente', 11355480, 113, 195, NULL),
(1114, 'Rua Mecanizada Nove Mil Cento e Vinte e Oito', 11345605, 114, 898, NULL),
(1115, 'Avenida Mota Lima', 11370100, 115, 596, NULL),
(1116, 'Avenida Doutor Mário Covas Júnior', 11360560, 117, 387, NULL),
(1118, 'Rua Vinte', 11330821, 118, 186, NULL),
(1119, 'Rua Professor Carlos Araújo dos Santos', 11330030, 119, 303, NULL),
(1120, 'Rua Celeste Diegues Oliveira', 11346350, 120, 629, NULL),
(1121, 'Rua Pero Lopes de Souza', 11390130, 121, 697, NULL),
(100000002, 'Rua das Margaridas', 11548050, 120, 720, NULL),
(100000003, 'Rua das Violetas', 11598050, 110, 620, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_forma_pagamento`
--

CREATE TABLE `tb_forma_pagamento` (
  `cd_forma_pagamento` int(11) NOT NULL,
  `nm_forma_pagamento` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_forma_pagamento`
--

INSERT INTO `tb_forma_pagamento` (`cd_forma_pagamento`, `nm_forma_pagamento`) VALUES
(1, 'Á vista'),
(2, 'A prazo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_instituicao`
--

CREATE TABLE `tb_instituicao` (
  `cd_instituicao` int(11) NOT NULL,
  `nm_instituicao` varchar(80) DEFAULT NULL,
  `cd_cnpj` char(14) DEFAULT NULL,
  `cd_cep` char(8) DEFAULT NULL,
  `cd_profissional` int(11) DEFAULT NULL,
  `nm_email` varchar(100) DEFAULT NULL,
  `cd_contato` int(11) DEFAULT NULL,
  `cd_endereco` int(11) DEFAULT NULL,
  `cd_cadastro` int(11) DEFAULT NULL,
  `cd_pagamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_instituicao`
--

INSERT INTO `tb_instituicao` (`cd_instituicao`, `nm_instituicao`, `cd_cnpj`, `cd_cep`, `cd_profissional`, `nm_email`, `cd_contato`, `cd_endereco`, `cd_cadastro`, `cd_pagamento`) VALUES
(90001, 'Pedro e Elaine Creche ME', '67663269000129', '11310921', 53001, 'pe.creche@hotmail.com', 11161, 100000002, 200051, 111161),
(90002, 'Silvana e Carolina Cuida Ltda', '530859000102', '11349285', 53012, 'Cuida_creche@hotmail.com', 11162, 100000003, 200052, 111162);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

CREATE TABLE `tb_login` (
  `cd_login` int(11) NOT NULL,
  `nm_login` varchar(45) DEFAULT NULL,
  `cd_senha` varchar(20) DEFAULT NULL,
  `cd_responsavel` int(11) DEFAULT NULL,
  `cd_acesso` int(11) DEFAULT NULL,
  `img_perfil` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_login`
--

INSERT INTO `tb_login` (`cd_login`, `nm_login`, `cd_senha`, `cd_responsavel`, `cd_acesso`, `img_perfil`) VALUES
(200001, 'lorenzo_assis', 'w1TWu00PAe ', 1, 3, ''),
(200002, 'nair.giovana.fogaca', 'y0q2jLPtna ', 2, 3, ''),
(200003, 'rafael_figueiredo', '8emoE95MsF ', 3, 3, ''),
(200004, 'aurora_patricia_rezende', 'hxxQjBLEgl ', 4, 3, ''),
(200005, 'rita-almeida90', 'FKH90LsAUY ', 5, 3, ''),
(200006, 'paulo.luan.silva', 'OY2RemGcxt ', 6, 3, ''),
(200007, 'sabrina-cavalcanti88', 'wylA1oTnWL ', 7, 3, ''),
(200008, 'murilo.tomas.barros', 'kot6QqlJql ', 8, 3, ''),
(200009, 'antonia_goncalves', '2GQiLMQdyK ', 9, 3, ''),
(200010, 'geraldohenryjesus', 'dJpgOY4Yl8 ', 10, 3, ''),
(200011, 'felipejosedapaz', 'wi9DOyLt77 ', 11, 3, ''),
(200012, 'adriana-lima84', 'IlxJai02xT', 12, 3, ''),
(200013, 'roberto.daniel.vieira', 'sr7Em9RHg0', 13, 3, ''),
(200014, 'luna_viana', '3j6SinGohz', 14, 3, ''),
(200015, 'clarice_ribeiro', '5C9L3509R9', 15, 3, ''),
(200016, 'marcela_depaula', 'eG2wENmtO9', 16, 3, ''),
(200017, 'marcianataliasilveira', 'M4JYcmWre5', 17, 3, ''),
(200018, 'victor-daconceicao90 ', 'y6WEU0IsQ7', 18, 3, ''),
(200019, 'allana_santos ', 'b3xDRX8YFi', 19, 3, ''),
(200020, 'mariana.joana.cardoso ', 'MIAiadXjyU', 20, 3, ''),
(200021, 'thiagovictornascimento ', 'Q3Hjuy5bfF', 21, 3, ''),
(200022, 'heloisa_jennifer_dossantos ', '5KIWGDrUqF', 22, 3, ''),
(200023, 'leticiaalinepereira ', 'XO5Tydjrp3', 23, 3, ''),
(200024, 'sandra.marcia.cortereal ', 'rK31MlHxP4', 24, 3, ''),
(200025, 'caroline-damota98 ', 'YLRiFFuYCY', 25, 3, ''),
(200026, 'guilherme-alves85 ', 'WRT3TmEsCf', 26, 3, ''),
(200027, 'vanessa-fernandes86 ', '6FyRCiGdRC', 27, 3, ''),
(200028, 'rodrigo-baptista73 ', 'CCttXWAckW', 28, 3, ''),
(200029, 'aurora_novaes ', '0c8C5tCYy1', 29, 3, ''),
(200030, 'lara_castro ', '3ilHoTC7En', 30, 3, ''),
(200031, 'cauafabiogoncalves', 'nIt9HDSt3f', 31, 3, ''),
(200032, 'cristiane-martins99 ', 'f8HS4iT7xu', 32, 3, ''),
(200033, 'daiane_louise_galvao ', 'mp9kZsDbMc', 33, 3, ''),
(200034, 'kamilly.flavia.fernandes ', 'fDe6CfdsZq', 34, 3, ''),
(200035, 'filipe_dasneves ', '02TXhrGLfP', 35, 3, ''),
(200036, 'carla.vitoria.cardoso ', 'N9gg3QiYfl', 36, 3, ''),
(200037, 'enrico-ribeiro79 ', 'GLZD0rBOCR', 37, 3, ''),
(200038, 'tomasthomassantos ', 'w6YZ0XoALf', 38, 3, ''),
(200039, 'esther_ferreira ', 'NFJ7FRqL6D', 39, 3, ''),
(200040, 'elzacamilavieira ', 'm1ay2AKcdw', 40, 3, ''),
(200041, 'julia_moura ', 'eAgCGULfjH', 41, 3, ''),
(200042, 'vinicius_damota ', 'eBkEWhDmng', 42, 3, ''),
(200043, 'sergio_kaique_daconceicao ', 'CXg2OB7jkM', 43, 3, ''),
(200044, 'diego.joaquim.gomes ', 'cznSQGXIiT', 44, 3, ''),
(200045, 'caroline_sabrina_pires ', 'zqjMTBaxeF', 45, 3, ''),
(200046, 'enzobeneditoalmeida ', 'opHW87Wa4H', 46, 3, ''),
(200047, 'eduardosergiosilva ', 'ePXhkGLzyn', 47, 3, ''),
(200048, 'emanuelly-porto80 ', 'rNESeosZNi', 48, 3, ''),
(200049, 'alice_darocha ', 'mZAarEnC05', 49, 3, ''),
(200050, 'raimundaisabelledias ', 'H6BxpM3o8Y', 50, 3, ''),
(200051, 'admin1', 'admin', 51, 1, 'storage/c9qetys1T9Ttn7ppdlHQ50cV17wITjoD0ONrPyC3.png'),
(200052, 'admin2', 'admin', 52, 2, ''),
(200053, 'admin3', 'admin', 53, 3, ''),
(200054, 'mirella.moraes', 'UdAsyCMjl5 ', NULL, 2, ''),
(200055, 'isabella.sales', 'MWRnBYzxEz', NULL, 2, ''),
(200056, 'ayla.carolina', '5GikPPKi1N', NULL, 2, ''),
(200057, 'alice.vieira', 'O5tq2lpfBe', NULL, 2, ''),
(200058, 'andreia.barbosa', '4AO3M2EN62', NULL, 2, ''),
(200059, 'carlos.santos', '8DQo7HrpWp', NULL, 2, ''),
(200060, 'vinicius.silva', '74aKrTjBAk', NULL, 2, ''),
(200061, 'Cristiane Francisca Souza', 'loNz2HlszI', NULL, 1, ''),
(200062, 'Manuela Fabiana Aparício', 'MDXUkJgh25', NULL, 1, ''),
(200063, 'Daiane Luna Carolina Lima', 'BB0ZhEddym', NULL, 1, ''),
(200064, 'Giovanna Juliana Baptista', 'Hka2cNqGRE', NULL, 1, ''),
(200065, 'Fabiana Marina Silva', 'BnrMLBxSOJ', NULL, 1, ''),
(200066, 'Betina Isabelly Gomes', 'JxugYn9ipe', NULL, 1, ''),
(200067, 'Andrea Alana Alves', 'MODqypJLm3', NULL, 1, ''),
(200068, 'Isabelle Isabela Aline Cavalcanti', 'P7plhcPCHF', NULL, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mensagem`
--

CREATE TABLE `tb_mensagem` (
  `cd_mensagem` int(11) NOT NULL,
  `ds_mensagem` varchar(200) DEFAULT NULL,
  `dt_mensagem` date DEFAULT NULL,
  `hr_mensagem` datetime DEFAULT NULL,
  `cd_instituicao` int(11) DEFAULT NULL,
  `cd_responsavel` int(11) DEFAULT NULL,
  `cd_profissional` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pagamento`
--

CREATE TABLE `tb_pagamento` (
  `cd_pagamento` int(11) NOT NULL,
  `cd_responsavel` int(11) DEFAULT NULL,
  `vl_fatura` decimal(9,2) DEFAULT NULL,
  `dt_pagamento` date DEFAULT NULL,
  `cd_forma_pagamento` int(11) DEFAULT NULL,
  `cd_status_pagamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_pagamento`
--

INSERT INTO `tb_pagamento` (`cd_pagamento`, `cd_responsavel`, `vl_fatura`, `dt_pagamento`, `cd_forma_pagamento`, `cd_status_pagamento`) VALUES
(111111, 1, '650.51', '2023-03-21', 1, 1),
(111112, 2, '650.51', '2023-03-26', 2, 2),
(111113, 3, '650.51', '2023-03-28', 2, 3),
(111114, 4, '650.51', '2023-03-27', 1, 1),
(111115, 5, '650.51', '2023-03-24', 2, 1),
(111116, 6, '650.51', '2023-03-23', 1, 1),
(111117, 7, '650.51', '2023-03-22', 1, 1),
(111118, 8, '650.51', '2023-03-21', 1, 1),
(111119, 9, '650.51', '2023-03-21', 2, 1),
(111120, 10, '650.51', '2023-03-27', 1, 1),
(111121, 11, '650.51', '2023-03-28', 2, 2),
(111122, 12, '650.51', '2023-03-25', 2, 2),
(111123, 13, '650.51', '2023-03-25', 1, 2),
(111124, 14, '650.51', '2023-04-03', 1, 1),
(111125, 15, '650.51', '2023-03-20', 2, 1),
(111126, 16, '650.51', '2023-04-24', 1, 3),
(111127, 17, '1100.52', '2023-02-03', 1, 3),
(111128, 18, '1100.52', '2023-02-03', 2, 3),
(111129, 19, '1100.52', '2023-04-03', 1, 1),
(111130, 20, '1100.52', '2023-03-03', 2, 2),
(111131, 21, '1100.52', '2023-01-13', 2, 1),
(111132, 22, '1100.52', '2023-04-03', 1, 1),
(111133, 23, '1100.52', '2023-04-03', 1, 1),
(111134, 24, '1100.52', '2023-04-03', 2, 1),
(111135, 25, '1100.52', '2023-01-03', 1, 1),
(111136, 26, '1100.52', '2023-04-04', 1, 2),
(111137, 27, '1100.52', '2023-01-04', 2, 1),
(111138, 28, '1100.52', '2023-01-04', 1, 3),
(111139, 29, '1100.52', '2023-04-04', 1, 3),
(111140, 30, '1100.52', '2023-04-04', 1, 1),
(111141, 31, '1100.52', '2023-04-04', 1, 1),
(111142, 32, '1100.52', '2023-04-04', 2, 1),
(111143, 33, '1100.52', '2023-01-04', 2, 1),
(111144, 34, '1100.52', '2023-02-07', 2, 1),
(111145, 35, '1100.52', '2023-02-07', 2, 1),
(111146, 36, '1100.52', '2023-01-07', 1, 1),
(111147, 37, '1100.52', '2023-02-07', 2, 1),
(111148, 38, '1100.52', '2023-02-07', 1, 2),
(111149, 39, '1100.52', '2023-04-09', 2, 1),
(111150, 40, '1100.52', '2023-03-07', 1, 1),
(111151, 41, '1100.52', '2023-02-07', 2, 1),
(111152, 42, '1100.52', '2023-01-07', 1, 1),
(111153, 43, '1100.52', '2023-01-07', 1, 1),
(111154, 44, '1100.52', '2023-01-07', 1, 1),
(111155, 45, '1100.52', '2023-02-07', 2, 1),
(111156, 46, '1100.52', '2023-01-07', 1, 1),
(111157, 47, '1100.52', '2023-01-07', 2, 1),
(111158, 48, '1100.52', '2023-02-07', 2, 1),
(111159, 49, '1100.52', '2023-02-07', 1, 3),
(111160, 50, '1100.52', '2023-02-07', 1, 3),
(111161, 51, '1100.52', '2023-02-07', 2, 1),
(111162, 52, '1100.52', '2023-03-07', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_profissional`
--

CREATE TABLE `tb_profissional` (
  `cd_profissional` int(11) NOT NULL,
  `nm_profissional` varchar(80) DEFAULT NULL,
  `cd_cpf` char(11) DEFAULT NULL,
  `nm_funcao` varchar(45) DEFAULT NULL,
  `cd_turma` int(11) DEFAULT NULL,
  `cd_cadastro` int(11) DEFAULT NULL,
  `cd_instituicao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_profissional`
--

INSERT INTO `tb_profissional` (`cd_profissional`, `nm_profissional`, `cd_cpf`, `nm_funcao`, `cd_turma`, `cd_cadastro`, `cd_instituicao`) VALUES
(53002, 'Manuela Fabiana Aparício', '79391766846', 'Vice-Diretora', NULL, 200054, 90001),
(53003, 'Daiane Luna Carolina Lima', '51303687895', 'Coordenadora', NULL, 200055, 90001),
(53004, 'Giovanna Juliana Baptista', '42326584830', 'Secretaria', NULL, 200056, 90001),
(53005, 'Fabiana Marina Silva', '75996261820', 'Sup.Merenda', NULL, 200057, 90001),
(53006, 'Betina Isabelly Gomes', '10428813836', 'Inspetora', 321, 200058, 90001),
(53007, 'Mirella Sandra Clara Moraes', '11371253811', 'Professora', 123, 200059, 90001),
(53008, 'Isabella Nina Patrícia Sales', '26941912820', 'Professora', 123, 200060, 90001),
(53009, 'Ayla Carolina Betina da Mata', '84139531894', 'Professora', 147, 200061, 90001),
(53010, 'Alice Débora Vieira', '7593667804', 'Professora', 147, 200062, 90001),
(53011, 'Andreia Josefa Barbosa', '72222208874', 'Professora', 321, 200063, 90002),
(53012, 'Andrea Alana Alves', '90256018804', 'Diretora', NULL, 200064, 90002),
(53013, 'Isabelle Isabela Aline Cavalcanti', '28392046811', 'Vice-Diretora', NULL, 200065, 90002),
(53014, 'Carlos Augusto Santos', '37663426837', 'Professora', 147, 200066, 90002),
(53015, 'Vinicius Martins Silva', '87428883340', 'Professora', 147, 200067, 90002);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_responsavel`
--

CREATE TABLE `tb_responsavel` (
  `cd_responsavel` int(11) NOT NULL,
  `nm_responsavel` varchar(80) DEFAULT NULL,
  `cd_cpf` char(11) DEFAULT NULL,
  `cd_endereco` int(11) DEFAULT NULL,
  `cd_cadastro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_responsavel`
--

INSERT INTO `tb_responsavel` (`cd_responsavel`, `nm_responsavel`, `cd_cpf`, `cd_endereco`, `cd_cadastro`) VALUES
(1, 'Lorenzo Calebe Caio Assis', '13892962880', 1005, 200001),
(2, 'Nair Giovana Aline Fogaça', '74221965800', 1111, 200002),
(3, 'Rafael Thiago César Figueiredo', '08400249836', 1004, 200003),
(4, 'Aurora Patrícia Daniela Rezende', '39300635816', 1006, 200004),
(5, 'Rita Carolina Almeida', '88789801881', 1119, 200005),
(6, 'Paulo Luan Iago Silva', '65131198801', 1004, 200006),
(7, 'Sabrina Andrea Maitê Cavalcanti', '09317647855', 1115, 200007),
(8, 'Murilo Tomás Barros', '26426338885', 1118, 200008),
(9, 'Antônia Nina Ayla Gonçalves', '08423180891', 1116, 200009),
(10, 'Geraldo Henry Jesus', '55323152800', 1001, 200010),
(11, 'Felipe José Heitor da Paz', '07797264805', 1002, 200011),
(12, 'Adriana Mariana Emily Lima', '67168686828', 1010, 200012),
(13, 'Roberto Daniel Vieira', '87236269840', 1007, 200013),
(14, 'Luna Simone Viana', '36673426837', 1118, 200014),
(15, 'Clarice Clara Aparecida Ribeiro', '87428338840', 1010, 200015),
(16, 'Marcela Maya de Paula', '68879373870', 1113, 200016),
(17, 'Márcia Natália Silveira', '28805996874', 1010, 200017),
(18, 'Victor Guilherme da Conceição', '42695254873', 1118, 200018),
(19, 'Allana Luna Vera Santos', '95953581858', 1121, 200019),
(20, 'Mariana Joana Renata Cardoso', '72071287894', 1115, 200020),
(21, 'Thiago Victor Nascimento', '62149942828', 1003, 200021),
(22, 'Eduardo Renato', '42828621499', 1005, 200022),
(23, 'Letícia Aline Pereira', '06187684834', 1002, 200023),
(24, 'Sandra Márcia Corte Real', '25581754837', 1001, 200024),
(25, 'Caroline Alana da Mota', '73655519842', 1009, 200025),
(26, 'Guilherme Vicente Alves', '99988831803', 1113, 200026),
(27, 'Vanessa Amanda Fernandes', '84851101880', 1119, 200027),
(28, 'Rodrigo Lucca Severino Baptista', '27915360868', 1118, 200028),
(29, 'Aurora Isabel Sophie Novaes', '32082060896', 1113, 200029),
(30, 'Lara Rebeca Silvana Castro', '59223271860', 1116, 200030),
(31, 'Cauã Fábio Gonçalves', '25584044822', 1114, 200031),
(32, 'Cristiane Joana Mariane Martins', '48524041862', 1009, 200032),
(33, 'Daiane Louise Ester Galvão', '27918597800', 1118, 200033),
(34, 'Kamilly Flávia Fernandes', '26503754850', 1008, 200034),
(35, 'Filipe Vitor Yago das Neves', '38873820808', 1009, 200035),
(36, 'Carla Vitória Cardoso', '30073505811', 1006, 200036),
(37, 'Enrico Lucas Breno Ribeiro', '89903287801', 1009, 200037),
(38, 'Tomás Thomas Santos', '49586838870', 1120, 200038),
(39, 'Esther Isabel Ferreira', '73237451878', 1121, 200039),
(40, 'Elza Camila Vieira', '75692045818', 1120, 200040),
(41, 'Julia Emilly Moura', '84639088884', 1001, 200041),
(42, 'Vinicius Miguel da Mota', '11801063850', 1003, 200042),
(43, 'Sérgio Kaique da Conceição', '26707073869', 1006, 200043),
(44, 'Diego Joaquim Calebe Gomes', '05515855876', 1002, 200044),
(45, 'Caroline Sabrina Sophia Pires', '42029655821', 1002, 200045),
(46, 'Enzo Benedito Almeida', '75337155865', 1114, 200046),
(47, 'Eduardo Sérgio Silva', '07411943843', 1114, 200047),
(48, 'Emanuelly Teresinha Yasmin Porto', '26572962890', 1121, 200048),
(49, 'Alice Caroline da Rocha', '60401320863', 1006, 200049),
(50, 'Raimunda Isabelle Esther Dias', '70983823880', 1112, 200050),
(51, 'admin', '99999999', NULL, NULL),
(52, 'admin', '99999998', NULL, NULL),
(53, 'admin', '99999997', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_responsavel_aluno`
--

CREATE TABLE `tb_responsavel_aluno` (
  `cd_responsavel` int(11) DEFAULT NULL,
  `cd_aluno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_responsavel_aluno`
--

INSERT INTO `tb_responsavel_aluno` (`cd_responsavel`, `cd_aluno`) VALUES
(2, 1000002);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_status_pagamento`
--

CREATE TABLE `tb_status_pagamento` (
  `cd_status_pagamento` int(11) NOT NULL,
  `nm_status_pagamento` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_status_pagamento`
--

INSERT INTO `tb_status_pagamento` (`cd_status_pagamento`, `nm_status_pagamento`) VALUES
(1, 'Pago'),
(2, 'A Pagar'),
(3, 'Atrasado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turma`
--

CREATE TABLE `tb_turma` (
  `cd_turma` int(11) NOT NULL,
  `nm_turma` varchar(50) DEFAULT NULL,
  `ds_periodo` varchar(30) DEFAULT NULL,
  `sg_turma` varchar(5) DEFAULT NULL,
  `cd_total_aluno` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_turma`
--

INSERT INTO `tb_turma` (`cd_turma`, `nm_turma`, `ds_periodo`, `sg_turma`, `cd_total_aluno`) VALUES
(123, 'Junior Infantil', 'Manhã', 'JI', 15),
(147, 'Infantil Master', 'Integral', 'IM', 15),
(321, 'Segundo Infantil', 'Tarde', 'SI', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_uf`
--

CREATE TABLE `tb_uf` (
  `sg_uf` char(2) NOT NULL,
  `nm_uf` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_uf`
--

INSERT INTO `tb_uf` (`sg_uf`, `nm_uf`) VALUES
('AC', 'Acre'),
('AL', 'Alagoas'),
('AM', 'Amazonas'),
('AP', 'Amapá'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MG', 'Minas Gerais'),
('MS', 'Mato Grosso do Sul'),
('MT', 'Mato Grosso'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('PR', 'Paraná'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('RS', 'Rio Grande do Sul'),
('SC', 'Santa Catarina'),
('SE', 'Sergipe'),
('SP', 'São Paulo'),
('TO', 'Tocantins');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD PRIMARY KEY (`cd_aluno`),
  ADD KEY `fk_aluno_turma` (`cd_turma`),
  ADD KEY `fk_aluno_instituicao` (`cd_instituicao`),
  ADD KEY `fk_aluno_responasvel` (`cd_responsavel`);

--
-- Índices para tabela `tb_bairro`
--
ALTER TABLE `tb_bairro`
  ADD PRIMARY KEY (`cd_bairro`),
  ADD KEY `fk_bairro_cidade` (`cd_cidade`);

--
-- Índices para tabela `tb_cadastro`
--
ALTER TABLE `tb_cadastro`
  ADD PRIMARY KEY (`cd_cadastro`);

--
-- Índices para tabela `tb_cardapio`
--
ALTER TABLE `tb_cardapio`
  ADD PRIMARY KEY (`id_cardapio`);

--
-- Índices para tabela `tb_cidade`
--
ALTER TABLE `tb_cidade`
  ADD PRIMARY KEY (`cd_cidade`),
  ADD KEY `fk_cidade_uf` (`sg_uf`);

--
-- Índices para tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  ADD PRIMARY KEY (`cd_contato`),
  ADD KEY `fk_contato_instituicao` (`cd_instituicao`),
  ADD KEY `fk_contato_responsavel` (`cd_responsavel`);

--
-- Índices para tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD PRIMARY KEY (`cd_endereco`),
  ADD KEY `fk_endereco_bairro` (`cd_bairro`);

--
-- Índices para tabela `tb_forma_pagamento`
--
ALTER TABLE `tb_forma_pagamento`
  ADD PRIMARY KEY (`cd_forma_pagamento`);

--
-- Índices para tabela `tb_instituicao`
--
ALTER TABLE `tb_instituicao`
  ADD PRIMARY KEY (`cd_instituicao`),
  ADD KEY `fk_instituicao_endereco` (`cd_endereco`),
  ADD KEY `fk_instituicao_cadastro` (`cd_cadastro`),
  ADD KEY `fk_instituicao_pagamento` (`cd_pagamento`);

--
-- Índices para tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`cd_login`),
  ADD KEY `fk_login_responsavel` (`cd_responsavel`);

--
-- Índices para tabela `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  ADD PRIMARY KEY (`cd_mensagem`),
  ADD KEY `fk_mensagem_instituicao` (`cd_instituicao`),
  ADD KEY `fk_mensagem_responsavel` (`cd_responsavel`),
  ADD KEY `fk_mensagem_profissional` (`cd_profissional`);

--
-- Índices para tabela `tb_pagamento`
--
ALTER TABLE `tb_pagamento`
  ADD PRIMARY KEY (`cd_pagamento`),
  ADD KEY `fk_forma_pagamento_pagamento` (`cd_forma_pagamento`),
  ADD KEY `fk_status_pagamento_pagamento` (`cd_status_pagamento`);

--
-- Índices para tabela `tb_profissional`
--
ALTER TABLE `tb_profissional`
  ADD PRIMARY KEY (`cd_profissional`),
  ADD KEY `fk_profissional_turma` (`cd_turma`),
  ADD KEY `fk_profissional_cadastro` (`cd_cadastro`),
  ADD KEY `fk_profissional_instituicao` (`cd_instituicao`);

--
-- Índices para tabela `tb_responsavel`
--
ALTER TABLE `tb_responsavel`
  ADD PRIMARY KEY (`cd_responsavel`),
  ADD KEY `fk_responsavel_endereco` (`cd_endereco`),
  ADD KEY `fk_responsavel_cadastro` (`cd_cadastro`);

--
-- Índices para tabela `tb_responsavel_aluno`
--
ALTER TABLE `tb_responsavel_aluno`
  ADD KEY `fk_responsavel_aluno_responsavel` (`cd_responsavel`),
  ADD KEY `fk_responsavel_aluno_aluno` (`cd_aluno`);

--
-- Índices para tabela `tb_status_pagamento`
--
ALTER TABLE `tb_status_pagamento`
  ADD PRIMARY KEY (`cd_status_pagamento`);

--
-- Índices para tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD PRIMARY KEY (`cd_turma`);

--
-- Índices para tabela `tb_uf`
--
ALTER TABLE `tb_uf`
  ADD PRIMARY KEY (`sg_uf`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  MODIFY `cd_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000054;

--
-- AUTO_INCREMENT de tabela `tb_bairro`
--
ALTER TABLE `tb_bairro`
  MODIFY `cd_bairro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de tabela `tb_cadastro`
--
ALTER TABLE `tb_cadastro`
  MODIFY `cd_cadastro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200068;

--
-- AUTO_INCREMENT de tabela `tb_cardapio`
--
ALTER TABLE `tb_cardapio`
  MODIFY `id_cardapio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_cidade`
--
ALTER TABLE `tb_cidade`
  MODIFY `cd_cidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10101011;

--
-- AUTO_INCREMENT de tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  MODIFY `cd_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11161;

--
-- AUTO_INCREMENT de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  MODIFY `cd_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000004;

--
-- AUTO_INCREMENT de tabela `tb_instituicao`
--
ALTER TABLE `tb_instituicao`
  MODIFY `cd_instituicao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90003;

--
-- AUTO_INCREMENT de tabela `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `cd_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200069;

--
-- AUTO_INCREMENT de tabela `tb_profissional`
--
ALTER TABLE `tb_profissional`
  MODIFY `cd_profissional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53016;

--
-- AUTO_INCREMENT de tabela `tb_responsavel`
--
ALTER TABLE `tb_responsavel`
  MODIFY `cd_responsavel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  MODIFY `cd_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD CONSTRAINT `fk_aluno_instituicao` FOREIGN KEY (`cd_instituicao`) REFERENCES `tb_instituicao` (`cd_instituicao`),
  ADD CONSTRAINT `fk_aluno_responasvel` FOREIGN KEY (`cd_responsavel`) REFERENCES `tb_responsavel` (`cd_responsavel`),
  ADD CONSTRAINT `fk_aluno_turma` FOREIGN KEY (`cd_turma`) REFERENCES `tb_turma` (`cd_turma`);

--
-- Limitadores para a tabela `tb_bairro`
--
ALTER TABLE `tb_bairro`
  ADD CONSTRAINT `fk_bairro_cidade` FOREIGN KEY (`cd_cidade`) REFERENCES `tb_cidade` (`cd_cidade`);

--
-- Limitadores para a tabela `tb_cidade`
--
ALTER TABLE `tb_cidade`
  ADD CONSTRAINT `fk_cidade_uf` FOREIGN KEY (`sg_uf`) REFERENCES `tb_uf` (`sg_uf`);

--
-- Limitadores para a tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  ADD CONSTRAINT `fk_contato_instituicao` FOREIGN KEY (`cd_instituicao`) REFERENCES `tb_instituicao` (`cd_instituicao`),
  ADD CONSTRAINT `fk_contato_responsavel` FOREIGN KEY (`cd_responsavel`) REFERENCES `tb_responsavel` (`cd_responsavel`);

--
-- Limitadores para a tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD CONSTRAINT `fk_endereco_bairro` FOREIGN KEY (`cd_bairro`) REFERENCES `tb_bairro` (`cd_bairro`);

--
-- Limitadores para a tabela `tb_instituicao`
--
ALTER TABLE `tb_instituicao`
  ADD CONSTRAINT `fk_instituicao_cadastro` FOREIGN KEY (`cd_cadastro`) REFERENCES `tb_cadastro` (`cd_cadastro`),
  ADD CONSTRAINT `fk_instituicao_endereco` FOREIGN KEY (`cd_endereco`) REFERENCES `tb_endereco` (`cd_endereco`),
  ADD CONSTRAINT `fk_instituicao_pagamento` FOREIGN KEY (`cd_pagamento`) REFERENCES `tb_pagamento` (`cd_pagamento`);

--
-- Limitadores para a tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `fk_login_responsavel` FOREIGN KEY (`cd_responsavel`) REFERENCES `tb_responsavel` (`cd_responsavel`);

--
-- Limitadores para a tabela `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  ADD CONSTRAINT `fk_mensagem_instituicao` FOREIGN KEY (`cd_instituicao`) REFERENCES `tb_instituicao` (`cd_instituicao`),
  ADD CONSTRAINT `fk_mensagem_profissional` FOREIGN KEY (`cd_profissional`) REFERENCES `tb_profissional` (`cd_profissional`),
  ADD CONSTRAINT `fk_mensagem_responsavel` FOREIGN KEY (`cd_responsavel`) REFERENCES `tb_responsavel` (`cd_responsavel`);

--
-- Limitadores para a tabela `tb_pagamento`
--
ALTER TABLE `tb_pagamento`
  ADD CONSTRAINT `fk_forma_pagamento_pagamento` FOREIGN KEY (`cd_forma_pagamento`) REFERENCES `tb_forma_pagamento` (`cd_forma_pagamento`),
  ADD CONSTRAINT `fk_status_pagamento_pagamento` FOREIGN KEY (`cd_status_pagamento`) REFERENCES `tb_status_pagamento` (`cd_status_pagamento`);

--
-- Limitadores para a tabela `tb_profissional`
--
ALTER TABLE `tb_profissional`
  ADD CONSTRAINT `fk_profissional_cadastro` FOREIGN KEY (`cd_cadastro`) REFERENCES `tb_cadastro` (`cd_cadastro`),
  ADD CONSTRAINT `fk_profissional_instituicao` FOREIGN KEY (`cd_instituicao`) REFERENCES `tb_instituicao` (`cd_instituicao`),
  ADD CONSTRAINT `fk_profissional_turma` FOREIGN KEY (`cd_turma`) REFERENCES `tb_turma` (`cd_turma`);

--
-- Limitadores para a tabela `tb_responsavel`
--
ALTER TABLE `tb_responsavel`
  ADD CONSTRAINT `fk_responsavel_cadastro` FOREIGN KEY (`cd_cadastro`) REFERENCES `tb_cadastro` (`cd_cadastro`),
  ADD CONSTRAINT `fk_responsavel_endereco` FOREIGN KEY (`cd_endereco`) REFERENCES `tb_endereco` (`cd_endereco`);

--
-- Limitadores para a tabela `tb_responsavel_aluno`
--
ALTER TABLE `tb_responsavel_aluno`
  ADD CONSTRAINT `fk_responsavel_aluno_aluno` FOREIGN KEY (`cd_aluno`) REFERENCES `tb_aluno` (`cd_aluno`),
  ADD CONSTRAINT `fk_responsavel_aluno_responsavel` FOREIGN KEY (`cd_responsavel`) REFERENCES `tb_responsavel` (`cd_responsavel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- 1. Listar todos os alunos e os nomes dos seus respectivos responsáveis.
-- Este é um JOIN simples entre tb_aluno e tb_responsavel.
SELECT
    a.nm_aluno,
    r.nm_responsavel
FROM
    tb_aluno AS a
JOIN
    tb_responsavel AS r ON a.cd_responsavel = r.cd_responsavel;

---

-- 2. Listar todos os alunos, o nome da sua turma e o nome da instituição.
-- Este é um JOIN múltiplo ligando aluno à sua turma e instituição.
SELECT
    a.nm_aluno,
    t.nm_turma,
    t.ds_periodo,
    i.nm_instituicao
FROM
    tb_aluno AS a
JOIN
    tb_turma AS t ON a.cd_turma = t.cd_turma
JOIN
    tb_instituicao AS i ON a.cd_instituicao = i.cd_instituicao;

---

-- 3. Listar os profissionais, sua função e a instituição onde trabalham.
-- Usa um LEFT JOIN para incluir profissionais que não estão
-- associados a uma turma específica (ex: diretores).
SELECT
    p.nm_profissional,
    p.nm_funcao,
    i.nm_instituicao,
    t.nm_turma AS turma_atribuida
FROM
    tb_profissional AS p
JOIN
    tb_instituicao AS i ON p.cd_instituicao = i.cd_instituicao
LEFT JOIN
    tb_turma AS t ON p.cd_turma = t.cd_turma;

---

-- 4. Listar o nome do responsável e seu endereço completo.
-- Este é um exemplo de JOINs encadeados (chain join) para buscar
-- informações de tabelas de endereço (responsavel -> endereco -> bairro -> cidade -> uf).
SELECT
    r.nm_responsavel,
    e.nm_endereco,
    e.cd_numcasa,
    e.cd_cep,
    b.nm_bairro,
    c.nm_cidade,
    u.sg_uf
FROM
    tb_responsavel AS r
JOIN
    tb_endereco AS e ON r.cd_endereco = e.cd_endereco
JOIN
    tb_bairro AS b ON e.cd_bairro = b.cd_bairro
JOIN
    tb_cidade AS c ON b.cd_cidade = c.cd_cidade
JOIN
    tb_uf AS u ON c.sg_uf = u.sg_uf;

---

-- 5. Listar os responsáveis, seus dados de login, e o status de seus pagamentos.
-- Este JOIN junta 4 tabelas para criar um relatório financeiro/administrativo.
SELECT
    r.nm_responsavel,
    l.nm_login,
    p.vl_fatura,
    p.dt_pagamento,
    s.nm_status_pagamento
FROM
    tb_responsavel AS r
JOIN
    tb_login AS l ON r.cd_responsavel = l.cd_responsavel
JOIN
    tb_pagamento AS p ON r.cd_responsavel = p.cd_responsavel
JOIN
    tb_status_pagamento AS s ON p.cd_status_pagamento = s.cd_status_pagamento;

---

-- 6. Listar alunos com problemas de saúde e a gravidade.
-- Este não é um JOIN, mas uma filtragem (WHERE) na própria tabela,
-- útil para encontrar dados específicos.
SELECT
    nm_aluno,
    nm_problema_saude,
    nm_grav_saude,
    ds_problema_saude
FROM
    tb_aluno
WHERE
    se_problema_saude IS NOT NULL; -- ou nm_problema_saude IS NOT NULL

---

-- 7. Listar relações da tabela de junção tb_responsavel_aluno.
-- Esta tabela existe para criar uma relação N:N (muitos-para-muitos),
-- embora a tb_aluno já tenha um FK para tb_responsavel (relação 1:N).
SELECT
    r.nm_responsavel,
    a.nm_aluno
FROM
    tb_responsavel_aluno AS ra
JOIN
    tb_responsavel AS r ON ra.cd_responsavel = r.cd_responsavel
JOIN
    tb_aluno AS a ON ra.cd_aluno = a.cd_aluno;
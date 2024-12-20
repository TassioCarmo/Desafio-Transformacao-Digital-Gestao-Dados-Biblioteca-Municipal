INSERT INTO Nacionalidade 
	(ID_Nacionalidade, Nacionalidade) 
VALUES 
	(1, 'Brasil'),
	(2, 'Estados Unidos Da América'),
	(3, 'África do Sul'),
	(4, 'Reino Unido'),
    (5, 'França');
    
INSERT INTO Autor 
	(ID_Autor, Nome_Autor, ID_Nacionalidade)
VALUES
	(1, 'Alberto Mussa', 1),
    (2, 'Aluísio de Azevedo', 1),
    (3, 'Ariano Suassuna', 1),
    (4, 'Autran Dourado', 1),
    (5, 'Bernardo Guimarães', 1),
    (6, 'Casimiro de Abreu', 1),
    (7, 'Carlos Heitor Cony', 1),
    (8, 'Clarice Lispector', 1),
    (9, 'Denis Mandarino', 1),
    (10, 'George Raymond Richard Martin', 2),
    (11, 'John Ronald Reuel Tolkien', 3),
    (12, 'Clive Staples Lewis', 4),
    (13, 'Edgar Allan Poe', 2),
    (14, 'Rick Riordan', 2),
    (15, 'Alexandre Dumas', 5);
    
    
INSERT INTO Endereco
	(ID_Endereco, Logradouro, Bairro, CEP, Cidade)
VALUES 
	(1, 'Avenida 23 de Maio 21', 'Jardim das Árvores', '05728-354', NULL),
    (2, 'Rua Martins Fontes 252', 'Parque Industrial', '02182-635', NULL),	
	(3, 'Avenida dos Bandeirantes 20', 'Residencial Dourados', '05728-355', NULL),	
	(4, 'Avenida Eng. Luis Carlos Berrini 12', 'Vila Água Bonita', '02182-636', NULL),	
	(5, 'Rua da Consolação 14', 'Vila Brasil', '05728-356', NULL),	
	(6, 'Rua Ipiranga 123', 'Vila Cristal', '02182-637', NULL),	
	(7, 'Avenida Brigadeiro Faria Lima 50', 'Vila das Árvores', '05728-357', NULL),	
	(8, 'Rua Funchal 1000', 'Vila das Nações', '02182-638', 'São Paulo'),
	(9, 'Avenida Ibirapuera 300', 'Vila do Lago', '05728-358', 'Campinas'),
	(10, 'Avenida Interlagos 247', 'Vila dos Estados', '02182-639', 'Barretos'),
	(11, 'Avenida José Carlos Pace 23', 'Vila dos Pássaros', '05728-359', 'Boituva'),
	(12, 'Avenida Pres. Juscelino Kubitschek 45', 'Vila Dourados', '02182-640', 'Marabá'),
	(13, 'Avenida Brigadeiro Luis Antonio 48', 'Água Aguinha', '05728-360', 'Ibiuna'),
	(14, 'Marginal Pinheiros 69', 'Água Bonita', '02182-641', 'São José'),
	(15, 'Avenida Nossa Sra. do Sabará 65', 'Conceição', '05728-361', 'São Paulo'),
	(16, 'Avenida Nove de Julho 72', 'Conjunto Metalúrgicos', '02182-642', NULL),	
	(17, 'Rua Olimpíadas 68', 'Continental', '05728-362', NULL),	
	(18, 'Avenida Rebouças 2581', 'Distrito Industrial Altino', '02182-643', NULL),
	(19, 'Avenida do Rio Bonito 2541', 'Distrito Industrial Anhanguera', '05728-363', NULL),	
	(20, 'Avenida Robert Kennedy 3965', 'Distrito Industrial Autonomistas', '02182-644', NULL),	
	(21, 'Avenida Jornalista Roberto Marinho 698', 'Distrito Industrial Centro', '05728-364', NULL),	
	(22, 'Avenida Santo Amaro 5879', 'Distrito Industrial Mazzei', '02182-645', NULL),	
	(23, 'Rua Maria Imaculada 6598', 'Distrito Industrial Remédios', '05728-365', NULL),	
	(24, 'Avenida Washington Luis 654747', 'Helena Maria', '02182-646', NULL),	
	(25, 'Avenida Alfredo Maia 584', 'IAPI', '05728-366', NULL),	
	(26, 'Avenida Alfredo Maluf 265', 'Jaguaribe', '02182-647', NULL),	
	(27, 'Avenida Alfredo Pujol 987', 'Jardim D´Abril', '05728-367', NULL),	
	(28, 'Avenida Amazonas 574', 'Jardim das Flores', '02182-648', NULL),	
	(29, 'Avenida Ampére 414', 'Jardim Elvira', '05728-368', NULL),	
	(30, 'Avenida Ana Camargo 174', 'Jardim Mutinga', '02182-649', NULL);
    

INSERT INTO Editora 
	(ID_Editora, Nome_Editora, ID_Endereco)
VALUES
	(1, 'Aleph', 8),
    (2, 'Moderna', 9),
    (3, 'Saraiva', 10),
    (4, 'Ática', 11),
    (5, 'Casa', 12),
    (6, 'Leya', 13),
    (7, 'Draco', 14),
    (8, 'Nova', 15);

INSERT INTO Genero
	(ID_Genero, Genero)
VALUES
	(1,	'Auto Ajuda'),
	(2,	'Estrangeiro'),
	(3,	'Ficção'),
	(4,	'Filosofia'),
	(5,	'Infanto Juvenil'),
	(6,	'Poema'),
	(7,	'Política'),
	(8,	'Religioso'),
	(9,	'Romance'),
	(10, 'Terror');


INSERT INTO Obra 
	(ID_Obra, ID_Editora, ID_Autor, ID_Genero, Titulo_Obra, Numero_Publicacao, Data_Publicacao, Valor_Unitario) 
VALUES
	(1, 1, 15, 1, 'O Conde de Monte Cristo', 12, '2005-10-05', 90.00),
	(2, 2, 12, 4, 'Tratado de Confissom', 5, '2010-12-31', 55.00),
	(3, 5, 10, 7, 'Triste Fim de Policarpo Quaresm', 3, '2001-05-03', 20.00),
	(4, 8, 14, 9, 'Tratado da Natureza Humana', 78, '2002-05-14', 64.32),
	(5, 7, 8, 8, 'Farsa de Inês Pereira', 2, '1986-04-25', 97.35),
	(6, 6, 15, 6, 'Filho Nativo', 45, '2004-06-12', 98.65),
	(7, 6, 10, 3, 'Jogo Dos Tronos', 6, '2001-08-26', 41.63),
	(8, 8, 13, 10, 'Diabo dos Números', 2, '1981-08-31', 65.48),
	(9, 6, 10, 2, 'Furia dos Reis', 1, '2008-08-06', 53.25),
	(10, 6, 1, 5, 'Filhos e Amantes', 98, '2005-09-01', 87.10),
	(11, 5, 3, 7, 'Finis Patriae', 46, '2013-03-04', 106.84),
	(12, 5, 3, 9, 'Finnegans Wake', 2, '2013-09-30', 115.85),
	(13, 1, 15, 9, 'Os Três Mosqueteiros', 2, '1953-03-06', 86.54),
	(14, 3, 6, 1, 'Falcão de Malta', 2, '2010-01-02', 97.21),
	(15, 2, 14, 4, 'Vidas Secas', 45, '2004-07-09', 37.15),
	(16, 4, 2, 7, 'Flores sem Fruto', 1, '2001-08-15', 21.45),
	(17, 7, 4, 7, 'Deixados para Trás', 8, '1931-09-12', 25.35),
	(18, 8, 12, 9, 'Deus das Moscas', 2, '2003-09-25', 85.37),
	(19, 4, 11, 3, 'Senhor dos Aneis', 4, '1989-02-28', 60.50),
	(20, 3, 7, 10, 'Fluviais', 8, '2011-03-18', 94.20),
	(21, 2, 2, 3, 'Folhas Caídas', 1, '2010-09-19', 55.00),
	(22, 6, 5, 10, 'Força das Coisas', 24, '1985-11-25', 85.00),
	(23, 5, 15, 7, 'Fortaleza de Sharpe', 81, '2001-01-01', 122.50),
	(24, 1, 9, 9, 'Frankenstein', 8, '2010-12-13', 105.00),
	(25, 7, 11, 8, 'Rei Arthur', 85, '1999-07-15', 80.00),
	(26, 6, 6, 6, 'Dom Casmurro', 2, '2011-08-15', 108.25),
	(27, 4, 8, 7, 'Dia dos Gafanhotos', 85, '2011-11-11', 57.85),
	(28, 8, 12, 9, 'Diabo dos Números', 2, '2013-05-06', 101.00),
	(29, 2, 3, 8, 'Discurso do Método', 8, '2012-08-06', 82.12),
	(30, 3, 10, 9, 'Arte Da Guerra', 8, '1913-05-01', 90.36);


INSERT INTO Estoque 
	(ID_Estoque, ID_Obra, Quantidade_Total, Quantidade_Disponivel) 
VALUES
	(1, 1, 5, 1),
	(2, 2, 12, 10),
	(3, 3, 4, 2),
	(4, 4, 4, 0),
	(5, 5, 23, 18),
	(6, 6, 13, 11),
	(7, 7, 33, 28),
	(8, 8, 6, 4),
	(9, 9, 15, 12),
	(10, 10, 4, 0),
	(11, 11, 15, 13),
	(12, 12, 6, 1),
	(13, 13, 19, 14),
	(14, 14, 7, 5),
	(15, 15, 26, 22),
	(16, 16, 16, 11),
	(17, 17, 25, 15),
	(18, 18, 9, 6),
	(19, 19, 15, 12),
	(20, 20, 9, 6),
	(21, 21, 10, 7),
	(22, 22, 15, 11),
	(23, 23, 17, 16),
	(24, 24, 64, 59),
	(25, 25, 17, 14),
	(26, 26, 25, 22),
	(27, 27, 2, 0),
	(28, 28, 7, 3),
	(29, 29, 3, 0),
	(30, 30, 16, 14);



INSERT INTO Usuario
	(ID_Usuario, Nome_Usuario, Telefone, CPF)
VALUES 
	(1, 'Antonio Marcos da Silva', '5844-2647', '193.107.214-21'),
	(2, 'Carlos Drummond de Andrade', '5846-6576', '122.147.655-47'),
	(3, 'Juliana Bento Souza', '5879-5469', '193.107.214-22'),
	(4, 'Arlene Batista', '1254-5647', '122.147.655-48'),
	(5, 'Bret Berlusconi', '5844-2648', '193.107.214-23'),
	(6, 'Cindy Crall', '5846-6577', '122.147.655-49'),
	(7, 'Donatelo Siqueira', '5879-5470', '193.107.214-24'),
	(8, 'Emily Mall', '1254-5648', '122.147.655-50'),
	(9, 'Franklin Pekens', '5844-2649', '193.107.214-25'),
	(10, 'Gert Hender', '5846-6578', '122.147.655-51'),
	(11, 'Harvey Jonks', '5879-5471', '193.107.214-26'),
	(12, 'Irene Silva', '1254-5649', '122.147.655-52'),
	(13, 'Jose Albino', '5844-2650', '193.107.214-27'),
	(14, 'Katia Suellen', '5846-6579', '122.147.655-53'),
	(15, 'Lee Shimizu', '5879-5472', '193.107.214-28'),
	(16, 'Maria Aparecida', '1254-5650', '122.147.655-54'),
	(17, 'Nate Rogan', '5844-2651', '193.107.214-29'),
	(18, 'Ophelia Maria', '5846-6580', '122.147.655-55'),
	(19, 'Philippe Coutinho', '5879-5473', '193.107.214-30'),
	(20, 'Rina Pontes', '1254-5651', '122.147.655-56'),
	(21, 'Sean Woods', '5844-2652', '193.107.214-31'),
	(22, 'Tammy Miranda', '5846-6581', '122.147.655-57'),
	(23, 'Vicente Del Bosque', '5879-5474', '193.107.214-32'),
	(24, 'Whitney Cinse', '1254-5652', '122.147.655-58'),
	(25, 'Alberto Roberto', '5844-2653', '193.107.214-33'),
	(26, 'Beryl Berey', '5846-6582', '122.147.655-59'),
	(27, 'Chris Nicolas', '5879-5475', '193.107.214-34'),
	(28, 'Debby Loyd', '1254-5653', '122.147.655-60'),
	(29, 'Ernesto Coimbra', '5844-2654', '193.107.214-35'),
	(30, 'Florence Seedorf', '5846-6583', '122.147.655-61');

INSERT INTO Endereco_Usuario
	(ID_Endereco, ID_Usuario)
VALUES 
    (1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 21),
	(22, 22),
	(23, 23),
	(24, 24),
	(25, 25),
	(26, 26),
	(27, 27),
	(28, 28),
	(29, 29),
	(30, 30);
    
INSERT INTO Departamento 
	(ID_Departamento, Nome_Departamento)
VALUES
	(1, 'Diretoria'),
	(2, 'Gerência'),
	(3, 'Financeiro'),
	(4, 'Contábil'),
	(5, 'TI'),
	(6, 'Recursos Humanos'),
	(7, 'Recepção');

INSERT INTO Cargo 
	(ID_Cargo,ID_Departamento, Nome_Cargo, Salario)
VALUES
	(1, 1, 'Diretor', 20000.00),
	(2, 2, 'Gerente', 8000.00),
	(3, 3, 'Coordenador de Finanças', 7000.00),
	(4, 4, 'Coordenador Contabil', 7000.00),
	(5, 6, 'Coordenador de RH', 6000.00),
	(6, 5, 'Coordenador de TI', 7000.00),
	(7, 5, 'Analista de Sistemas', 3000.00),
	(8, 5, 'Analista de Suporte', 2500.00),
	(9, 3, 'Auxiliar Financeiro', 1700.00),
	(10, 4, 'Auxiliar Contabil', 1700.00),
	(11, 6, 'Auxiliar de RH', 1300.00),
	(12, 7, 'Recepcionista', 1000.00);

    
INSERT INTO Funcionario 
	(ID_Funcionario, ID_Cargo, Nome_Funcionario, Data_Admissao, Data_Demissao, Data_Nascimento)
VALUES
	(1, 12, 'Fabriola Pereira', '2000-10-01', '2012-09-20', '1981-05-15'),
	(2, 2, 'Carlos Meireles', '1995-11-04', '9999-12-31', '1972-11-28'),
	(3, 1, 'Adalberto Cristovão', '1990-11-07', '9999-12-31', '1970-04-12'),
	(4, 1, 'Camilla Prado', '1985-10-10', '9999-12-31', '1962-05-01'),
	(5, 2, 'Marcio Tales de Souza', '1981-09-01', '9999-12-31', '1965-03-20'),
	(6, 6, 'Fernando da Silva', '1976-10-04', '9999-12-31', '1956-11-15'),
	(7, 3, 'Barbara Maria', '1971-11-07', '9999-12-31', '1955-07-08'),
	(8, 12, 'Alice Meire', '1966-10-10', '9999-12-31', '1946-02-12'),
	(9, 5, 'João Da Silva', '1962-09-01', '9999-12-31', '1945-09-25'),
	(10, 4, 'Marcos Prado', '1957-10-04', '9999-12-31', '1939-06-18'),
	(11, 12, 'Claudia Cristina', '2012-10-10', '9999-12-31', '1990-01-05');
    
    

INSERT INTO Reserva
	(ID_Reserva, ID_Funcionario, ID_Usuario, ID_Obra, Status_Livro, Data_Reserva, Hora_Reserva, Status_Reserva)
VALUES 
	(1, 1, 2, 14, 'Disponível', '2011-06-08', '08:40:00', 'Finalizada'),
	(2, 8, 13, 3, 'Reservado', '2011-07-11', '09:30:00', 'Ativa'),
	(3, 1, 1, 14, 'Reservado', '2011-08-14', '08:00:00', 'Ativa'),
	(4, 8, 29, 20, 'Reservado', '2011-08-18', '15:00:00', 'Ativa'),
	(5, 8, 30, 16, 'Reservado', '2011-08-19', '10:00:00', 'Ativa'),
	(6, 1, 3, 8, 'Reservado', '2011-08-18', '15:00:00', 'Ativa'),
	(7, 1, 8, 25, 'Disponível', '2011-08-19', '09:00:00', 'Finalizada'),
	(8, 8, 21, 24, 'Disponível', '2011-08-08', '08:15:00', 'Finalizada'),
	(9, 1, 22, 13, 'Disponível', '2011-08-18', '18:00:00', 'Finalizada'),
	(10, 1, 8, 22, 'Reservado', '2011-08-15', '14:00:00', 'Ativa');



INSERT INTO Emprestimo
    (ID_Emprestimo, ID_Funcionario, ID_Usuario, ID_Obra, Data_Emprestimo, Hora_Emprestimo, Data_Entrega)
VALUES
    (1, 1, 1, 10, '2011-08-15', '08:00:00', '2011-08-17'),
    (2, 8, 20, 14, '2011-09-26', '08:00:00', '2011-09-28'),
    (3, 8, 13, 18, '2011-07-11', '10:00:00', '2011-07-13'),
    (4, 8, 29, 17, '2011-08-18', '18:10:00', '2011-08-20'),
    (5, 1, 2, 23, '2011-06-09', '08:00:00', '2011-06-11'),
    (6, 8, 21, 24, '2011-08-20', '08:00:00', '2011-08-22'),
    (7, 1, 14, 21, '2012-03-25', '08:00:00', '2012-03-27'),
    (8, 8, 30, 6, '2011-08-19', '13:00:00', '2011-08-21'),
    (9, 8, 19, 30, '2012-03-27', '13:00:00', '2012-03-29'),
    (10, 1, 3, 9, '2011-08-19', '09:54:00', '2011-08-21'),
    (11, 8, 12, 11, '2012-03-29', '13:00:00', '2012-03-31'),
    (12, 1, 8, 25, '2011-08-19', '09:54:00', '2011-08-21'),
    (13, 1, 11, 16, '2012-03-31', '14:55:00', '2012-04-02'),
    (14, 1, 4, 1, '2012-04-01', '12:01:00', '2012-04-03'),
    (15, 8, 11, 26, '2013-06-25', '14:29:00', '2013-06-27'),
    (16, 1, 22, 13, '2011-08-20', '10:00:00', '2011-08-22'),
    (17, 1, 8, 19, '2011-08-20', '14:55:00', '2011-08-22'),
    (18, 11, 10, 4, '2013-07-07', '16:30:00', '2013-07-09'),
    (19, 8, 12, 27, '2013-07-07', '11:11:00', '2013-07-09'),
    (20, 11, 5, 2, '2013-06-25', '17:54:00', '2013-06-27'),
    (21, 8, 18, 20, '2012-12-28', '10:00:00', '2012-12-30'),
    (22, 8, 15, 22, '2013-06-25', '08:36:00', '2013-06-27'),
    (23, 8, 9, 7, '2012-12-28', '14:55:00', '2012-12-30'),
    (24, 11, 17, 12, '2012-12-28', '13:00:00', '2012-12-30'),
    (25, 8, 6, 5, '2013-07-07', '10:00:00', '2013-07-09'),
    (26, 8, 23, 8, '2013-07-07', '18:10:00', '2013-07-09'),
    (27, 11, 16, 27, '2013-01-31', '14:55:00', '2013-02-02'),
    (28, 11, 7, 29, '2013-01-31', '10:00:00', '2013-02-02'),
    (29, 11, 24, 3, '2013-01-31', '18:10:00', '2013-02-02');

INSERT INTO Devolucao
    (ID_Devolucao, ID_Funcionario, ID_Emprestimo, Data_Devolucao, Hora_Devolucao, Multa_Atraso)
VALUES
    (1, 1, 5, '2011-06-11', '18:00:00', 0),
    (2, 8, 3, '2011-07-13', '13:00:00', 0),
    (3, 1, 1, '2011-08-17', '14:55:00', 0),
    (4, 8, 4, '2011-08-20', '12:01:00', 0),
    (5, 8, 8, '2011-08-21', '10:00:00', 0),
    (6, 1, 10, '2011-08-21', '14:55:00', 0),
    (7, 1, 12, '2011-08-21', '13:00:00', 0),
    (8, 8, 6, '2011-08-22', '14:55:00', 0),
    (9, 1, 16, '2011-08-26', '10:00:00', 1),
    (10, 1, 17, '2011-08-22', '18:00:00', 0),
    (11, 8, 2, '2011-09-28', '14:29:00', 0),
    (12, 1, 7, '2012-03-30', '17:54:00', 1),
    (13, 8, 9, '2012-03-29', '08:36:00', 0),
    (14, 8, 11, '2012-03-31', '16:30:00', 0),
    (15, 1, 13, '2012-04-08', '11:11:00', 1),
    (16, 1, 14, '2012-04-03', '10:00:00', 0),
    (17, 8, 21, '2012-12-30', '18:00:00', 0),
    (18, 8, 23, '2013-01-12', '15:00:00', 1),
    (19, 11, 24, '2012-12-30', '16:00:00', 0),
    (20, 11, 27, '2013-02-02', '18:00:00', 0);
    



-- 1 - A Diretora Camilla Prado solicitou uma pesquisa que informe todas as obras cadastradas no acervo ordenadas por data de publicação.

SELECT 
	Titulo_Obra, 
    Data_Publicacao
FROM 
	Obra 
ORDER BY 
	Data_Publicacao; 


/* 2 - O Governador vai doar duzentos livros para a Biblioteca, mas só irá doar se a biblioteca tiver menos de 300 obras.
O Gerente Márcio Tales solicitou que fosse feita a contagem de quantas obras a Biblioteca possui atualmente.*/

SELECT 
	COUNT(ID_Obra) AS Quantidade_Obras 
FROM 
	Obra; 


/* 3 - A Gerência solicitou uma pesquisa para saber quais datas ocorreram empréstimos de livros e a quantidade emprestada. 
A consulta deverá retornar apenas um registro para cada data.*/

SELECT 
    Data_Emprestimo,  
    COUNT(ID_Emprestimo) AS Quantidade_Emprestada
FROM 
	Emprestimo
GROUP BY 
	Data_Emprestimo
ORDER BY 
	Data_Emprestimo;


/* 4 - O Funcionário João Paulo Assistente de RH solicitou uma pesquisa que informasse todos os empréstimos que 
a Recepcionista Alice Meire fez no horário das 8hs as 9hs.*/

SELECT 
	e.ID_Emprestimo,
    e.Data_Emprestimo,
    e.Hora_Emprestimo,
    f.Nome_Funcionario
FROM 
	Emprestimo e
LEFT JOIN 
	Funcionario f ON e.ID_Funcionario = f.ID_Funcionario
WHERE 
	f.Nome_Funcionario = 'Alice Meire' 
	AND e.Hora_Emprestimo BETWEEN '08:00:00' AND '09:00:00'
ORDER BY 
	e.Data_Emprestimo, e.Hora_Emprestimo;


-- 5 - A Diretoria solicitou uma pesquisa sobre devolução de livros entre as datas 29/03/2012 a 02/02/2013.

SELECT 
	* 
FROM 
	Devolucao
WHERE 
	Data_Devolucao BETWEEN '2012-03-29' AND '2013--02-02'; 


/* 6 - A Gerência solicitou uma pesquisa para saber quais reservas de livros que foram feitas com 
data maior ou igual a 18/08/2011 que ainda possuem o status de “reservado”.*/

SELECT 
	* 
FROM 
	Reserva 
WHERE 
	UPPER(Status_Livro) = 'RESERVADO' 
    AND Data_Reserva >= '2011-08-18';


-- 7 - A área de RH solicitou uma pesquisa para saber quais devoluções de livros foram feitas antes de 29/03/2012.

SELECT 
	*
FROM 
	Devolucao
WHERE 
	Data_Devolucao < '2012-03-29';


/* 8 - A Gerência solicitou uma pesquisa para saber quais obras existem no acervo que são diferentes dos 
títulos das obras ‘O Conde de Monte Cristo’ e ‘Filhos e Amantes’.*/

SELECT 
	ID_Obra,
    Titulo_Obra
FROM 
	Obra
WHERE 
	Titulo_Obra NOT IN ('O Conde de Monte Cristo', 'Filhos e Amantes')
ORDER BY 
	Titulo_Obra;


-- 9 - O Funcionário João Paulo solicitou uma pesquisa para saber quantas obras do gênero ‘Ficção’ existem no acervo.

-- Consulta usando INNER JOIN

SELECT 
	COUNT(*) AS Quantidade_Obras_Ficcao
FROM 
	Obra o
INNER JOIN 
	Genero g ON o.ID_Genero = g.ID_Genero
WHERE 
	g.Genero = 'Ficção';

-- Consulta usando uma subconsulta

SELECT 
	COUNT(*) AS Quantidade_Obras_Ficcao
FROM 
	Obra
WHERE 
	ID_Genero = (
		SELECT 
			ID_Genero 
		FROM 
			Genero 
		WHERE 
			Genero = 'Ficção');


/* 10 - A Diretoria solicitou uma pesquisa para identificar qual o livro possuiu a maior quantidade em estoque, 
incluir respectiva editora e o respectivo autor.*/

SELECT 
    o.Titulo_Obra,
    e.Nome_Editora,
    a.Nome_Autor,
    MAX(es.Quantidade_Disponivel) AS Maior_Quantidade_Disponivel_Em_Estoque
FROM 
	Estoque es
INNER JOIN 
	Obra o ON es.ID_Obra = o.ID_Obra
INNER JOIN 
	Editora e ON o.ID_Editora = e.ID_Editora
INNER JOIN 
	Autor a ON o.ID_Autor = a.ID_Autor
GROUP BY 
	o.Titulo_Obra, e.Nome_Editora, a.Nome_Autor
ORDER BY 
	Maior_Quantidade_Disponivel_Em_Estoque DESC
LIMIT 1;


/* 11 - O Financeiro precisa saber qual é o livro  que possui a menor quantidade em estoque e quantas vezes 
ele foi emprestado para que seja feita uma analise para compra de mais alguns exemplares.*/

-- Resposta 1, analisando a Quantidade Disponível no estoque

SELECT
    o.Titulo_Obra, 
	es.Quantidade_Disponivel,
    COUNT(e.ID_Emprestimo) AS Quantidade_Emprestimos
FROM 
	Obra o
INNER JOIN 
	Estoque es ON es.ID_Obra = o.ID_Obra
INNER JOIN 
	Emprestimo e ON e.ID_Obra = o.ID_Obra 
WHERE 
    es.Quantidade_Disponivel = (
        SELECT 
			MIN(es.Quantidade_Disponivel) 
        FROM 
			Estoque)
GROUP BY
    o.Titulo_Obra,
	es.Quantidade_Disponivel;

-- Resposta 2, analisando a Quantidade Total em estoque

SELECT
    o.Titulo_Obra, 
	es.Quantidade_Total,
    COUNT(e.ID_Emprestimo) AS Quantidade_Emprestimos
FROM 
	Obra o
INNER JOIN
    Estoque es ON es.ID_Obra = o.ID_Obra
INNER JOIN
    Emprestimo e ON e.ID_Obra = o.ID_Obra 
WHERE 
    es.Quantidade_Total = (
        SELECT 
			MIN(es.Quantidade_Total) 
        FROM 
			Estoque
    )
GROUP BY
    o.Titulo_Obra,
	es.Quantidade_Total;


-- 12 - A área de RH precisa identificar a quantidade total dos empréstimos feitos por cada funcionário ativos.

SELECT 
    f.ID_Funcionario,
    f.Nome_Funcionario,
    COUNT(e.ID_Emprestimo) AS Qtde_Emprestimos
FROM 
	Funcionario f
LEFT JOIN 
	Emprestimo e ON f.ID_Funcionario = e.ID_Funcionario
WHERE 
	f.Data_Demissao = '9999-12-31'
GROUP BY 
	f.ID_Funcionario, f.Nome_Funcionario
ORDER BY 
	Qtde_Emprestimos DESC;


-- 13 - A Diretoria quer identificar as obras com os maiores números de publicações agrupados por gênero.

SELECT 
    g.Genero,
    o.Titulo_Obra,
    o.Numero_Publicacao
FROM 
	Obra o
INNER JOIN 
	Genero g ON o.ID_Genero = g.ID_Genero
WHERE 
    o.Numero_Publicacao = (
        SELECT 
            MAX(sub_o.Numero_Publicacao)
        FROM 
			Obra sub_o
        WHERE 
			sub_o.ID_Genero = o.ID_Genero)
ORDER BY 
	g.Genero ASC, o.Numero_Publicacao DESC;

-- 14 - A Funcionária Alice Meire solicitou a alteração da obra ‘Discurso do Método’ para o gênero Político.


UPDATE 
	Obra
SET 
	ID_Genero = (
    SELECT 
		ID_Genero 
	FROM 
		Genero 
	WHERE 
		Genero = 'Política')
WHERE 
	Titulo_Obra = 'Discurso do Método';


-- Query para consultar a alteração do gênero

SELECT 
	o.Titulo_Obra,
    g.Genero
FROM 
	Obra o
INNER JOIN 
	Genero g ON g.ID_Genero = o.ID_Genero
WHERE 
	Titulo_Obra = 'Discurso do Método';


/* 15 - A Recepcionista Alice Meire solicitou a alteração do bairro do usuário ‘Alberto Roberto’ que morava no ‘IAPI’ 
e agora mora no bairro de ‘Perdizes’.*/

-- UPDATE que atualiza somente o bairro, mantendo o Logradouro e CEP anteriores

UPDATE 
	Endereco
SET 
	Bairro = 'Perdizes'
WHERE 
	ID_Endereco = (
		SELECT 
			eu.ID_Endereco
		FROM 
			Endereco_Usuario eu
		INNER JOIN 
			Usuario u ON eu.ID_Usuario = u.ID_Usuario
		WHERE 
			u.Nome_Usuario = 'Alberto Roberto')
	AND Bairro = 'IAPI';
    
    
-- UPDATE que atualiza o bairro e coloca '' (vazio) no Logradouro e no CEP, considerando que o bairro mudou 

UPDATE 
	Endereco
SET 
	Bairro = 'Perdizes', 
    Logradouro = '', 
    CEP = ''
WHERE 
	ID_Endereco = (
		SELECT 
			eu.ID_Endereco
		FROM 
			Endereco_Usuario eu
		INNER JOIN 
			Usuario u ON eu.ID_Usuario = u.ID_Usuario
		WHERE 
			u.Nome_Usuario = 'Alberto Roberto')
	AND Bairro = 'IAPI';    
    
-- Consulta para verificar a alteração no bairro.
    
SELECT
    u.Nome_Usuario,
    e.Logradouro,
    e.Bairro,
    e.CEP
FROM 
	Endereco_Usuario eu
INNER JOIN 
	Usuario u ON eu.ID_Usuario = u.ID_Usuario
INNER JOIN 
	Endereco e ON eu.ID_Endereco = e.ID_Endereco
WHERE 
	u.Nome_Usuario = 'Alberto Roberto';
        

/* 16 - A Biblioteca recebeu a visita de um grupo de alunos, mas após a visita foi verificado desaparecimento de três livros, 
as obras que sumiram do acervo foram ‘Filho Nativo’, ‘Vidas Secas’ e ‘Dom Casmurro’, com isto será necessária a alteração 
da quantidade de livros no estoque de cada obra.*/

UPDATE 
	Estoque 
SET 
	Quantidade_Disponivel = Quantidade_Disponivel - 1,
	Quantidade_Total = Quantidade_Total - 1
WHERE 
	ID_Obra IN  
		(SELECT 
			ID_Obra 
		FROM 
			Obra 
		WHERE 
			Titulo_Obra IN ('Filho Nativo', 'Vidas Secas', 'Dom Casmurro'));

-- Query para verificar alteração das quantidades

SELECT 
    o.Titulo_Obra, 
    e.Quantidade_Total,
    e.Quantidade_Disponivel
FROM 
	Estoque e
LEFT JOIN 
	Obra o ON e.ID_Obra = o.ID_Obra
WHERE 
	Titulo_Obra IN ('Filho Nativo', 'Vidas Secas', 'Dom Casmurro');


/*17 - A Recepcionista Claudia Cristina não conseguiu terminar o cadastro de cinco usuários que passaram pela Biblioteca, 
foi solicitado a inserção desses usuários. São eles: 
	- 31, Alfredo Tenttoni, Rua Amazonas 58, Pirai, 6549-5421, 02170-251, 294.264.875-32
	- 32, Cindy Crall, Rua Ipiranga 123, Vila Cristal, 5846-6577, 02182-637, 122.147.655-49
	- 33, Rubens Pardo, Avenida dos Monges 51, Campo Grande, 5184-8978, 52412-365, 654.586.472-98
	- 34, Carlos Pracidelli, Travessa dos Irmãos 48, Cotia, 8945-7986, 23124-005, 341.251.651-75
	- 35, Ernesto Coimbra, Avenida Ampére 414, Jardim Elvira, 5844-2654, 05728-368, 193.107.214-35  */

INSERT INTO 
	Usuario (ID_Usuario, Nome_Usuario, Telefone, CPF) 
VALUES
	(31, 'Alfredo Tenttoni', '6549-5421', '294.264.875-32'),
	(32, 'Cindy Crall', '5846-6577', '122.147.655-49'),
	(33, 'Rubens Pardo', '5184-8978', '654.586.472-98'),
	(34, 'Carlos Pracidelli', '8945-7986', '341.251.651-75'),
	(35, 'Ernesto Coimbra', '5844-2654', '193.107.214-35');

INSERT INTO 
	Endereco (ID_Endereco, Logradouro, Bairro, Cidade, CEP) 
VALUES
	(31, 'Rua Amazonas 58', 'Pirai', NULL, '02170-251'),
	(32, 'Rua Ipiranga 123', 'Vila Cristal', NULL, '02182-637'),
	(33, 'Avenida dos Monges 51', 'Campo Grande', NULL, '52412-365'),
	(34, 'Travessa dos Irmãos 48', 'Cotia', NULL, '23124-005'),
	(35, 'Avenida Ampére 414', 'Jardim Elvira', NULL, '05728-368');

INSERT INTO 
	Endereco_Usuario (ID_Usuario, ID_Endereco) 
VALUES
	(31, 31),
	(32, 32),
	(33, 33),
	(34, 34),
	(35, 35);


-- 18 -  Gerência solicitou uma consulta para verificar se existe duplicidade de usuários no Banco de Dados.

-- Consulta 1, que mostra a quantidade de registros duplicados por usuário

SELECT 
	Nome_Usuario, 
	CPF, 
    Telefone, 
    COUNT(Nome_Usuario) AS Quantidade_Registros_Iguais
FROM 
	Usuario 
GROUP BY 
	Nome_Usuario, CPF, Telefone
HAVING 
	COUNT(*) > 1;

-- Consulta 2, usando uma subconsulta que mostra quais registros são duplicatas

SELECT
    ID_Usuario AS ID_Duplicado_Usuario,
    Nome_Usuario,
    CPF,
    Telefone
FROM 
	Usuario u1
WHERE 
	EXISTS (
		SELECT 
			u2.ID_Usuario
		FROM 
			Usuario u2
		WHERE 
			u1.Nome_Usuario = u2.Nome_Usuario
			AND u1.CPF = u2.CPF
			AND u1.Telefone = u2.Telefone
			AND u1.ID_Usuario > u2.ID_Usuario
	);

-- Consulta 3, usando uma CTE (Common Table Expression) que mostra quais registros são duplicatas

WITH Duplicados AS (
	SELECT
		*,
		ROW_NUMBER() OVER (PARTITION BY Nome_Usuario, CPF, Telefone ORDER BY ID_Usuario) AS RowNum
	FROM 
		Usuario
)
SELECT
    ID_Usuario AS ID_Duplicado_Usuario,
    Nome_Usuario,
    CPF,
    Telefone
FROM 
	Duplicados
WHERE 
	RowNum > 1
ORDER BY 
	ID_Duplicado_Usuario;


-- 19 - A Recepção recebeu a informação que existem dois usuários duplicados na base, será necessária a exclusão de um desses registros.

DELETE FROM 
	Endereco_Usuario
WHERE 
	ID_Usuario IN (
		SELECT 
			usuario1.ID_Usuario
		FROM 
			Usuario usuario1
		INNER JOIN 
			Usuario usuario2 ON usuario1.Nome_Usuario = usuario2.Nome_Usuario 
			AND usuario1.Telefone = usuario2.Telefone
			AND usuario1.CPF = usuario2.CPF
		WHERE 
			usuario1.ID_Usuario > usuario2.ID_Usuario
);

DELETE FROM 
	Usuario
WHERE 
	ID_Usuario NOT IN (
		SELECT 
			ID_Usuario 
		FROM 
			Endereco_Usuario);

DELETE FROM 
	Endereco
WHERE 
	ID_Endereco NOT IN (
		SELECT 
			ID_Endereco 
		FROM 
			Endereco_Usuario); 


/* 20 - O Financeiro solicitou a inserção do valor individual de cada obra. Crie um campo com o nome Valor_Livro na tabela Obra. 
Defina o tipo de dados que poderá ser aceito e o valor de cada título.*/

-- Criando coluna solicitada Valor_Livro do tipo DECIMAL

ALTER TABLE 
	Obra
ADD 
	Valor_Livro DECIMAL(10,2);

-- Alterando valores da coluna para possuirem o mesmo valor da coluna Valor_Unitario

UPDATE 
	Obra
SET 
	Valor_Livro = Valor_Unitario
WHERE 
	ID_Obra IN (
		SELECT 
			ID_Usuario
		FROM
			Usuario);

-- Query para verificar se alterações foram executadas corretamente

SELECT 
	ID_Obra,
    Titulo_Obra,
    Valor_Unitario,
    Valor_Livro
FROM 
	Obra;


/* 21 - A Consultoria verificou que o campo Multa_Atraso está com o tamanho Varchar(2), 
foi solicitada a alteração do campo para  Varchar(3).*/

ALTER TABLE 
	Devolucao 
MODIFY COLUMN 
	Multa_Atraso VARCHAR(3);


/* 22 - Foi verificado que o campo Multa_Atraso está com os registros preenchidos de forma errada, 
foi solicitada a alteração dos registros que forem 0 para Não e 1 para SIM.*/

UPDATE 
	Devolucao
SET Multa_Atraso = 
	CASE 
		WHEN Multa_Atraso = 0 THEN 'Não'
		WHEN Multa_Atraso = 1 THEN 'Sim'
		ELSE Multa_Atraso
	END;

-- Consulta para verificar o resultado da alteração no campo Multa_Atraso

SELECT 
	ID_Devolucao,
    Multa_Atraso
FROM 
	Devolucao;


-- 23 - A Diretoria solicitou a exclusão do campo Valor_Livro da tabela Obra pois, o pedido feito pelo Financeiro estava errado.

ALTER TABLE 
	Obra
DROP COLUMN 
	Valor_Livro;


/* 24 - A Diretoria solicitou a lista de todos os livros que já foram emprestados mas foram entregues 
com atraso e os respectivos nomes dos funcionários que fizeram os empréstimos.*/

SELECT 
    e.ID_Obra, 
    o.Titulo_Obra, 
    f.Nome_Funcionario, 
    e.Data_Entrega,
    d.Data_Devolucao, 
    d.Multa_Atraso
FROM 
	Emprestimo e
LEFT JOIN 
	Obra o ON e.ID_Obra = o.ID_Obra
LEFT JOIN 
	Funcionario f ON e.ID_Funcionario = f.ID_Funcionario
LEFT JOIN 
	Devolucao d ON e.ID_Emprestimo = d.ID_Emprestimo
WHERE 
	d.Data_Devolucao > e.Data_Entrega;


/* 25 - A Gerência solicitou a lista de todos os livros, cujos autores não são brasileiros, 
que já foram devolvidos e o valor total de cada livro.*/

SELECT 
	o.ID_Obra, 
    o.Titulo_Obra, 
    a.Nome_Autor, 
    n.Nacionalidade, 
    em.ID_Emprestimo, 
    d.ID_Devolucao, 
    e.Quantidade_Total, 
    o.Valor_Unitario, 
    (e.Quantidade_Total * o.Valor_Unitario) AS Valor_Total_Livros 
FROM 
	Obra o
INNER JOIN 
	Autor a ON o.ID_Autor = a.ID_Autor
INNER JOIN 
	Nacionalidade n ON a.ID_Nacionalidade = n.ID_Nacionalidade
INNER JOIN 
	Estoque e ON o.ID_Obra = e.ID_Obra
INNER JOIN 
	Emprestimo em ON o.ID_Obra = em.ID_Obra
INNER JOIN 
	Devolucao d ON em.ID_Emprestimo = d.ID_Emprestimo
WHERE 
	n.ID_Nacionalidade IN (
		SELECT 
			n.ID_Nacionalidade 
		FROM 
			Nacionalidade 
        WHERE 
			n.Nacionalidade != 'Brasil')
ORDER BY 
	em.ID_Obra;


-- 26 - A área de RH solicitou a lista de todos usuários que fizeram empréstimo com o dia de entrega igual 21/08/2011.

SELECT 
	u.Nome_Usuario, 
	u.Telefone, 
    u.CPF, 
    e.Data_Entrega 
FROM 
	Emprestimo e 
INNER JOIN 
	Usuario u ON (e.ID_Usuario = u.ID_Usuario)
WHERE 
	Data_Entrega = '2011-08-21';


/* 27 - O Financeiro solicitou a lista de todas as obras que tiveram data de publicação menor que 04/03/2013, 
sua respectiva  quantidade e o seu valor unitário.*/

SELECT
    o.ID_Obra,
    o.Titulo_Obra,
    o.Valor_Unitario,
    e.Quantidade_Total,
	o.Data_Publicacao
FROM
    Obra o
INNER JOIN
    Estoque e ON e.ID_Obra = o.ID_Obra
WHERE
    o.Data_Publicacao < '2013-03-04'
ORDER BY
	o.Data_Publicacao;


-- 28 - A área de RH solicitou a lista de todos os funcionários separados por ativos ou não, seus respectivos cargos e salários.

SELECT 
	IF(f.Data_Demissao = '9999-12-31', 'Ativo', 'Inativo') AS Status_Funcionario,
    f.ID_Funcionario,
    f.Nome_Funcionario,
    c.Nome_Cargo,
    c.Salario    
FROM 
	Funcionario f
LEFT JOIN 
	Cargo c ON f.ID_Cargo = c.ID_Cargo
GROUP BY 
	ID_Funcionario, Status_Funcionario
ORDER BY 
	Status_Funcionario;


/* 29 - A Gerência solicitou uma lista de todos os livros com os nomes dos autores, 
nomes das editoras e a quantidade de livros em estoque.*/

SELECT 
	o.Titulo_Obra, a.Nome_Autor, ed.Nome_Editora, es.Quantidade_Disponivel
FROM 
	Obra o
LEFT JOIN 
	Autor a	ON a.ID_Autor = o.ID_Autor
LEFT JOIN 
	Editora ed ON o.ID_Editora = ed.ID_Editora
LEFT JOIN 
	Estoque es ON es.ID_Obra = o.ID_Obra;


/* 30 - A Diretoria solicitou a lista de todos os funcionários da Biblioteca com seus respectivos 
departamentos que tem idade entre 30 e 40 anos.*/

SELECT
	f.Nome_Funcionario,
    f.Data_Admissao,
    f.Data_Demissao,
    f.Data_Nascimento,
    TIMESTAMPDIFF(YEAR, f.Data_Nascimento, CURDATE()) AS Idade_Funcionario,
    d.Nome_Departamento
FROM 
	Funcionario f 
INNER JOIN 
	Cargo c ON (f.ID_Cargo = c.ID_Cargo)
INNER JOIN 
	Departamento d ON (c.ID_Departamento = d.ID_Departamento)
WHERE 
	TIMESTAMPDIFF(YEAR, f.Data_Nascimento, CURDATE()) BETWEEN 30 AND 40;


-- 31 - O Financeiro solicitou a criação de uma visão que retorne o nome do livro, seu autor e o valor.

CREATE VIEW Livro_View AS
SELECT
    o.Titulo_Obra,
	a.Nome_Autor,
    o.Valor_Unitario
FROM
    Obra o
INNER JOIN
    Autor a ON o.ID_Autor = a.ID_Autor;


-- 32 - A Recepção solicitou uma lista com o código do livro, nome do livro cujo valor do livro seja maior que  R$ 90,00.

SELECT
	ID_Obra,
    Titulo_Obra,
    Valor_Unitario
FROM 
	Obra
WHERE
	Valor_Unitario > 90.00
ORDER BY 
	Valor_Unitario;


-- 33 - A área de RH solicitou a atualização do salário do Auxiliar Financeiro de 12% sobre o seu salário atual.

UPDATE 
	Cargo 
SET 
	Salario = 1.12 * Salario
WHERE 
	Nome_Cargo = 'Auxiliar Financeiro';
 
 
-- Query para verificar alteração das quantidades

 SELECT 
	Nome_Cargo,
    Salario
FROM 
	Cargo 
WHERE 
	Nome_Cargo = 'Auxiliar Financeiro';


/* 34 - O Financeiro solicitou uma atualização da data de demissão da funcionária Alice Meire para 
o último dia do Mês que você se encontra atualmente.*/

CREATE TEMPORARY TABLE 
	funcionarios_a_atualizar (
		ID_Funcionario INT);

INSERT INTO 
	funcionarios_a_atualizar
		SELECT 
			ID_Funcionario
		FROM 
			Funcionario
		WHERE 
			Nome_Funcionario = 'Alice Meire'
			AND Data_Demissao = '9999-12-31';

UPDATE 
	Funcionario
SET 
	Data_Demissao = LAST_DAY(CURDATE())
WHERE 
	ID_Funcionario IN (
		SELECT 
			ID_Funcionario 
		FROM 
			funcionarios_a_atualizar);

DROP TEMPORARY TABLE funcionarios_a_atualizar;

-- Query para consultar a alteração da Data de Demissão

SELECT 
	Nome_Funcionario,
    Data_Demissao
FROM 
	Funcionario
WHERE 
	Nome_Funcionario = 'Alice Meire';


-- 35 - A Gerência solicitou uma lista de todas as Obras, que contenham a letra “C ordenadas por gênero data de publicação entre 2011 e 2013.

SELECT 
	o.Titulo_Obra,
    g.Genero,
    o.Data_Publicacao
FROM
    Obra o
INNER JOIN
    Genero g ON o.ID_Genero = g.ID_Genero
WHERE
    LOWER(o.Titulo_Obra) LIKE '%c%' 
    AND o.Data_Publicacao BETWEEN '2011-01-01' AND '2013-12-31'
ORDER BY
    g.Genero, o.Data_Publicacao;


/* 36 - A Recepção solicitou uma lista  como todos os funcionários da Biblioteca com código, nome, e departamento, 
classificado pelo nome do funcionário que não emprestaram nenhum livro.*/

SELECT 
    f.ID_Funcionario,
    f.Nome_Funcionario,
    d.Nome_Departamento
FROM 
	Funcionario f
LEFT JOIN 
	Cargo c ON f.ID_Cargo = c.ID_Cargo
LEFT JOIN 
	Departamento d ON c.ID_Departamento = d.ID_Departamento
LEFT JOIN 
	Emprestimo e ON f.ID_Funcionario = e.ID_Funcionario
WHERE 
	e.ID_Emprestimo IS NULL
ORDER BY 
	f.Nome_Funcionario;


-- 37 - A Biblioteca solicitou uma lista que exiba a quantidade de logradouros de usuários agrupados por número do CEP.

SELECT 
	e.CEP, COUNT(*) 
FROM 
	Endereco e
LEFT JOIN
	Endereco_Usuario eu ON e.ID_Endereco = eu.ID_Endereco
GROUP BY 
	CEP;

-- Query para validar o resultado acima

SELECT 
	COUNT(CEP), 
	COUNT(DISTINCT CEP) 
FROM Endereco; 


-- 38 - A Diretoria  solicitou uma lista que exiba a quantidade de endereços agrupados por usuário.


SELECT 
	u.ID_Usuario,
	u.Nome_Usuario, 
	count(eu.ID_Endereco) AS Quantidade_Endereco
FROM 
	Endereco_Usuario eu 
INNER JOIN 
	Usuario u ON (eu.ID_Usuario = u.ID_Usuario) 
GROUP BY eu.ID_Usuario;


/* 39 - Foi solicitado a busca de informações de todas as obras que foram reservadas no dia 18/08/11 as 15:00 
e o nome do responsável pela reserva.*/

SELECT 
	o.ID_Obra,
	o.Titulo_Obra,
	f.Nome_Funcionario,
	r.Data_Reserva,
	r.Hora_Reserva
FROM
    Obra o
INNER JOIN
    Reserva r ON r.ID_Obra = o.ID_Obra
INNER JOIN
    Funcionario f ON r.ID_Funcionario = f.ID_Funcionario
WHERE
    r.Data_Reserva = '2011-08-18' 
    AND r.Hora_Reserva = '15:00:00';


/* 40 - O financeiro solicitou o levantamento da informação de quando as usuárias Emily Mall e Whitney Cinse pegaram livros emprestados 
quais foram os  livros e seus respectivos valores unitários.*/

SELECT 
    u.Nome_Usuario,
    e.Data_Emprestimo,
    e.Hora_Emprestimo,
    o.Titulo_Obra,
    o.Valor_Unitario
FROM 
	Usuario u
LEFT JOIN 
	Emprestimo e ON u.ID_Usuario = e.ID_Usuario
LEFT JOIN 
	Obra o ON e.ID_Obra = o.ID_Obra
WHERE 
	u.Nome_Usuario IN ('Emily Mall', 'Whitney Cinse');


/* 41 - Hoje é aniversario da biblioteca e para comemorar foram comprados presentes a todos os usuários 
que foram os primeiros a utilizar a biblioteca, o gerente Carlos mendes pediu a relação da primeira pessoa  a reservar,  
pegar emprestado e devolver um livro e suas respectivas informações para que possa ser entrado em contato com ele. */


(SELECT 
    'Reserva' AS Tipo, -- Primeira reserva
    u.Nome_Usuario,
    u.Telefone,
    u.CPF,
    r.Data_Reserva,
    r.Hora_Reserva
FROM 
	Reserva r
INNER JOIN 
	Usuario u ON r.ID_Usuario = u.ID_Usuario
WHERE 
	r.Data_Reserva = (
		SELECT 
			MIN(Data_Reserva) 
		FROM 
			Reserva)
ORDER BY 
	r.Hora_Reserva ASC
LIMIT 1)
UNION
(SELECT 
    'Empréstimo' AS Tipo, -- Primeiro empréstimo
    u.Nome_Usuario,
    u.Telefone,
    u.CPF,
    e.Data_Emprestimo,
    e.Hora_Emprestimo
FROM 
	Emprestimo e
INNER JOIN 
	Usuario u ON e.ID_Usuario = u.ID_Usuario
WHERE 
	e.Data_Emprestimo = (
		SELECT 
			MIN(Data_Emprestimo) 
		FROM 
			Emprestimo)
ORDER BY 
	e.Hora_Emprestimo ASC
LIMIT 1)
UNION
(SELECT 
    'Devolução' AS Tipo, -- Primeira devolução
    u.Nome_Usuario,
    u.Telefone,
    u.CPF,
    d.Data_Devolucao,
    d.Hora_Devolucao
FROM 
	Devolucao d
INNER JOIN 
	Usuario u ON d.ID_Funcionario = u.ID_Usuario
WHERE 
	d.Data_Devolucao = (	
		SELECT 
			MIN(Data_Devolucao) 
		FROM 
			Devolucao)
ORDER BY 
	d.Hora_Devolucao ASC
LIMIT 1);

-- 42 - Foi solicitado pela diretoria saber quantas obras cada editora tem na biblioteca.

SELECT 
	e.Nome_Editora,
    COUNT(o.ID_Obra) AS Quantidade_Obra 
FROM 
	Obra o
INNER JOIN 
	Editora e ON e.ID_Editora = o.ID_Editora
GROUP BY 
	e.Nome_Editora;


/* 43 - É fechamento referente ao mês de janeiro (hoje dia 03/02/2013) e a biblioteca está no vermelho, 
foi solicitado pelo financeiro que fosse feito um levantamento de todos os livros que não foram devolvidos, 
mostrando quantos dias de atraso e para cada dia foi dado uma multa de 5 reais, e mostrar o nome do usuário , 
livro emprestado e o total a receber pela biblioteca. */

-- Emprestimos de obras que não tiveram devolucao (ID_Devolucao = NULL)
-- Emprestimos somente de datas antes de 03/02/2013 => '2013-02-03' 3 de fevereiro de 2013

SELECT 
    u.ID_Usuario,
    u.Nome_Usuario,
    e.ID_Emprestimo,
    o.Titulo_Obra,
    e.Data_Entrega,
    DATEDIFF('2013-02-03', e.Data_Entrega) AS Dias_Atraso,
    DATEDIFF('2013-02-03', e.Data_Entrega) * 5 AS Multa_Total
FROM 
	Emprestimo e
LEFT JOIN 
	Usuario u ON e.ID_Usuario = u.ID_Usuario
LEFT JOIN 
	Obra o ON e.ID_Obra = o.ID_Obra
LEFT JOIN 
	Devolucao d ON e.ID_Emprestimo = d.ID_Emprestimo
WHERE 
	d.ID_Devolucao IS NULL 
    AND e.Data_Entrega < '2013-02-03';


/* 44 - Foi solicitado a informação de todos os usuários que morem em uma avenida, e ainda, que seja mostrado o nome do usuário, 
CPF e logradouro em ordem de CPF do maior para o menor.*/

SELECT 
    u.Nome_Usuario,
    u.CPF,
    e.Logradouro
FROM 
	Usuario u
LEFT JOIN 
	Endereco_Usuario eu ON u.ID_Usuario = eu.ID_Usuario
LEFT JOIN 
	Endereco e ON eu.ID_Endereco = e.ID_Endereco
WHERE 
	e.Logradouro LIKE 'Avenida%'
ORDER BY 
	u.CPF DESC;


/* 45 - Chegou na biblioteca uma mensagem urgente da Camila pedindo um relatório contendo a informação de todos os livros que foram 
emprestados mais de uma vez nos anos de 2011 a 2013 agrupados pelo nome do livro.*/

SELECT 
	o.Titulo_Obra, 
	COUNT(e.ID_Obra) AS Qtd_Emprestimos
FROM 
	Emprestimo e
LEFT JOIN
	Obra o ON o.ID_Obra = e.ID_Obra
WHERE 
	YEAR(e.Data_Emprestimo) BETWEEN 2011 AND 2013
GROUP BY 
	o.Titulo_Obra
HAVING 
	Qtd_Emprestimos > 1;


/* 46 - O Financeiro pediu para apresentar o valor médio dos livros e informar quais são os que estão abaixo dessa media, 
referente a devolução e empréstimo.*/

-- Entendendo que ele quer saber a média de Valor_Unitario, então ordenar por Emprestimo e ID_Devolucao

SELECT 
    o.Titulo_Obra,
    o.Valor_Unitario,
    ROUND((SELECT AVG(Valor_Unitario) FROM Obra), 2) AS Valor_Medio_Obra,
    e.ID_Emprestimo,
    d.ID_Devolucao
FROM 
	Obra o
LEFT JOIN 
	Emprestimo e ON o.ID_Obra = e.ID_Obra
LEFT JOIN 
	Devolucao d ON e.ID_Emprestimo = d.ID_Emprestimo
WHERE 
	o.Valor_Unitario < (
		SELECT 
			AVG(Valor_Unitario) 
		FROM 
			Obra)
ORDER BY 
	o.Valor_Unitario, e.ID_Emprestimo, d.ID_Devolucao;


/* 47 - Barbara do financeiro pediu para verificar qual a media do salario dos funcionários e quem 
são os que ganham mais do que a media em cada departamento. */

-- Consulta 1, que compara com a média salarial de cada departamento pelo salário dos funcionários

WITH Salario_Medio_Dep AS 
	(SELECT 
		AVG(Salario) AS Media_Salario, 
        ID_Departamento 
	FROM 
		Cargo 
	GROUP BY 
		ID_Departamento)
SELECT 
    f.Nome_Funcionario,
    c.Nome_Cargo,
    d.Nome_Departamento,
    c.Salario,
    smd.Media_Salario
FROM 
	Funcionario f
LEFT JOIN 
	Cargo c ON f.ID_Cargo = c.ID_Cargo
LEFT JOIN 
	Departamento d ON c.ID_Departamento = d.ID_Departamento
LEFT JOIN 
	Salario_Medio_Dep as smd ON d.ID_Departamento = smd.ID_Departamento
WHERE 
	c.Salario > smd.Media_Salario 
ORDER BY 
	c.Salario DESC;


-- Consulta 2, que compara com a média salarial de todos os funcionários sem separar por departamento

WITH Media_Salarios AS (
    SELECT 
        ROUND(AVG(c.Salario), 2) AS Media_Salarial
    FROM 
        Cargo c
    INNER JOIN 
        Funcionario f ON f.ID_Cargo = c.ID_Cargo
)
SELECT
    f.ID_Funcionario,
    f.Nome_Funcionario,
    c.Salario,
    d.Nome_Departamento,
	Media_Salarios.Media_Salarial
FROM
    Funcionario f
INNER JOIN
    Cargo c ON f.ID_Cargo = c.ID_Cargo
INNER JOIN
    Departamento d ON c.ID_Departamento = d.ID_Departamento,
    Media_Salarios
WHERE
    c.Salario > Media_Salarios.Media_Salarial
ORDER BY
	c.Salario DESC;


/* 48 - Carlos pediu que seja feita uma pesquisa informando  de todos os usuários que tem cadastro na biblioteca 
e que nunca levaram livros mostrar o nome de todos em Maiúsculas.*/

SELECT 
    UPPER(u.Nome_Usuario) AS Nome_Usuario,
    e.ID_Emprestimo
FROM 
	Usuario u
LEFT JOIN 
	Emprestimo e ON u.ID_Usuario = e.ID_Usuario
WHERE 
	e.ID_Emprestimo IS NULL;


/* 49 - A recepção pediu para verificar quais os usuários que já pegaram mais de 3 livros, e em caso positivo, 
mostrar nomes e quais livros, ordenando pelo CEP (crescente). */

SELECT 
    u.Nome_Usuario AS Nome_Usuario,
    o.Titulo_Obra AS Nome_Livro,
    e.CEP AS CEP_Usuario
FROM 
    Emprestimo emp
INNER JOIN 
    Usuario u ON emp.ID_Usuario = u.ID_Usuario
INNER JOIN 
    Obra o ON emp.ID_Obra = o.ID_Obra
INNER JOIN 
    Endereco_Usuario eu ON u.ID_Usuario = eu.ID_Usuario
INNER JOIN 
    Endereco e ON eu.ID_Endereco = e.ID_Endereco
WHERE 
    (SELECT 
		COUNT(*) 
     FROM 
		Emprestimo e_sub 
     WHERE 
		e_sub.ID_Usuario = u.ID_Usuario) > 3
ORDER BY 
    e.CEP ASC;


/* 50 - A diretoria pediu que fosse feito uma analise do estoque, apresentando uma lista com todos os livros que já foram reservados 
e emprestados e mostrar quantos estão disponíveis classificados por Gênero.*/

SELECT DISTINCT
    o.Titulo_Obra,
    g.Genero,
    es.Quantidade_Disponivel
FROM 
	Obra o
INNER JOIN 
	Emprestimo e ON o.ID_Obra = e.ID_Obra
INNER JOIN 
	Reserva r ON o.ID_Obra = r.ID_Obra
INNER JOIN 
	Genero g ON o.ID_Genero = g.ID_Genero
INNER JOIN 
	Estoque es ON o.ID_Obra = es.ID_Obra
WHERE 
	es.Quantidade_Disponivel > 0
ORDER BY 
	g.Genero;


/* 51 - Foi solicitada a pesquisa de qual a hora que a biblioteca tem mais movimento e, também, qual o horário de menor movimentação, 
faça a avaliação de todas as horas de devolução, empréstimo e reserva.*/

-- Consulta 1, Selecionando apenas 1 registro de maior e menor movimentação para empréstimo, devolução e reserva

(SELECT 
	'Maior Hora Empréstimo' AS Tipo,
	Hora_Emprestimo AS Hora,
    COUNT(*) AS Quantidade
FROM 
	Emprestimo
GROUP BY 
	Hora
ORDER BY 
	Quantidade DESC
LIMIT 1)
UNION
(SELECT 
	'Menor Hora Empréstimo' AS Tipo,
	Hora_Emprestimo AS Hora,
    COUNT(*) AS Quantidade
FROM 
	Emprestimo
GROUP BY 
	Hora
ORDER BY 
	Quantidade ASC
LIMIT 1)
UNION
(SELECT 
	'Maior Hora Reserva' AS Tipo,
	Hora_Reserva AS Hora,
    COUNT(*) AS Quantidade
FROM 
	Reserva
GROUP BY 
	Hora
ORDER BY 
	Quantidade DESC
LIMIT 1)
UNION
(SELECT 
	'Menor Hora Reserva' AS Tipo,
	Hora_Reserva AS Hora,
    COUNT(*) AS Quantidade
FROM 
	Reserva
GROUP BY 
	Hora
ORDER BY 
	Quantidade ASC
LIMIT 1)
UNION 
(SELECT 
	'Maior Hora Devolucao' AS Tipo,
	Hora_Devolucao AS Hora,
    COUNT(*) AS Quantidade
FROM 
	Devolucao
GROUP BY 
	Hora
ORDER BY 
	Quantidade DESC
LIMIT 1)
UNION 
(SELECT 
	'Menor Hora Devolucao' AS Tipo,
	Hora_Devolucao AS Hora,
    COUNT(*) AS Quantidade
FROM 
	Devolucao
GROUP BY 
	Hora
ORDER BY 
	Quantidade ASC
LIMIT 1);

-- Consulta 2, descriminando todos os horários e verificando juntamente a quantidade de empréstimo, devolução e reserva para cada horario

WITH Combina_Horas AS (
SELECT 
	Hora_Emprestimo AS Hora, 
	COUNT(Hora_Emprestimo) AS Quantidade,
	'Quantidade Emprestimo' AS Quantidade_String
FROM 
	Emprestimo
GROUP BY 
	Hora_Emprestimo
UNION
SELECT 
	Hora_Reserva AS Hora,
	COUNT(Hora_Reserva) AS Quantidade,
	'Quantidade Reserva' AS Quantidade_String
FROM 
	Reserva
GROUP BY 
	Hora_Reserva
UNION
SELECT 
	Hora_Devolucao AS Hora,
	COUNT(Hora_Devolucao) AS Quantidade,
	'Quantidade Devolucao' AS Quantidade_String
FROM 
	Devolucao
GROUP BY 
	Hora_Devolucao
)
SELECT 
    Hora, 
    SUM(Quantidade) AS Quantidade_Total,
    GROUP_CONCAT(CONCAT(Quantidade_String, ': ', Quantidade) SEPARATOR ', ') AS Movimentacao
FROM 
	Combina_Horas
GROUP BY 
	Hora
ORDER BY 
	Quantidade_Total DESC;


/* 52 - A sociedade brasileira de editoras solicitou o levantamento para a biblioteca de qual são os 3 autores 
que tem mais livros lidos no ano de 2012 e 2013 e os 2 que tem menos obras lidas.*/

(SELECT 
	'Mais Lidos' AS Classificacao,
	a.ID_Autor,
	a.Nome_Autor,
	COUNT(e.ID_Emprestimo) AS Qtde_Lidos
FROM 
	Emprestimo e
LEFT JOIN 
	Obra o ON e.ID_Obra = o.ID_Obra
LEFT JOIN 
	Autor a ON o.ID_Autor = a.ID_Autor
WHERE 
	YEAR(e.Data_Emprestimo) IN (2012, 2013)
GROUP BY 
	a.ID_Autor, a.Nome_Autor
ORDER BY 
	COUNT(e.ID_Emprestimo) DESC
LIMIT 3)
UNION 
(SELECT 
	'Menos Lidos' AS Classificacao,
	a.ID_Autor,
	a.Nome_Autor,
	COUNT(e.ID_Emprestimo) AS Qtde_Lidos
FROM 
	Emprestimo e
LEFT JOIN 
	Obra o ON e.ID_Obra = o.ID_Obra
LEFT JOIN 
	Autor a ON o.ID_Autor = a.ID_Autor
WHERE 
	YEAR(e.Data_Emprestimo) IN (2012, 2013)
GROUP BY 
	a.ID_Autor, a.Nome_Autor
ORDER BY 
	COUNT(e.ID_Emprestimo) ASC
LIMIT 2);


-- 53 - Crie uma tabela que exiba uma lista de todos livros por funcionario, o total de empréstimos e devoluções que cada um atendeu.

SELECT 
    f.Nome_Funcionario AS Nome_Funcionario,
    o.Titulo_Obra AS Nome_Livro,
    COUNT(DISTINCT e.ID_Emprestimo) AS Total_Emprestimos,
    COUNT(DISTINCT d.ID_Devolucao) AS Total_Devolucoes
FROM 
    Funcionario f
LEFT JOIN 
    Emprestimo e ON f.ID_Funcionario = e.ID_Funcionario
LEFT JOIN 
    Devolucao d ON f.ID_Funcionario = d.ID_Funcionario
LEFT JOIN 
    Obra o ON e.ID_Obra = o.ID_Obra
GROUP BY 
    f.Nome_Funcionario, o.Titulo_Obra
ORDER BY 
    f.Nome_Funcionario, Total_Emprestimos DESC;


/* 54 - A biblioteca quer fechar parceria com as editoras, e existem usuários que trabalham nas editoras facilitando esse contato, para tanto, 
verificar quais usuários possuem o mesmo endereço das editoras, informe seu nome, telefone e o nome da editora que trabalha. */

-- Exemplo 1, em que os Usuários tem os mesmos ID_Endereco das Editoras

SELECT 
	us.Nome_Usuario, 
	us.Telefone, 
    ed.Nome_Editora 
FROM 
	Usuario us 
INNER JOIN 
	Endereco_Usuario eu ON us.ID_Usuario = eu.ID_Usuario
INNER JOIN 
	Endereco en ON eu.ID_Endereco = en.ID_Endereco
INNER JOIN 
	Editora ed ON en.ID_Endereco = ed.ID_Endereco;

-- Exemplo 2, em que a comparação é feita por todas as colunas do endereço, usando duas CTE's

WITH cte_endereco_editora AS (
	SELECT 
		ed.ID_Editora,
		ed.Nome_Editora,
		en.Logradouro, 
		en.Bairro, 
		en.CEP, 
		en.Cidade 
	FROM 
		Editora ed 
	INNER JOIN 
		Endereco en ON ed.ID_Endereco = en.ID_Endereco
),
cte_endereco_usuario_completa AS (
	SELECT 
		us.ID_Usuario,
		us.Nome_Usuario, 
		us.Telefone, 
		en.Logradouro, 
		en.Bairro, 
		en.CEP, 
		en.Cidade 
	FROM 
		Usuario us 
	INNER JOIN 
		Endereco_Usuario eu ON us.ID_Usuario = eu.ID_Usuario
	INNER JOIN 
		Endereco en ON eu.ID_Endereco = en.ID_Endereco
)
SELECT 
	euc.Nome_Usuario,
    euc.Telefone,
    ee.Nome_Editora
FROM 
	cte_endereco_editora ee
INNER JOIN 
	cte_endereco_usuario_completa euc  ON ee.Logradouro = euc.Logradouro 
	AND ee.Bairro = euc.Bairro 
	AND ee.CEP = euc.CEP 
	AND ee.Cidade = euc.Cidade;

-- Exemplo 3, em que a comparação é feita por todas as colunas do endereço, criando duas views, e não pelo ID_Endereco

CREATE VIEW vw_endereco_editora AS
SELECT 
	ed.ID_Editora,
	ed.Nome_Editora,
	en.Logradouro, 
	en.Bairro, 
	en.CEP, 
	en.Cidade 
FROM 
	Editora ed 
INNER JOIN 
	Endereco en ON ed.ID_Endereco = en.ID_Endereco;

CREATE VIEW vw_endereco_usuario_completa AS
SELECT 
	us.ID_Usuario,
	us.Nome_Usuario, 
	us.Telefone, 
	en.Logradouro, 
	en.Bairro, 
	en.CEP, 
	en.Cidade 
FROM 
	Usuario us 
INNER JOIN 
	Endereco_Usuario eu ON us.ID_Usuario = eu.ID_Usuario
INNER JOIN 
	Endereco en ON eu.ID_Endereco = en.ID_Endereco;

-- SELECT utilizando Views criadas para exibir informação solicitada

SELECT 
	euc.Nome_Usuario,
    euc.Telefone,
    ee.Nome_Editora
FROM 
	vw_endereco_editora ee
INNER JOIN 
	vw_endereco_usuario_completa euc ON ee.Logradouro = euc.Logradouro 
	AND ee.Bairro = euc.Bairro 
	AND ee.CEP = euc.CEP 
	AND ee.Cidade = euc.Cidade; 

-- Removendo as views criadas apenas para auxílio pois não serão mais utilizadas

DROP VIEW vw_endereco_editora;
DROP VIEW vw_endereco_usuario_completa;


-- 55 - Foi solicitado a criação de uma visão que traga todos os livros e o preço da editora Leya.

CREATE VIEW View_Editora_Leya AS
SELECT
    o.ID_Obra,
    o.Titulo_Obra,
    o.Valor_Unitario,
	e.Nome_Editora
FROM
    Obra o
INNER JOIN
    Editora e
ON
    o.ID_Editora = e.ID_Editora
WHERE
    e.Nome_Editora = 'Leya';

-- Valicação da View criada

SELECT * FROM View_Editora_Leya;


/* 56 - A biblioteca foi comprar mais livros para aumentar seu acervo, mas a editora Saraiva aumentou em 16% o valor de seus livros, 
atualize os preços dos livros da editora na porcentagem designada.*/

UPDATE 
	Obra
SET 
	Valor_Unitario = ROUND(Valor_Unitario * 1.16, 2) -- apenas 2 casas decimais
WHERE 
	ID_Editora = (
		SELECT 
			ID_Editora 
		FROM 
			Editora 
		WHERE 
			Nome_Editora = 'Saraiva');

-- Query para checar alteração do campo Valor_Unitario

SELECT 
	ID_Obra, 
    Titulo_Obra,
    Valor_Unitario 
FROM 
	Obra
WHERE 
	ID_Editora = (
		SELECT 
			ID_Editora 
		FROM 
			Editora 
		WHERE 
			Nome_Editora = 'Saraiva');


-- 57 - Foi solicitado apresentarmos quais as 5 obras que tiveram menos publicações e as 5 de maior, ainda,  mostrar qual  o autor, editora, nome do livro e quantidade de publicações em ordem decrescente .

-- Query 1: As 5 obras com menos publicações

SELECT 
    o.Titulo_Obra AS Nome_Livro,
    o.Numero_Publicacao AS Quantidade_Publicacoes
FROM 
    Obra o
ORDER BY 
    o.Numero_Publicacao ASC
LIMIT 5;

-- Query 2: As 5 obras com mais publicações

SELECT 
    o.Titulo_Obra AS Nome_Livro,
    o.Numero_Publicacao AS Quantidade_Publicacoes
FROM 
    Obra o
ORDER BY 
    o.Numero_Publicacao DESC
LIMIT 5;

-- Query 3: Autor, Editora, Nome do Livro e Quantidade de Publicações (em ordem decrescente de publicações)

SELECT 
    a.Nome_Autor AS Autor,
    e.Nome_Editora AS Editora,
    o.Titulo_Obra AS Nome_Livro,
    o.Numero_Publicacao AS Quantidade_Publicacoes
FROM 
    Obra o
INNER JOIN 
    Autor a ON o.ID_Autor = a.ID_Autor
INNER JOIN 
    Editora e ON o.ID_Editora = e.ID_Editora
ORDER BY 
    o.Numero_Publicacao DESC;


/* 58 - Fazem cento e noventa e três meses que o instituto bibliográfico brasileiro surgiu. Para comemorar, a diretoria pediu a relação 
de todos os usuários que tem o cpf com o começo 193 que receberão um presente de comemoração. Para isto, foi solicitado informar o nome e o cpf
de todos os usuários que estejam nesse padrão mas mostrar cpf os 3 primeiros dígitos e os dois últimos os do meio apresentar um "*" como no exemplo:
193.***.***-35, lembrando que devemos apresentar dessa maneira, pois a diretoria quer preservar essas informações que são sigilosas. */

SELECT
	Nome_Usuario, 
    CONCAT(LEFT(CPF, 4), '***.***', RIGHT(CPF, 3)) AS CPF_Mascarado 
FROM 
	Usuario 
WHERE 
	CPF LIKE '193%';















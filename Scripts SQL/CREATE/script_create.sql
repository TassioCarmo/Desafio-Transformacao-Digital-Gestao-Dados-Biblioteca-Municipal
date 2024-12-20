DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE IF NOT EXISTS biblioteca;

USE biblioteca;

CREATE TABLE IF NOT EXISTS Nacionalidade(
	ID_Nacionalidade 	INT NOT NULL PRIMARY KEY,
	Nacionalidade 		VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genero(
	ID_Genero 	INT NOT NULL PRIMARY KEY,
    Genero 		VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Endereco(
	ID_Endereco INT NOT NULL PRIMARY KEY,
    Logradouro 	VARCHAR(40) NOT NULL,
	Bairro 		VARCHAR(40) NOT NULL,
	CEP 		VARCHAR(9) NOT NULL,
	Cidade 		VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS Usuario(
	ID_Usuario 		INT NOT NULL PRIMARY KEY,
    Nome_Usuario 	VARCHAR(40) NOT NULL,
    Telefone 		VARCHAR(10) NOT NULL,
    CPF 			CHAR(14) NOT NULL
);

CREATE TABLE IF NOT EXISTS Departamento(
	ID_Departamento 	INT NOT NULL PRIMARY KEY,
    Nome_Departamento 	VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Endereco_Usuario(
	ID_Endereco INT NOT NULL,
    ID_Usuario 	INT NOT NULL
);

ALTER TABLE Endereco_Usuario ADD CONSTRAINT FK_Endereco
FOREIGN KEY(ID_Endereco) REFERENCES Endereco(ID_Endereco);

ALTER TABLE Endereco_Usuario ADD CONSTRAINT FK_Usuario
FOREIGN KEY(ID_Usuario) REFERENCES Usuario(ID_Usuario);

CREATE TABLE IF NOT EXISTS Autor(
	ID_Autor 			INT NOT NULL PRIMARY KEY,
    Nome_Autor 			VARCHAR(40) NOT NULL,
    ID_Nacionalidade 	INT NOT NULL
);

ALTER TABLE Autor ADD CONSTRAINT FK_Nacionalidade_Autor
FOREIGN KEY(ID_Nacionalidade) REFERENCES Nacionalidade(ID_Nacionalidade);

CREATE TABLE IF NOT EXISTS Cargo(
	ID_Cargo 		INT NOT NULL PRIMARY KEY,
    ID_Departamento INT NOT NULL,
    Nome_Cargo 		VARCHAR(40) NOT NULL,
    Salario 		DECIMAL(10,2) NOT NULL
);

ALTER TABLE Cargo ADD CONSTRAINT FK_Departamento_Cargo
FOREIGN KEY(ID_Departamento) REFERENCES Departamento(ID_Departamento);

CREATE TABLE IF NOT EXISTS Funcionario(
	ID_Funcionario 		INT NOT NULL PRIMARY KEY,
    ID_Cargo 			INT NOT NULL,
    Nome_Funcionario 	VARCHAR(40) NOT NULL,
    Data_Admissao 		DATE NOT NULL,
    Data_Demissao 		DATE NOT NULL DEFAULT '9999-12-31',
    Data_Nascimento 	DATE NOT NULL
);

ALTER TABLE Funcionario ADD CONSTRAINT FK_Cargo_Usuario
FOREIGN KEY(ID_Cargo) REFERENCES Cargo(ID_Cargo);

CREATE TABLE IF NOT EXISTS Editora(
	ID_Editora 		INT NOT NULL PRIMARY KEY,
    Nome_Editora 	VARCHAR(40) NOT NULL,
    ID_Endereco 	INT UNIQUE
);

ALTER TABLE Editora ADD CONSTRAINT FK_Endereco_Editora
FOREIGN KEY(ID_Endereco) REFERENCES Endereco(ID_Endereco);

CREATE TABLE IF NOT EXISTS Obra(
	ID_Obra 			INT NOT NULL PRIMARY KEY,
    ID_Editora 			INT NOT NULL,
    ID_Autor 			INT NOT NULL,
    ID_Genero 			INT NOT NULL,
    Titulo_Obra 		VARCHAR(40) NOT NULL,
    Numero_Publicacao 	INT,
    Data_Publicacao 	DATE,
    Valor_Unitario 		DECIMAL(10,2) NOT NULL
);

ALTER TABLE Obra ADD CONSTRAINT FK_Editora_Obra
FOREIGN KEY(ID_Editora) REFERENCES Editora(ID_Editora);

ALTER TABLE Obra ADD CONSTRAINT FK_Autor_Obra
FOREIGN KEY(ID_Autor) REFERENCES Autor(ID_Autor);

ALTER TABLE Obra ADD CONSTRAINT FK_Genero_Obra
FOREIGN KEY(ID_Genero) REFERENCES Genero(ID_Genero);

CREATE TABLE IF NOT EXISTS Emprestimo(
	ID_Emprestimo 	INT NOT NULL PRIMARY KEY,
    ID_Funcionario 	INT NOT NULL,
    ID_Usuario 		INT NOT NULL,
    ID_Obra 		INT NOT NULL,
    Data_Emprestimo DATE NOT NULL,
    Hora_Emprestimo TIME NOT NULL,
    Data_Entrega 	DATE NOT NULL
);

ALTER TABLE Emprestimo ADD CONSTRAINT FK_Funcionario_Emprestimo
FOREIGN KEY(ID_Funcionario) REFERENCES Funcionario(ID_Funcionario);

ALTER TABLE Emprestimo ADD CONSTRAINT FK_Usuario_Emprestimo
FOREIGN KEY(ID_Usuario) REFERENCES Usuario(ID_Usuario);

ALTER TABLE Emprestimo ADD CONSTRAINT FK_Obra_Emprestimo
FOREIGN KEY(ID_Obra) REFERENCES Obra(ID_Obra);

CREATE TABLE IF NOT EXISTS Devolucao(
	ID_Devolucao 	INT NOT NULL PRIMARY KEY,
    ID_Funcionario 	INT NOT NULL,
    ID_Emprestimo 	INT NOT NULL UNIQUE,
    Data_Devolucao 	DATE NOT NULL,
    Hora_Devolucao 	TIME NOT NULL,
    Multa_Atraso 	VARCHAR(2) NOT NULL
);

ALTER TABLE Devolucao ADD CONSTRAINT FK_Funcionario_Devolucao
FOREIGN KEY(ID_Funcionario) REFERENCES Funcionario(ID_Funcionario);

ALTER TABLE Devolucao ADD CONSTRAINT FK_Emprestimo_Devolucao
FOREIGN KEY(ID_Emprestimo) REFERENCES Emprestimo(ID_Emprestimo);

CREATE TABLE IF NOT EXISTS Estoque(
	ID_Estoque 				INT NOT NULL PRIMARY KEY,
    ID_Obra 				INT NOT NULL UNIQUE,
    Quantidade_Total 		INT NOT NULL,
    Quantidade_Disponivel 	INT NOT NULL
);

ALTER TABLE Estoque ADD CONSTRAINT FK_Obra_Estoque
FOREIGN KEY(ID_Obra) REFERENCES Obra(ID_Obra);

CREATE TABLE IF NOT EXISTS Reserva(
	ID_Reserva 		INT NOT NULL PRIMARY KEY,
    ID_Funcionario 	INT NOT NULL,
    ID_Usuario 		INT NOT NULL,
    ID_Obra 		INT NOT NULL,
    Status_Livro 	ENUM('Reservado', 'Disponível') NOT NULL DEFAULT 'Reservado',
    Data_Reserva 	DATE NOT NULL,
    Hora_Reserva 	TIME NOT NULL,
    Status_Reserva 	ENUM('Cancelada', 'Ativa', 'Finalizada') NOT NULL DEFAULT 'Ativa'
);

ALTER TABLE Reserva ADD CONSTRAINT FK_Funcionario_Reserva
FOREIGN KEY(ID_Funcionario) REFERENCES Funcionario(ID_Funcionario);

ALTER TABLE Reserva ADD CONSTRAINT FK_Usuario_Reserva
FOREIGN KEY(ID_Usuario) REFERENCES Usuario(ID_Usuario);

ALTER TABLE Reserva ADD CONSTRAINT FK_Obra_Reserva
FOREIGN KEY(ID_Obra) REFERENCES Obra(ID_Obra);



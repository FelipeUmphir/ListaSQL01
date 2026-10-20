CREATE DATABASE Livraria
GO
USE Livraria

CREATE TABLE Livro (
Codigo	INT				NOT NULL	IDENTITY(100001, 100),
Nome	VARCHAR(200)	NOT NULL,
Lingua	VARCHAR(10)		NOT NULL	DEFAULT('PT-BR'),
Ano		INT				NOT NULL	CHECK(Ano >= 1990)

PRIMARY KEY(Codigo)
)
CREATE TABLE Autor (
ID_Autor	INT				NOT NULL	IDENTITY(2351, 1),
Nome		VARCHAR(100)	NOT NULL	UNIQUE,
Data_nasc	DATE			NOT NULL,
Pais_Nasc	VARCHAR(50)		NOT NULL	CHECK(Pais_Nasc = 'Brasil' 
											OR Pais_Nasc = 'Estados Unidos'
											OR Pais_Nasc = 'Ingraterra'
											OR Pais_Nasc = 'Alemanha'),
Biografira	VARCHAR(255)	NOT NULL

PRIMARY KEY(ID_Autor)
)
CREATE TABLE Editora (
ID_Editora			  INT			 NOT NULL	IDENTITY(491, 16),
Nome				  VARCHAR(70)	 NOT NULL	UNIQUE,
Telefone			  VARCHAR(11)	 NOT NULL	CHECK(LEN(Telefone) = 11),
Logradouro_Endereco	  VARCHAR(11)	 NOT NULL,
Numero_Endereco		  INT			 NOT NULL	CHECK(Numero_Endereco >= 0),
CEP_Endereco		  CHAR(8)		 NOT NULL	CHECK(LEN(CEP_Endereco) = 8),
Complemento_Endereco  VARCHAR(255)	 NOT NULL

PRIMARY KEY(ID_Editora)
)
CREATE TABLE Edicao (
ISBN			CHAR(13)		NOT NULL	CHECK(LEN(ISBN) = 13),
Preco			DECIMAL(4,2)	NOT NULL	CHECK(Preco >= 0),
Ano				INT				NOT NULL	CHECK(Ano >= 1993),
Numero_Paginas	INT				NOT NULL	CHECK(Numero_Paginas > 15),
Qtd_Estoque		INT				NOT NULL

PRIMARY KEY(ISBN)
)
GO
CREATE TABLE Livro_Autor (
LivroCodigo		INT		NOT NULL,
AutorID_Autor	INT		NOT NULL

PRIMARY KEY(LivroCodigo, AutorID_Autor)
FOREIGN KEY (LivroCodigo) REFERENCES Livro(Codigo),
FOREIGN KEY (AutorID_Autor) REFERENCES Autor(ID_Autor)
)
GO
CREATE TABLE Editora_Edicao_Livro (
EditoraID_Editora	INT			NOT NULL,
EdicaoISBN			CHAR(13)	NOT NULL,
LivroCodigo			INT			NOT NULL

PRIMARY KEY(LivroCodigo, EditoraID_Editora, EdicaoISBN)
FOREIGN KEY (LivroCodigo) REFERENCES Livro(Codigo),
FOREIGN KEY (EdicaoISBN) REFERENCES Edicao(ISBN),
FOREIGN KEY (EditoraID_Editora) REFERENCES Editora(ID_Editora)
)
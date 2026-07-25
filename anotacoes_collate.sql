--REGEX

--LIKE + CASE SENSITIVE

--CREATE TABLE Nomes (
--ID INT,
--Nome VARCHAR (100) COLLATE Latin1_General_CS_AS
--)

--INSERT INTO Nomes (ID, Nome)
--VALUES
--(1, 'Matheus'),
--(2, 'Marcela'),
--(3, 'marcos'),
--(4, 'MAuricio'),
--(5, 'Marta'),
--(6, 'Miranda'),
--(7, 'Melissa'), 
--(8, 'Lucas'),
--(9, 'luisa'),
--(10, 'Pedro')

--SELECT * FROM Nomes

--CASE SENSITIVE: diferenciando maiusculas de minusculas
--LIKE: padrao utilizado ate agora

--SELECT * FROM Nomes
--WHERE Nome LIKE 'mar%'

--retorna apenas 'marcos' porque a tabela foi criada com a coluna
--nome sendo case sensitive

--retornando as linhas onde a primeira letra seja 'm', a segunda 'a'
--e a terceira 'r'

--SELECT * FROM Nomes
--WHERE Nome LIKE '[m][a][r]%'

--retornando as linhas onde a primeira letra seja [M], a segunda [a]
--e a terceira seja [r]

--SELECT * FROM Nomes
--WHERE Nome LIKE '[M][a][r]%'

--retornando as linhas onde a primeira linha seja 'M' ou 'm' e a
--segunda seria 'A' ou 'a'

--SELECT * FROM Nomes
--WHERE Nome LIKE '[Mm][Aa]%'

--filtrando os primeiros caracteres + case sensitive
--CREATE DATABASE DB_Collation
--USE DB_Collation

--CREATE TABLE Textos (
--ID INT,
--Texto VARCHAR (100) COLLATE Latin1_General_CS_AS
--)

--INSERT INTO Textos (ID, Texto)
--VALUES 
--(1, 'Marcos'),
--(2, 'Excel'),
--(3, 'leandro'),
--(4, 'K'),
--(5, 'X7'),
--(6, '19'),
--(7, '#M'),
--(8, '@9'),
--(9, 'M'),
--(10, 'RT')

--SELECT * FROM Textos


--retornando nomes que começam com a letra 'M', 'E' ou 'K'

--SELECT * FROM Textos
--WHERE Texto LIKE '[MEK]%'


--retornando nomes que possuem apenas 1 (um) caractere
--SELECT * FROM Textos
--WHERE Texto LIKE '[A-z]'

--retornando nomes que possuem apenas 2 ()dois caracteres
--SELECT * FROM Textos
--WHERE Texto LIKE '[A-z][A-z]'

--retornando nomes que possuem 2 caracteres
--o primeiro em letra, o segundo em numero
--SELECT * FROM Textos
--WHERE Texto LIKE '[A-z][0-9]'

--CREATE TABLE Nomes (
--ID INT,
--Nome VARCHAR (100) COLLATE Latin1_General_CS_AS
--)

--INSERT INTO Nomes (ID, Nome)
--VALUES
--(1, 'Matheus'),
--(2, 'Marcela'),
--(3, 'marcos'),
--(4, 'MAuricio'),
--(5, 'Marta'),
--(6, 'Miranda'),
--(7, 'Melissa'), 
--(8, 'Lucas'),
--(9, 'luisa'),
--(10, 'Pedro')

--retorna os nomes que
--1. começam com a letra 'M' ou 'm'
--2. o segundo caractere pode ser qualquer coisa ('_' é um curinga)
--3. o terceiro caracter pode ser a letra 'R' ou 'r'
--4. possui uma quantidade qualquer apos o terceiro (por conta do '%')

--SELECT 
--	*
--FROM
--	Nomes 
--WHERE
--	Nome LIKE '[%Ma]_[Rr]%'

--LIKE: utilizando o operador de negação [^]

--retorne nomes que não começam com 'L' ou 'l'

--SELECT 
--	*
--FROM
--	Nomes
--WHERE
--	Nome LIKE '[^Ll]%'

--retornando nomes que começam com qualquer caractere (_)
--e a segunda letra não é 'E' ou 'e'

--SELECT 
--	*
--FROM
--	Nomes
--WHERE
--	Nome LIKE '_[^Ee]%'

--filtrando textos com caracteres especiais

--identificando caracteres especiais

--SELECT 
--	*
--FROM
--	Nomes
--WHERE
--	Nome LIKE '%[^a-z0-9]%'

--CREATE TABLE Numeros (
--Numero DECIMAL (20, 2)
--)

--INSERT INTO Numeros (Numero)
--VALUES
--(50),
--(30.23),
--(9),
--(100.54),
--(15.9),
--(6.5),
--(10),
--(501.76),
--(1000.56),
--(31)

--retornando os numeros que possuem 2 digitos na parte inteira

--SELECT 
--	*
--FROM
--	Numeros
--WHERE
--	Numero LIKE '[0-9][0-9].[0][0]'

--retornando linhas que:
--1. possuem 3 digitos na parte inteira, sendo o primeiro digito igual a 5
--2. o primeiro numero na parte decimal seja 7
--3. o segundo numero na parte decimal seja um numero entre 0 e 9

--SELECT 
--	*
--FROM
--	Numeros
--WHERE
--	Numero LIKE '[5]__.[7][0-9]'
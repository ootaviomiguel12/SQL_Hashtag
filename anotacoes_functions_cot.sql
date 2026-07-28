----ANOTAÇÕES FUNCTIONS

--SELECT * FROM dCliente

--SELECT
--	nome_cliente,
--	data_de_nascimento,
--	[dbo].[fnDataCompleta](data_de_nascimento)
--FROM
--	dCliente



---- Criando uma função para formatação de data usando a DATENAME

--CREATE FUNCTION fnDataCompleta(@data AS DATE)
--RETURNS VARCHAR(MAX)
--AS
--BEGIN

--	RETURN DATENAME(DW, @Data) + ', ' +
--			DATENAME(D, @Data) + ' de ' +
--			DATENAME(M, @Data) + ' de ' + 
--			DATENAME(YY, @Data)

--END


----ALTERANDO OU EXCLUINDO UMA FUCTION


----EXCLUINDO A FUNCTION
--DROP FUNCTION fnDataCompleta
 

----CRIA OU ALTERA UMA FUNCTION
--CREATE OR ALTER FUNCTION fnDataCompleta(@data AS DATE)
--RETURNS VARCHAR(MAX)
--AS
--BEGIN

--	RETURN DATENAME(DW, @Data) + ', ' +
--			DATENAME(D, @Data) + ' de ' +
--			DATENAME(M, @Data) + ' de ' + 
--			DATENAME(YY, @Data) + ' - ' +
--			CASE
--				WHEN MONTH (@Data) <= 6 
--			THEN '(Primeiro Semestre)'
--			ELSE
--				'(Segundo Semestre)'
--		END
--END


--FUNCTIONS COMPLETAS

--criando uma função para retornar o primeiro nome de cada gerente
--no entanto, há um cliente cadastrado que possui apenas o primeiro
--nome, portanto, a busca abaixo gera erro, pois o CHARINDEX não
--encontra o espaco	' ' e mesmo assim subtrai 1, resultabdo em um numero
--negativo, gerando erro.

--INSERT INTO dGerente (nome_gerente, data_contratacao, salario)
--VALUES 
--	('João', '10/01/2019', 3100)

--SELECT 
--	nome_produto,
--	LEFT (nome_gerente, CHARINDEX (' ', nome_gerente) - 1 ) AS primeiro_nome
--FROM dGerente


--CRIANDO UMA FUNCTION COMPLEXA PARA RESOLVER O PROBLEMA ACIMA ^^

SELECT
	nome_gerente,
	dbo.fnPrimeiroNome(nome_gerente) AS primeiro_nome
FROM dGerente


CREATE OR ALTER FUNCTION fnPrimeiroNome(@nomeCompleto AS VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN

	DECLARE @posicaoEspaco AS INT
	DECLARE @resposta AS VARCHAR(MAX)

	SET @posicaoEspaco = CHARINDEX(' ', @nomeCompleto)

	IF @posicaoEspaco = 0
		SET @resposta = @nomeCompleto
	ELSE
		SET @resposta = LEFT(@nomeCompleto, @posicaoEspaco - 1)
		--OU
		--SET @resposta = LEFT(@nomeCompleto, CHARINDEX (' ', nome_gerente) - 1 )

	RETURN @resposta

END

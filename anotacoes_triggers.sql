--TRIGGER DMP Simples

--crie uma trigger que será disparada APÓS um evento 
--INSERT, UPDATE OU DELETE seja executado na tabela dCliente
--USE Exercicios

--CREATE OR ALTER TRIGGER tgClienteAlterado
--ON dCliente
--AFTER INSERT, UPDATE, DELETE
--AS
--	BEGIN 
--		SELECT * FROM INSERTED
--		SELECT * FROM DELETED
--		PRINT 'Os dados da tabela dCliente foram alterados!'
--END



----verificando se a Trigger funciona
--INSERT INTO dCliente (nome_cliente, genero, data_nascimento, cpf) 
--VALUES
--	('Zacarias Neto', 'M', '13/02/1999', '169.543.189-00')

--UPDATE dCliente
--SET cpf = '130.451.892-10'
--WHERE ID_cliente = 11

--DELETE FROM dCliente
--WHERE ID_cliente = 11


--IDENTIFICANDO O EVENTO DML RELACIONADO

--CREATE OR ALTER TRIGGER tgClienteAlterado
--ON dCliente
--AFTER INSERT, UPDATE, DELETE
--AS
--BEGIN 
--	IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
--		PRINT 'Dados foram atualizados na tabela'
--	ELSE IF EXISTS (SELECT * FROM INSERTED)
--		PRINT 'Dados foram inseridos na tabela'
--	ELSE IF EXISTS (SELECT * FROM DELETED)
--		PRINT 'Dados foram excluídos da tabela'
--END


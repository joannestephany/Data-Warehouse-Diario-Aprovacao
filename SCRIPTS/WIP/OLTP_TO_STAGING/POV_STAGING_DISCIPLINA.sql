-- AMBIENRE OPERACINAL PARA STAGING
GO
CREATE OR ALTER PROCEDURE ETL_OLTP_TO_STAGING_DISCIPLINA(@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE AUX_DISCIPLINA WHERE DATACARGA = @DATA_CARGA

	INSERT INTO AUX_DISCIPLINA(DATA_CARGA, ID_DISCIPLINA, COD_DISCIPLINA, NOME_DISCIPLINA)
	SELECT @DATA_CARGA, D.ID_DISCIPLINA, D.COD_DISCIPLINA, D.NOME_DISCIPLINA FROM TB_DISCIPLINA D
END
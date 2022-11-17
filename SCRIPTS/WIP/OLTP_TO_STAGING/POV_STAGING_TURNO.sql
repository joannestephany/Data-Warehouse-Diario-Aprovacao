--USE DW_DIARIO_ACADEMICO
CREATE OR ALTER PROCEDURE ETL_OLTP_TO_STAGING_TURNO(@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE AUX_TURNO WHERE DATACARGA = @DATA_CARGA

	INSERT INTO AUX_TURNO(DATACARGA,ID_TURNO,NOME_TURNO)
	SELECT @DATA_CARGA, T.ID_TURNO, T.NOME_TURNO FROM TB_TURNO T 
END

--
GO
CREATE OR ALTER PROCEDURE ETL_OLTP_TO_STAGING_PROFESSOR(@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE AUX_PROFESSOR WHERE DATACARGA = @DATA_CARGA

	INSERT INTO AUX_TURMA(DATACARGA,ID_PROFESSOR,MATRICULA_PROFESSOR,NOME_PROFESSOR)
	SELECT @DATA_CARGA, P.ID_PROFESSOR, P.MATRICULA_PROFESSOR, P.NOME_PROFESSOR FROM TB_PROFESSOR P 
END
GO
--
GO
CREATE OR ALTER PROCEDURE ETL_OLTP_TO_STAGING_DISCIPLINA(@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE AUX_DISCIPLINA WHERE DATACARGA = @DATA_CARGA

	INSERT INTO AUX_DISCIPLINA(DATACARGA,ID_DISCIPLINA,NOME_DISCIPLINA,COD_DISCIPLINA)
	SELECT @DATA_CARGA, D.ID_DISCIPLINA, D.NOME_DISCIPLINA, D.COD_DISCIPLINA
    FROM TB_DISCIPLINA D 
END
GO
--
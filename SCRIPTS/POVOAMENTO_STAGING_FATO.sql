-- MEU FATO � A TURMA
CREATE OR ALTER PROCEDURE ETL_OLTP_TO_STAGING_FATO(@DATA_CARGA DATETIME,@ANO_INICIO INT,@ANO_FIM INT)
AS
BEGIN
	DECLARE @ID_TURMA INT,
			@ID_PROFESSOR INT,
			@ID_DISCIPLINA INT,
			@ID_TURNO INT,
			@NUM_ALUNOS INT,
			@NUM_APROVADOS INT,
			@NUM_REPROVADOS INT,
			@NUM_TRANCADOS INT,
			@ANO INT,
			@SEMESTRE INT

	DELETE AUX_FATO WHERE DATACARGA = @DATA_CARGA AND ANO>=@ANO_INICIO AND ANO<=@ANO_FIM  

	DECLARE C_TURMA 
	CURSOR FOR SELECT T.ID_TURMA, T.ID_PROFESSOR, T.ID_DISCIPLINA,T.ID_TURNO, T.NUM_ALUNOS, T.ANO, T.SEMESTRE FROM TB_TURMA T WHERE T.ANO>=@ANO_INICIO AND T.ANO<=@ANO_FIM

	OPEN C_TURMA
	FETCH C_TURMA INTO @ID_TURMA, @ID_PROFESSOR, @ID_DISCIPLINA, @ID_TURNO, @NUM_ALUNOS, @ANO, @SEMESTRE

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @NUM_APROVADOS = (SELECT COUNT(*) FROM TB_ALUNO_TURMA AT WHERE AT.ID_TURMA = @ID_TURMA AND AT.STATUS = 'APROVADO')

		SET @NUM_REPROVADOS = (SELECT COUNT(*) FROM TB_ALUNO_TURMA AT WHERE AT.ID_TURMA = @ID_TURMA AND AT.STATUS = 'REPROVADO')

		SET @NUM_TRANCADOS = (SELECT COUNT(*) FROM TB_ALUNO_TURMA AT WHERE AT.ID_TURMA = @ID_TURMA AND AT.STATUS = 'TRANCADO')

		INSERT INTO AUX_FATO(DATACARGA,ID_PROFESSOR,ID_DISCIPLINA,ID_TURMA,ID_TURNO,NUM_APROVADOS,NUM_REPROVADOS,NUM_TRANCADOS,ANO,SEMESTRE) VALUES (@DATA_CARGA,@ID_PROFESSOR,@ID_DISCIPLINA,@ID_TURMA,@ID_TURNO,@NUM_APROVADOS,@NUM_REPROVADOS,@NUM_TRANCADOS,@ANO,@SEMESTRE)

		FETCH C_TURMA INTO @ID_TURMA, @ID_PROFESSOR, @ID_DISCIPLINA, @ID_TURNO, @NUM_ALUNOS, @ANO, @SEMESTRE
	END
	CLOSE C_TURMA
	DEALLOCATE C_TURMA

END

EXEC ETL_OLTP_TO_STAGING_FATO '20221115', 2020,2022
SELECT * FROM AUX_FATO
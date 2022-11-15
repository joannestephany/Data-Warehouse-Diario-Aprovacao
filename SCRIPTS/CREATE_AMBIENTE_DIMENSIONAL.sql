--USE DW_DIARIO_ACADEMICO

CREATE TABLE DIM_TEMPO(
	ID_TEMPO INT IDENTITY (1,1) PRIMARY KEY,
	NIVEL VARCHAR(10),
	SEMESTRE INT,
	NOME_SEMESTRE VARCHAR(40),
	ANO INT,
	PERIODO_LETIVO VARCHAR(6)
);


CREATE TABLE DIM_PROFESSOR(
	ID_PROFESSOR INT PRIMARY KEY,
	COD_PROFESSOR INT,
	MATRICULA_PROFESSOR INT,
	NOME_PROFESSOR VARCHAR(50),
);

CREATE TABLE DIM_DISCIPLINA(
	ID_DISCIPLINA INT PRIMARY KEY,
	COD_DISCIPLINA INT,
	NOME_DISCIPLINA VARCHAR(50),
	NUM_TURMAS INT,
);

CREATE TABLE DIM_TURNO(
	ID_TURNO INT PRIMARY KEY,
	NOME_TURNO VARCHAR(50),
);

CREATE TABLE DIM_TURMA(
	ID_TURMA INT PRIMARY KEY,
	COD_TURMA INT,
	NUM_ALUNOS INT,
);

CREATE TABLE FATO_DIARIO_ACADEMICO(
	ID_TEMPO INT,
	ID_PROFESSOR INT,
	ID_DISCIPLINA INT,
	ID_TURMA INT,
	ID_TURNO INT,
	NUM_APROVADOS INT,
	NUM_REPROVADOS INT,
	NUM_TRANCADOS INT,
);
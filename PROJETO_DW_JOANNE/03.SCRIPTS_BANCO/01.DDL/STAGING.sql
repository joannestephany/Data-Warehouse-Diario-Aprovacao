--USE DW_DIARIO_ACADEMICO

CREATE TABLE AUX_PROFESSOR(
	DATACARGA DATETIME,
	ID_PROFESSOR INT PRIMARY KEY,
	MATRICULA_PROFESSOR VARCHAR(12),
	NOME_PROFESSOR VARCHAR(50)
);

CREATE TABLE AUX_DISCIPLINA(
	DATACARGA DATETIME,
	ID_DISCIPLINA INT PRIMARY KEY,
	COD_DISCIPLINA VARCHAR(8), -- CODIGO DA DISCIPLINA AUDS1205
	NOME_DISCIPLINA VARCHAR(50)
);

CREATE TABLE AUX_TURMA(
	DATACARGA DATETIME,
	ID_TURMA INT PRIMARY KEY,
	ID_DISCIPLINA INT,
	NOME_TURMA VARCHAR(10) -- PENSAR LOGICA PARA ESSE NOME
);

CREATE TABLE AUX_TURNO(
	DATACARGA DATETIME,
	ID_TURNO INT PRIMARY KEY,
	NOME_TURNO CHAR(1)
);

CREATE TABLE AUX_FATO(
	DATACARGA DATETIME,
	ID_PROFESSOR INT,
	ID_DISCIPLINA INT,
	ID_TURMA INT,
	ID_TURNO INT,
	NUM_APROVADOS INT,
	NUM_REPROVADOS INT,
	NUM_TRANCADOS INT,
	ANO INT,
	SEMESTRE INT
);

CREATE TABLE VIO_FATO(
	DATACARGA DATETIME,
	ID_PROFESSOR INT,
	ID_DISCIPLINA INT,
	ID_TURMA INT,
	ID_TURNO INT,
	NUM_APROVADOS INT,
	NUM_REPROVADOS INT,
	NUM_TRANCADOS INT,
	ANO INT,
	SEMESTRE INT,
	DATA_ERRO DATETIME,
	VIOLACAO VARCHAR(100)
);
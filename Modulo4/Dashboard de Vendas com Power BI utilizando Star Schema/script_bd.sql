create schema if not exists university;

use university;

-- Criação da tabela Departamento
CREATE TABLE departamento (
    id INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    Campus VARCHAR(45),
    id_professor_coordenador INT,
    
);

-- Criação da tabela Professor
CREATE TABLE professor (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_departamento INT,
    id_disciplina INT,
    id_curso INT,

);

-- Criação da tabela Disciplina
CREATE TABLE disciplina (
    id INT PRIMARY KEY,
    id_professor INT,
    nome VARCHAR(45) NOT NULL,

);

-- Criação da tabela Curso
CREATE TABLE curso (
    id INT PRIMARY KEY,
    id_professor INT,
    nome VARCHAR(45) NOT NULL,

);

ALTER TABLE departamento 
    ADD CONSTRAINT FOREIGN KEY (id_professor_coordenador) REFERENCES Professor(id)
    ON UPDATE cascade;

ALTER TABLE professor     
    ADD CONSTRAINT FOREIGN KEY (id_departamento) REFERENCES Departamento(id)
    ON UPDATE cascade,
    ADD CONSTRAINT FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id)
    ON UPDATE cascade,
    ADD CONSTRAINT FOREIGN KEY (id_curso) REFERENCES Curso(id)
    ON UPDATE cascade;

ALTER TABLE disciplina  
    ADD CONSTRAINT FOREIGN KEY (id_professor) REFERENCES Professor(id)
    ON UPDATE cascade;

ALTER TABLE curso
    ADD CONSTRAINT FOREIGN KEY (id_professor) REFERENCES Professor(id)
    ON UPDATE cascade;
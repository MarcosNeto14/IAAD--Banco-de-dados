-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 

begin;
drop schema if exists empresa; -- inclua seu nome
create schema empresa; -- Pode usar o comando 'create database empresa_seunome;' (São semelhantes!)
use empresa;

-- Criando as tabelas
create table Startup(
	id_startup CHAR(5) ,
	nome_startup VARCHAR(15) NOT NULL ,
	cidade_sede VARCHAR (20) ,
	PRIMARY KEY (id_startup));
create table Linguagem_Programação(
	id_linguagem CHAR(5) ,
	nome_linguagem VARCHAR(15) NOT NULL ,
	ano_lançamento YEAR ,
	PRIMARY KEY(id_linguagem));
create table Programador(
	id_programador CHAR(5) ,
	id_startup CHAR(5) ,
	nome_programador VARCHAR(30) NOT NULL ,
	gênero CHAR(1) ,
	data_nascimento DATE ,
    email VARCHAR(50) UNIQUE ,
	PRIMARY KEY(id_programador),
    CONSTRAINT fk_id_startup FOREIGN KEY(id_startup)
    REFERENCES Startup(id_startup)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
create table Programador_Linguagem(
	id_programador CHAR(5) ,
	id_linguagem CHAR(5));
    
create table Programador_Salário(
	id_programador CHAR(5) ,
    nome_programador VARCHAR(30) NOT NULL ,
    salário INT 
    );
    
	
-- populando/carregando as tabelas do banco de dados
insert into Startup values
	('10001', 'Tetch4Toy', 'Porto Alegre'),
    ('10002', 'Smart123', 'Belo Horizonte'),
    ('10003', 'knowledgeUp', 'Rio de Janeiro'),
    ('10004', 'BSI Next Level', 'Recife'),
    ('10005', 'QualiHealth', 'São Paulo'),
    ('10006', 'ProEdu', 'Florianópolis');
    
 insert into Linguagem_Programação values
	('20001', 'Python', '1991'),
    ('20002', 'PHP', '1995'),
    ('20003', 'Java', '1995'),
    ('20004', 'C', '1972'),
    ('20005', 'JavaScript', '1995'),
    ('20006', 'Dart', '2011');
    
insert into Programador values
	('30001', '10001', 'João Paulo', 'M', '1993-06-23', 'joaop@mail.com'),
    ('30002', '10002', 'Paula Silva', 'F', '1986-01-10', 'paulas@mail.com'),
    ('30003', '10003', 'Renata Vieira', 'F', '1991-07-05', 'renatav@mail.com'),
    ('30004', '10004', 'Felipe Santos', 'M', '1976-11-25', 'felipes@mail.com'),
    ('30005', '10001', 'Ana Cristina', 'F', '1968-02-19', 'anac@mail.com'),
    ('30006', '10004', 'Alexandre Alves', 'M', '1988-07-07', 'alexandrea@mail.com'),
    ('30007', '10002', 'Laura Marques', 'F', '1987-10-04', 'lauram@mail.com');
insert into Programador_Linguagem values
	('30001', '20001'),
	('30001', '20002'),
	('30002', '20003'),
	('30003', '20004'),
	('30003', '20005'),	
    ('30004', '20005'),
    ('30007', '20001'),
    ('30007', '20002');
insert into Programador_Salário values
	('30001', 'João Pedro', 3000),
    ('30002', 'Paula Silva', 2500),
    ('30003', 'Renata Vieira', 2750),
    ('30004', 'Felipe Santos', 4200),
    ('30005', 'Ana Cristina', 8000),
    ('30006', 'Alexandre Alves', 4500),
    ('30007', 'Laura Marques', 15000);
    
ALTER TABLE Programador_Linguagem
ADD FOREIGN KEY (id_programador)
REFERENCES Programador(id_programador) ON DELETE RESTRICT;
ALTER TABLE Programador_Linguagem
ADD FOREIGN KEY (id_linguagem)
REFERENCES Linguagem_Programação(id_linguagem)
ON DELETE RESTRICT; 


    
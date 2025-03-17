/*
CREATE database hospitalJiafei;

USE hospitalJiafei;

CREATE TABLE Tipos_sanguineos (
	id_tipo_sanguineo integer auto_increment primary key unique,
	nome varchar(3)
);

CREATE TABLE Planos_de_saude (
	id_plano integer auto_increment primary key unique,
	nome varchar(100),
	descricao text,
	valor_plano float
);

CREATE TABLE Pacientes (
	id_paciente integer auto_increment primary key unique,
	cpf varchar(14) unique,
	data_de_nascimento datetime,
	endereco varchar(255),
	telefone varchar(50),
	id_tipo_sanguineo integer,
    foreign key (id_tipo_sanguineo) references Tipos_sanguineos(id_tipo_sanguineo),
	id_plano integer,
    foreign key (id_plano) references Planos_de_saude(id_plano)
);



CREATE TABLE Medicos (
	id_medico integer auto_increment primary key unique,
	nome varchar(255),
	salario float
);

CREATE TABLE Estado (
	id_estado integer auto_increment primary key unique,
	nome_estado varchar(100) unique
);


CREATE TABLE Crm (
	id_crm integer auto_increment primary key unique,
	numero_crm varchar(100) unique,
	especialidade varchar(255),
	new_field integer,
	id_estado int,
    foreign key (id_estado) references Estado(id_estado)
);



CREATE TABLE Crm_do_medico (
	id_relacao integer auto_increment primary key unique,
	id_medico integer,
    foreign key (id_medico) references Medicos(id_medico),
	id_crm integer,
    foreign key (id_crm) references Crm(id_crm)
);

CREATE TABLE Enfermeiros (
	id_enfermeiro integer auto_increment primary key unique,
	numero_coren varchar(100) unique,
	telefone varchar(100)
);

CREATE TABLE Corens (
	id_coren integer auto_increment primary key unique,
	nome varchar(255),
	id_estado integer,
    foreign key (id_estado) references Estado(id_estado)
);

CREATE TABLE Especialidades_enfermeiros (
	id_especialidade integer auto_increment primary key unique,
	nome_especialidade varchar(255),
	descricao text
);


CREATE TABLE Especialidades_enfermeiro (
	id_relacao integer auto_increment primary key unique,
	id_especialidade integer,
    foreign key (id_especialidade) references Especialidades_enfermeiros(id_especialidade),
	id_enfermeiro integer,
    foreign key (id_enfermeiro) references Enfermeiros(id_enfermeiro)
);

CREATE TABLE Corens_enfermeiro (
	id_relacao integer auto_increment primary key unique,
	id_coren integer,
    id_enfermeiro integer,
    foreign key (id_coren) references Corens(id_coren),
	foreign key (id_enfermeiro) references Enfermeiros(id_enfermeiro)
);

CREATE TABLE Setores (
	id_setor integer auto_increment primary key unique,
	nome_setor varchar(100),
	descricao text
);

CREATE TABLE Supervisores_enfermeiros (
	id_supervisor integer auto_increment primary key unique,
	nome_supervisor varchar(255),
	salario_supervisor float
);

CREATE TABLE Setores_enfermeiro (
	id_relacao integer auto_increment primary key unique,
	id_setor integer,
    foreign key (id_setor) references Setores(id_setor),
	id_enfermeiro integer,
    foreign key (id_enfermeiro) references Enfermeiros(id_enfermeiro)
);

CREATE TABLE Supervisores_enfermeiro (
	id_relacao integer auto_increment primary key unique,
	id_enfermeiro integer,
    foreign key (id_enfermeiro) references Enfermeiros(id_enfermeiro),
	id_supervisor integer,
    foreign key (id_supervisor) references Supervisores_enfermeiros(id_supervisor)
);

CREATE TABLE Funcionarios (
	id_funcionario integer auto_increment primary key unique,
	id_cargo integer,
	salario float
);

CREATE TABLE Setor_funcionarios (
	id_relacao integer auto_increment primary key unique,
	id_funcionario integer,
    id_setor integer,
    foreign key (id_funcionario) references Funcionarios(id_funcionario),
	foreign key (id_setor) references Setores(id_setor)
);

CREATE TABLE Consultas (
	id_consulta integer auto_increment primary key unique,
	data_consulta datetime,
	diagnostico text,
	id_paciente integer,
    foreign key (id_paciente) references Pacientes(id_paciente),
	id_medico integer,
    foreign key (id_medico) references Medicos(id_medico)
);

CREATE TABLE Sintomas (
	id_sintoma integer auto_increment primary key unique,
	nome_sintoma varchar(255),
	descricao text
);

CREATE TABLE Sintomas_paciente (
	id_relacao integer auto_increment primary key unique,
	id_paciente integer,
    foreign key (id_paciente) references Pacientes(id_paciente),
	id_sintoma integer,
    foreign key (id_sintoma) references Sintomas(id_sintoma)
);

CREATE TABLE Tipos_exame (
	id_tipo integer auto_increment primary key unique,
	nome_tipo varchar(100),
	descricao text
);

CREATE TABLE Status_fase (
	id_status integer auto_increment primary key unique,
	nome_status varchar(50),
	descricao_status text
);

CREATE TABLE Exames (
	id_exame integer auto_increment primary key unique,
	id_tipo integer,
	resultado text,
	data_realizacao datetime,
	id_status integer,
	id_consulta integer,
    foreign key (id_tipo) references Tipos_exame(id_tipo),
    foreign key (id_status) references Status_fase(id_status),
    foreign key (id_consulta) references Consultas(id_consulta)
);



Insert into Tipos_sanguineos (nome)
value('AB+');

Insert into Planos_de_saude (nome, descricao, valor_plano)
value('Saude +', 'Plano ideal para pobrinhos', 9999.99);

Insert into Pacientes (cpf, data_de_nascimento, endereco, telefone, id_tipo_sanguineo, id_plano)
value('1234567891011', '2005-03-20 14:30:00', 'Rua das Jatopimbas 202', '19 971060461', 1, 1);

*/
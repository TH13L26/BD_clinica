create database db_hospital;
use db_hospital;

/***************************************************-- TB MEDICO --**********************************************************************/
create table tb_medico(
    pk_idmed int primary key not null auto_increment,
    nome_med varchar(100) not null,
    tel_med varchar(25),
    crm_med varchar(20),
    end_med varchar(50),
    data_nasc date
);

drop table tb_medico;
describe tb_medico;
select * from tb_medico;

insert into tb_medico
(nome_med, tel_med, crm_med, end_med, data_nasc) value
('Meredith Grey', '11 90707-0707', '000000000-0/BR', 'Rua um', '1997-02-15'),
('Cristina Yang', '11 90707-0707', '000000000-0/BR', 'Rua dois', '1996-06-18'),
('Izzie Steve', '11 90707-0707', '000000000-0/BR', 'Rua tres', '1996-11-13');

/*******************************************************--TB CONSULTA --******************************************************************/
create table tb_receitaMed(
    pk_idRecMed int primary key not null auto_increment,
    descricao varchar(500) not null,
    remed_med varchar(255),
    data_rec date,
    venc_rec date,
    num_rec numeric(9)
);

describe tb_receitaMEd;
select * from tb_receitaMed;

insert into tb_receitaMed
(descricao, remed_med, data_rec, venc_rec, num_rec) value
('tomar de 3 em 3 dias durante 1 semana', 'paracetamol', '2023-11-02', '2023-11-10', '857'),
('tomar de 4 em 4 dias durante 3 semana', 'diclofenaco', '2023-11-02', '2023-11-10', '858'),
('tomar de 2 em 2 dias durante 10 dias', 'dipirona', '2023-11-02', '2023-11-10', '859');

/*******************************************************--TB PACIENTE --******************************************************************/
create table tb_paciente(
    pk_idpaciente int primary key not null auto_increment,
    nome_paciente varchar(100) not null,
    tel_paciente varchar(20),
    convenio varchar(50),
    end_paciente varchar(100),
    data_nasc datetime
);

describe tb_paciente;
select * from tb_paciente;

insert into tb_paciente
(nome_paciente, tel_paciente, convenio, end_paciente, data_nasc) value
('Mariana Coletes Castilho', '11 90707-0707', 'unimed', 'Rua seis', '2000-02-08 12:40:35'),
('Ingrith Kozen', '11 90707-0707', 'mais med', 'Rua nove', '1884-09-15 00:40:25'),
('Tulio Pontes Nacaratti', '11 90707-0707', 'med top', 'Rua noventa', '1886-11-01 03:15:55');

/*******************************************************--TB CONSULTA --******************************************************************/
create table tb_consulta(
    pk_idconsulta int primary key not null auto_increment,
    data_consulta datetime,
    exame_consulta varchar(255),
    fk_pk_idmed int,
    fk_pk_idpaciente int,
    fk_pk_idRecMed int,
    
    foreign key (fk_pk_idmed) references tb_medico(pk_idmed),
	foreign key (fk_pk_idpaciente) references tb_paciente(pk_idpaciente),
    foreign key (fk_pk_idRecMed) references tb_receitaMed(pk_idRecMed)
   
);

drop table tb_consulta;
describe tb_consulta;
select * from tb_consulta;

insert into tb_consulta
(data_consulta, exame_consulta) value
('2023-11-04 08:30:00', 'tomografia'),
('2023-11-07 09:30:00', 'Exame de sangue'),
('2023-11-08 07:30:00', 'fisioterapia');

show tables; /*mostra todas as tabelas do meu BD*/
desc tb_paciente; /*mostra todos os campos da entidade*/



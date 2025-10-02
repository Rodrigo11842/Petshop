create database pet_shop;

use pet_shop;

create table Cliente (
cpf varchar(14) primary key,
nome varchar(50) not null,
sobrenome varchar(50),
telefone varchar (15)
);

create table PET(
id_pet int (50),
raca varchar (20),
nome varchar (10),
cpf_cliente varchar (15) Not null,
primary key (cpf_cliente,nome),
foreign key (cpf_cliente) references Cliente(cpf)
);

create table funcionario(
id int (20) primary key,
salario int (255),
nome varchar (10)
);

create table atendimento(
id_funcionario int (15) not null,
cpf_cliente varchar(15) not null,
data_atendimento datetime not null,
primary key (id_funcionario,cpf_cliente,data_atendimento),
foreign key (cpf_cliente) references Cliente(cpf),
foreign key (id_funcionario) references funcionario(id)
);

create table veterinario(
id_funcionario int(15) primary key,
crmv varchar(15),
foreign key (id_funcionario) references funcionario(id)
);

create table atendente (
id_funcionario int(15) primary key,
setor varchar(15),
foreign key (id_funcionario) references funcionario(id)
);

create table servico(
id_servico int (15) primary key,
id_funcionario int(15) not null,
foreign key (id_funcionario) references funcionario(id)
);

create table consulta(
id_servico int (15) primary key,
valor_consulta int (18),
foreign key (id_servico) references servico(id_servico)
);

create table produto(
id_produto int(14) primary key,
nome varchar(255) not null,
preco int(255)
);

create table venda(
id_venda int (10) primary key,
cpf_cliente_atendimento varchar(14)not null,
id_funcionario_atendimento int not null,
data_atendimento datetime,
id_produto int (20) not null,
valor_venda int (50),

foreign key(cpf_cliente_atendimento,id_funcionario_atendimento,data_atendimento)
	references atendimento(cpf_cliente,id_funcionario,data_atendimento),
foreign key(id_produto) references produto(id_produto)
);


INSERT INTO Cliente (Cpf, Nome, Sobrenome, Telefone) VALUES
('11122233344', 'Ana', 'Silva', '988887777'),
('55566677788', 'Bruno', 'Santos', '977776666'),
('99900011122', 'Carla', 'Oliveira', '966665555');

INSERT INTO Produto (ID_produto, Nome, preco) VALUES
(101, 'Ração Premium - Cão'),
(102, 'Biscoito para Gato'),
(103, 'Brinquedo Bola');

insert INTO funcionario (id,salario,nome) VALUES
(1,250,'MAICON'),
(2, 250,'PEDRO'),
(3, 250,'JEOVANE');

INSERT INTO Veterinario (ID_funcionario, crmv) VALUES
(1, 'CRMV-SP 12345');

INSERT INTO atendente (id_funcionario, setor) VALUES
(2, 'balcao'),
(3, 'Banho');

INSERT INTO servico (id_servico, Tipo_servico, ID_funcionario) VALUES
(201, 'Consulta de Rotina', 1),
(202, 'Banho Completo', 3),
(203, 'Tosa Higiênica', 3);


INSERT INTO Pet (cpf_cliente, nome, raca, id_pet) VALUES
('11122233344', 'Rex', 'Labrador', 1),
('11122233344', 'Mimi', 'Siamês', 2),
('55566677788', 'Thor', 'Pastor Alemão', 3);

INSERT INTO Atendimento (cpf_cliente, ID_funcionario, Data_atendimento) VALUES
('11122233344', 1, '2025-10-01 10:00:00'),
('55566677788', 3, '2025-10-01 14:30:00'),
('11122233344', 3, '2025-10-02 09:00:00');

INSERT INTO Venda (id_venda, id_produto, cpf_cliente_atendimento, id_funcionario_atendimento, data_atendimento, valor_venda) VALUES
(301, 101, '11122233344', 1, '2025-10-01 10:00:00', 120.00),
(302, 103, '55566677788', 3, '2025-10-01 14:30:00', 8.90);

SELECT * FROM Cliente;

SELECT id, nome, salario FROM funcionario;


SELECT nome, sobrenome, telefone FROM Cliente
WHERE cpf = '11122233344';

SELECT
    C.nome AS 'Nome do Cliente',
    C.telefone AS 'Telefone do Cliente',
    P.nome AS 'Nome do Pet',
    P.raca AS 'Raça do Pet'
FROM
    Cliente C
JOIN
    PET P ON C.cpf = P.cpf_cliente
ORDER BY
    C.nome;
    
    SELECT
    F.nome AS 'Nome do Veterinário',
    V.crmv AS 'CRMV'
FROM
    funcionario F
JOIN
    veterinario V ON F.id = V.id_funcionario;






















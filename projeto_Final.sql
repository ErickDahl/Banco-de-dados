Create DataBase Loja_Departamento
Go

Use Loja_Departamento
Go

create table Funcionarios 
(
	idFuncionario int Identity not null primary key,
	NomeFuncionario VarChar(100) not null, 
	CPFFuncionario Char(11) not null,
	Salario float not null
)
go

create table Categoria
(
	idCategoria int identity not null primary key,
	NomeCategoria varchar(20) not null,
)

create table Produtos
(
	idProduto int Identity not null primary key,
	NomeProduto VarChar(50) not null,
	QuantidadeEstoque int not null default 0,
	DatadeFabricacao date not null,
	ValorUnitario float not null,
	DataCadastro date default getdate(),
	CategoriaProduto int references Categoria (idCategoria),
	CadastradoPor int references funcionarios (idFuncionario)
)
go

create table Endereco
(
	idEndereco int identity not null primary key,
	Logradouro varchar(100),
	Numero int,
	Complemento varchar(20),
	Bairro varchar(50),
	Cidade varchar(50),
	UF char(2),
)
go

create table Clientes
--Pesquisar como limitar tamanho minimo e maximo de senhas
(
	idCliente int Identity not null primary key,
	NomeCliente varchar (100) not null,
	Usuario varchar (20) not null,
	Senha varchar (10) not null,
	CPFCliente Char(11) not null,
	email varchar(50),--not null
	dataNascimento date not null,
	Telefone varchar (11),-- not null,
	EnderecoCliente int references Endereco(idEndereco)
)
go

Create Table Pedido(
	idPedido Int Primary Key Identity,
	idCliente int references Clientes(idCliente) On Delete Cascade,
	DataPedido date default getDate()
)
Go
-- Ver nescessidade
Create Table PedidoItem(
	idPedidoItem int Primary Key identity,
	Idpedido int references Pedido(idPedido) On Delete Cascade,
	idProduto int references Produtos(idProduto), -- Quero multiplicar isso pelo valor de produtos
	Quantidade int not null
)
go
--############## Inser��es

-- Inserindo na tabela funcion�rios 
Insert Into Funcionarios 
Values('Fulaninho' , 14369835278, 1000),
	('Ciclaninho' , 14314252783, 2000), 
	('Pedro' , 15614252365, 1500.50), 
	('Thiago' , 98744252732, 2000),
	('Joana' , 20314252300, 2000)

-- Inserindo na tabela Categoria
Insert Into Categoria 
Values('Frutas'),('Ferramentas'),('Carnes'),('Eletronicos'),('Software')
--		1				2			3				4			5
-- Inserindo na tabela Produtos
Insert Into Produtos (NomeProduto,QuantidadeEstoque,DatadeFabricacao,ValorUnitario,DataCadastro,CategoriaProduto,CadastradoPor)
			Values('Pera', 12,'2020-07-23', 10.30, '2020-07-23', 1 ,1 ),
				  ('Ferramentas', 12,'1990-05-09', 60.30, '2020-01-15', 2 ,2 ),
				  ('Software', 12,'2019-06-19', 268.41, '2012-02-23', 5 ,3 ),
				  ('Software', 12,'1990-05-25', 49000.99, '2020-05-04', 5 ,4 ),
				  ('Eletronicos', 12,'2018-12-04', 2356.00, '2020-06-01', 4 ,5 )

-- Inserindo na tabela Endereco
insert Endereco (Logradouro, Numero, Complemento, Bairro, Cidade, UF)
Values ('Rua das Amoras', 50, 'Apto 101', 'Araras', 'Teresopolis', 'RJ'),
	   ('Rua das Flores', 505, 'Apto 256', 'Barra', 'Friburgo', 'RJ'),
	   ('Rua das Arvores', 41, 'Apto 304', 'Alto', 'Bahia', 'BH'),
	   ('Rua das Peras', 96, 'Casa', 'Barra', 'Petropolis', 'RJ'),
	   ('Rua das Ropas', 1, 'Casa', 'Centro', 'Teresopolis', 'RJ')

-- Inserindo na tabela Clientes
insert Clientes (NomeCliente, Usuario, Senha, CPFCliente, email, dataNascimento, telefone, EnderecoCliente)
values ('Roberval Da Costa', 'RobCosta', '12345609','50236642087','robcosta@tmail.com','1980-04-02','2135678542', 1),
	   ('Roberson', 'Roberson123', '12345609', '32165498712', 'roberson123@gmail.com', '1978-07-27', '2199856471',1),
	   ('Renata Sobral', 'Rezinha79', '56804909','87485612734','resobralgmail.com','1979-09-15','21999768547', 4),
	   ('Caio de Moraes', 'CaioPlayer', '190900', '74169354832', 'caiomoraes@gmail.com', '1999-02-18', '21985744582', 2),
	   ('Lais Nobrega', 'LalaNobrega','000111', '98745632185', 'lalanobrega@gmail.com', '2002-07-06', '11965453287', 3)

-- Inserindo na tabela Pedidos
Insert Into Pedido(idCliente) Values(2),(1),(3),(4),(5)

-- Inserindo na tabela PedidosItens

Insert Into PedidoItem(Idpedido, idProduto, Quantidade)  
Values (1, 1, 13),(2, 2, 5),(3, 3, 10),(4, 4, 2),(5, 5, 8)


--############## 

Select*From Clientes
Select*From Funcionarios
Select*From Produtos
Select*From PedidoItem
Select*From Pedido
Select*From Endereco

---------------------------
--4)a)
Select 
    P.NomeProduto,
    C.NomeCategoria,
    F.NomeFuncionario
From 
    Produtos P Inner Join Categoria C on (P.idProduto = C.idCategoria)
               Inner Join Funcionarios F on (P.idProduto = F.IdFuncionario)

--4)b)

Select
	P.idPedido,
	C.NomeCliente,
	C.Telefone
From
	Pedido P Inner Join Clientes C on (P.idPedido = C.idCliente)

--4)c)

Select 
	P.idPedido,
	C.NomeCliente,
	P.DataPedido,
	Pr.NomeProduto,
	P_I.Quantidade
From
	Pedido P Inner Join PedidoItem P_I on (P.idPedido = P_I.idProduto)
			 Inner Join Clientes C on (P.idPedido = C.idCliente)
			 Inner Join Produtos Pr on (P.idPedido = Pr.idProduto)

--4)d)

Select 
	C.NomeCliente,
	Count(*) as TotalPedidos

From
	Clientes C Inner Join Pedido P on (C.idCliente = P.idCliente)
	Group By C.NomeCliente
	Order By C.NomeCliente

--5)a)

Update Funcionarios Set Salario = Salario + 500

--5)b)

Update Clientes Set email = 'robcosta@gmail.com' , Telefone = '2135678535' Where idCliente = 1

--6)

Delete From Clientes Where email Not Like '%@%' Or  Len(Senha) < 8

 
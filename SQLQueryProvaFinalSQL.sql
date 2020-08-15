Create Database LojaDeDepartamentos
Go

Use LojaDeDepartamentos

Create Table Funcionarios 
(
IdFuncionario Int Identity not null Primary Key,
NomeFuncionario VarChar(100) not null, 
CPFFuncionario Char(11) not null,
Salario Float not null
)
Go

Create Table Categorias
(
IdCategoriaProduto Int Identity not null Primary Key,
NomeCategoria VarChar(20) not null,
)
Go

Create Table Enderecos
(
IdEnderecoCliente Int Identity not null Primary Key,
Logradouro VarChar(100) not null,
Numero Int not null,
Complemento VarChar(20) not null,
Bairro VarChar(50) not null,
Cidade VarChar(50) not null,
UF Char(2) not null,
)
Go

Create Table Clientes
(
IdCliente Int Identity Primary Key,
NomeCliente VarChar (100) not null,
LoginCliente VarChar (20) not null,
Senha Char(15) not null,
CPFCliente Char(11) not null,
Email VarChar(50) not null,
DataNascimento Date not null,
Telefone Char (11) not null,
IdEnderecoCliente Int not null References Enderecos(IdEnderecoCliente)
)
Go

Create Table Produtos
(
IdProduto Int Identity not null Primary Key,
NomeProduto VarChar(50) not null,
ValorUnitario Float not null,
DataCadastro Date Default GetDate(),
IDCategoriaProduto Int not null References Categorias(IdCategoriaProduto),
IdFuncionario Int not null References Funcionarios(IdFuncionario)
)
Go

Create Table Estoque
(
IdProduto Int not null References Produtos(IdProduto),
QuantidadeProduto Int not null,
DataDeFabricacao Date not null,
)
Go

Create Table Pedidos
(
IdPedido Int Identity not null Primary Key,
IdCliente Int not null References Clientes(IdCliente),
DataPedido Date not null Default GetDate()
)
Go

Create Table PedidoItem
(
IdPedidoItem Int Identity not null,
IdPedido Int not null References Pedidos(IdPedido),
IdProduto Int not null References Produtos(IdProduto),
QuantidadeItens Int not null Default 1,
)
Go

-- Inserindo na tabela funcion�rios 
Insert Into Funcionarios 
Values('Flavio' , '14369835278', 1000),
		 ('Ciro' , '14314252783', 2000), 
	     ('Pedro' , '15614252365', 1500.50), 
	     ('Thiago' , '98744252732', 2000),
	     ('Joana' , '20314252300', 2000),
		 ('Debora', '45865412377', 1500.50)

-- Inserindo na tabela Categorias
Insert Into Categorias 
Values('Bebidas'),('CamaMesaBanho'),('Eletrodomesticos'),('Eletronicos'),('Alimentos'),('HortiFruti')
--		   		1				    	2		        		3		            			4				    5					6

-- Inserindo na tabela Enderecos
Insert Enderecos (Logradouro, Numero, Complemento, Bairro, Cidade, UF)
Values ('Rua das Amoras', 50, 'Apto 101', 'Araras', 'Teresopolis', 'RJ'),
		  ('Rua das Flores', 505, 'Apto 256', 'Barra', 'Friburgo', 'RJ'),
	      ('Rua das Arvores', 41, 'Apto 304', 'Alto', 'Salvador', 'BA'),
	      ('Rua das Peras', 96, 'Casa', 'Barra', 'Petropolis', 'RJ'),
	      ('Rua das Rosas', 1, 'Casa', 'Centro', 'Teresopolis', 'RJ'),
		  ('Rua das Margaridas', 232, 'Casa', 'Jacarepagu�', 'Rio de Janeiro', 'RJ'),
		  ('Rua dos Jabutis', 15, 'Bloco01, Apto 302', 'Moema', 'S�o Paulo', 'SP')

-- Inserindo na tabela Produtos
Insert Into Produtos (NomeProduto, ValorUnitario, DataCadastro, IdCategoriaProduto, IdFuncionario)
	 Values ('Garrafa_de_Vinho', 30.90, '2020-07-23', 1 , 1),
			   ('Jogo_de_Toalhas', 99.50, '2020-06-15', 2 , 3),
			   ('Geladeira',  968.40, '2020-03-23', 3 , 5),
			   ('Software', 89.99, '2020-04-04', 4 , 2),
			   ('Feijao_Kg', 6.30, '2020-06-29', 5 , 4),
			   ('Linguica_Kg', 12.99, '2020-06-20', 5, 2),
			   ('Banana_Kg', 3.99, '2020-07-24', 6, 4)

-- Inserindo na tabela Estoque
Insert Into Estoque (IdProduto, QuantidadeProduto, DataDeFabricacao)
Values (1, 50, '2020-03-23'),
		  (2, 25, '2020-05-09'),
		  (3, 12, '2020-02-19'),
		  (4, 15,'2020-01-25'),
		  (5, 100, '2020-06-14'),
		  (6, 30, '2020-06-09'),
		  (7, 35, '2020-07-23')

-- Inserindo na tabela Clientes
Insert Clientes (NomeCliente, LoginCliente, Senha, CPFCliente, Email, DataNascimento, Telefone, IdEnderecoCliente)
Values ('Roberval Da Costa', 'RobCosta', 'Rob123','50236642087','robcosta@tmail.com', '1980-04-02', '2135678542', 5),
	      ('Roberson Figueiredo', 'Roberson123', '1234567890', '32165498712', 'roberson123@gmail.com', '1978-07-26', '21999856471', 1),
	      ('Renata Sobral', 'Rezinha79', 'Re1979','87485612734','resobralgmail.com', '1979-09-15','22999768547', 2),
	      ('Caio de Moraes', 'CaioPlayer', '1901901901', '74169354832', 'caiomoraes@gmail.com', '1999-02-18', '21985744582', 6),
	      ('Lais Nobrega', 'LalaNobrega','030501911', '98745632185', 'lalanobrega@gmail.com', '2002-07-06', '11965453287', 7),
		  ('Maria Lucia Fonseca', 'MariLu75', 'Marilu1975', '96874535412', 'marilufonseca@hotmail.com', '1975-04-10', '91995478524', 3),
		  ('Jose de Alencar', 'Zeca1960', '995174856', '05721786321', 'zecaalencar1960@yahoo.com.br', '1960-08-11', '24965016978', 4)

-- Inserindo na tabela Pedidos
Insert Into Pedidos(IdCliente) Values(2),(7),(4),(6),(5),(1),(3)

-- Inserindo na tabela PedidoItens
Insert Into PedidoItem(IdPedido, IdProduto, QuantidadeItens)  
Values (2, 1, 12), (7, 2, 2),(4, 3, 1),(6, 4, 2),(5, 5, 4),(1, 6, 5),(3, 7, 1)

Insert Into Pedidos(IdCliente) Values(4), (1), (7)

Insert Into PedidoItem(IdPedido, IdProduto, QuantidadeItens)
Values (8, 1, 5), (9, 7, 3), (10, 6, 5)

Select * From Funcionarios
Select * From Categorias
Select * From Produtos
Select * From Estoque
Select * From Clientes
Select * From Enderecos
Select * From Pedidos
Select * From PedidoItem

--Ex 4.a)
Select 
	P.NomeProduto,
	C.NomeCategoria,
	F.NomeFuncionario
From 
	Produtos P Inner Join Categorias C on (P.IdCategoriaProduto = C.IdCategoriaproduto)
					Inner Join Funcionarios F on (P.IdFuncionario = F.IdFuncionario)

--Ex 4.b)
Select 
	P.IdPedido,
	C.NomeCliente,
	C.Telefone
From
	Pedidos P Inner Join Clientes C on (P.IdCliente = C.IdCliente)

--Ex 4.c)
Select
	Pe.IdPedido,
	C.NomeCliente,
	Pe.DataPedido,
	P.NomeProduto,
	P_I.IdPedidoItem,
	P_I.QuantidadeItens
From
	Pedidos Pe Inner Join PedidoItem P_I on (Pe.IdPedido = P_I.IdPedido)
					Inner Join Clientes C on (Pe.IdCliente = C.IdCliente)
					Inner Join Produtos P on (P_I.IdProduto = P.IdProduto)

--Ex 4.d)
Select
	C.IdCliente,
	C.NomeCliente,
	Count(*) as Total
From 
	Clientes C Inner Join Pedidos P on (C.IdCliente = P.IdCliente)
Group By
	C.IdCliente,
	C.NomeCliente
Order By 
	C.NomeCliente asc

--Ex 5.a)
Update Funcionarios Set Salario = Salario + 500

Select Salario From Funcionarios

--Ex 5.b)
Update Clientes Set Email = 'robcosta@gmail.com', Telefone = '21987456321' Where IdCliente = 1

Select * From Clientes

--Ex 6)
Alter Table Pedidos NoCheck Constraint All

Delete From Clientes Where (Email not Like '%@%') or (Len(Senha) < 8)

Alter Table Pedidos Check Constraint All

Select * From Clientes
Select * From Pedidos

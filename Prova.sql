CREATE DATABASE teste


CREATE TABLE Aluno
(
    IdMatricula int IDENTITY NOT NULL, 
    Nome VARCHAR(100)
)

INSERT Into Aluno (Nome) VALUES ('Erick')
INSERT Into Aluno (Nome) VALUES ('Tainara')

SELECT * FROM Aluno


CREATE TABLE Pessoa
(
    Nome VARCHAR(100),
    EstadoCivil VARCHAR(20) DEFAULT 'Solteiro'
)

INSERT Into Pessoa (Nome) VALUES ('Erick')

SELECT * FROM Pessoa

Create Table Produto
(
IdProduto int Identity not null Primary Key,
Nome VarChar(100) not null,
DataCadastro Date,
QuantidadeEmEstoque int,
)

Insert Into Produto Values ('Leite em pó', '2020-07-15', 5)
Insert Into Produto Values ('Leite em pó', '2030-07-15', 6)
Insert Into Produto Values ('Leite em pó', '2030-07-15', 7)
Insert Into Produto (Nome,DataCadastro, QuantidadeEmEstoque) Values ('Leite em pó','2030-07-15', 7)
Insert Into Produto (Nome,DataCadastro) Values ('Leite em pó','2030-07-15')
Insert Into Produto Values ('Leite,em,pó', '2030-07-15', 7)



SELECT * FROM Produto

SELECT * FROM Produto WHERE (Nome = 'Leite em pó') AND (QuantidadeEmEstoque > 5)

UPDATE Produto SET QuantidadeEmEstoque = 10 WHERE QuantidadeEmEstoque is NULL

Delete From Produto Where Nome like '%,%'
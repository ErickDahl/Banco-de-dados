Create Table Alunos
(
 NumeroMatriculaAluno int Identity not null Primary Key, 
 Nome VarChar(100) not null, 
 DataNascimento Date,
 CPF Char(11) null 
)

Create Table Livros
(
 CodigoLivro int not null Primary Key, 
 NomeLivro VarChar(50) not null
)

Create Table Emprestimo
(
 CodigoEmprestimo int Identity not null Primary Key, 
 NumeroMatriculaAluno int not null References Alunos (NumeroMatriculaAluno),
 CodigoLivro int not null References Livros (CodigoLivro),
 DataEmprestimo Date not null Default GetDate()
)

Create Table Editora
(
 CodigoEditora int not null Primary Key,
 Nome          VarChar(50) not null
)

Alter Table Livros Add NomeAutor VarChar(100)
Alter Table Livros Add DataLancamento Date
Alter Table Livros Add CodigoISBN int not null


Alter Table Livros Alter Column NomeLivro VarChar(120) not null
Alter Table Livros Add CodigoEditora int not null References Editora (CodigoEditora)

Alter Table Alunos Add Logradouro VarChar(100)
Alter Table Alunos Add NumeroLogradouro VarChar(10)
Alter Table Alunos Add Complemento VarChar(50)
Alter Table Alunos Add Bairro VarChar(50)
Alter Table Alunos Add Cidade VarChar(50)

Alter Table Emprestimo Add DataEntrega Date not null

Insert Into Alunos (Nome, DataNascimento) Values ('Alfredo', '1980-07-20')
Insert Into Alunos (Nome, DataNascimento) Values ('Gilberto', '1984-07-15')

Insert Into Alunos (Nome, DataNascimento)
Values ('Astolfo', '1990-05-31'), ('Espiriquidiberto', '1982-10-25'), ('Gertrudes', '1983-01-18')

Insert Into Editora (CodigoEditora, Nome) Values (100, 'Editora 1'), (200, 'Editora 2')

Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN, CodigoEditora)
Values
  (8, 'Livro 1', 354897, 100), (14, 'Livro 2', 546578, 100), (1589, 'Livro 3', 15869, 200)


Insert Into Emprestimo (NumeroMatriculaAluno, CodigoLivro, DataEntrega)
Values (3, 8, '2020-07-27')


Insert Into Emprestimo (NumeroMatriculaAluno, CodigoLivro, DataEmprestimo, DataEntrega)
Values (3, 8, '2020-07-20', '2020-07-24')

Alter Table Livros Alter Column CodigoEditora int null

Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN) 
Values (98658, 'Livro 5', 548)

Insert Into Alunos (Nome, Bairro) Values ('Astolfo', 'Araras')

Update Alunos Set CPF = '09284539852' Where Nome = 'Gilberto'
Update Alunos Set CPF = '09284539589', Logradouro = 'Rua da Taquara', Bairro = 'Centro' Where Nome = 'Astolfo'
Update Alunos Set CPF = '12345678901' Where NumeroMatriculaAluno = 5

Update Alunos Set Cidade = 'Petropolis'
Update Alunos Set Cidade = 'Friburgo' Where NumeroMatriculaAluno in (1,3,5)

Update Alunos Set Bairro = 'Centro'
Update Alunos Set Bairro = 'Olaria' Where NumeroMatriculaAluno = 1
Update Alunos Set Bairro = 'Itaipava' Where NumeroMatriculaAluno = 4

Select * From Alunos
Select * From Editora
Select * From Emprestimo
Select * From Livros

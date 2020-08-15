-- Selecione <todas as colunas> da tabela <tabela tal>
Select * From Alunos
Select * From Editora
Select * From Livros
Select * From Emprestimo

Select * From Livros
Select NomeLivro, NomeAutor From Livros

-- Aqui vai dar erro porque a quantidade de valores mencionados � diferente da quantidade de colunas da tabela
-- Obs.: Lembrar que a coluna Indenty "nunca" pode ser usada num Insert
Insert Into Emprestimo Values (3, 8)

-- Esse vai funcionar (sem data do empr�stimo - porque temos um Default na coluna)
Insert Into Emprestimo (NumeroMatriculaAluno, CodigoLivro, DataEntrega)
Values (3, 8, '2020-07-27')

-- Esse vai funcionar (com a data do empr�stimo, porque quisemos us�-la)
Insert Into Emprestimo (NumeroMatriculaAluno, CodigoLivro, DataEmprestimo, DataEntrega)
Values (3, 8, '2020-07-20', '2020-07-24')

Select * From Emprestimo
----------------------------------------------------------------------

Select * From Alunos

/* COMANDO DE ATUALIZA��O - Update */

-- Atualiza <NomeTabela> Jogando para <CampoDestino> o conte�do (se quiser, filtre os registros)
Update Alunos Set CPF = '09284539852' Where Nome = 'Gilberto'
Update Alunos Set CPF = '09284539589', Logradouro = 'Rua da Taquara', Bairro = 'Centro' Where Nome = 'Astolfo'
Update Alunos Set CPF = '12345678901' Where NumeroMatriculaAluno = 5

Update Alunos Set Cidade = 'Petr�polis'
Update Alunos Set Cidade = 'Friburgo' Where NumeroMatriculaAluno in (1,3,5)

Update Alunos Set Bairro = 'Centro'
Update Alunos Set Bairro = 'Olaria' Where NumeroMatriculaAluno = 1
Update Alunos Set Bairro = 'Itaipava' Where NumeroMatriculaAluno = 4


/*
Null
Null ou vazio
Count
Max
Min
Adicionar dia
Busca Parcial
*/

Select * From Alunos

-- Operadores simples
Select * From Alunos Where NumeroMatriculaAluno = 3
Select * From Alunos Where DataNascimento >= '1984-07-15'
Select * From Alunos Where DataNascimento > '1984-07-15'
Select * From Alunos Where DataNascimento <= '1984-07-15'
Select * From Alunos Where DataNascimento < '1984-07-15'

-- Trabalhando com nulo
Select * From Alunos Where CPF is null
Select * From Alunos Where CPF is not null

-- Operadores And e Or
Select * From Alunos Where (DataNascimento <= '1984-07-15') and (CPF is null)
Select * From Alunos Where (DataNascimento < '1982-01-01') or (CPF is null)

-- Fun��es de data (ano, m�s, dia)
Select * From Alunos Where Year(DataNascimento) <= '1983'
Select * From Alunos Where Month(DataNascimento) = '07'
Select * From Alunos Where Day(DataNascimento) = '18'

-- Count -> Quantidade de registros
Select Count(*) From Alunos
Select Count(*) as QuantidadeAlunos From Alunos
Select Count(*) as [Quantidade de Alunos] From Alunos
Select Count(*) From Alunos Where CPF is not null

-- Pegando o menor e o maior valor
Select Min(DataNascimento) as MenorData From Alunos
Select Max(DataNascimento) as MaiorData From Alunos

Select
  Min(DataNascimento) as MenorData,
  Max(DataNascimento) as MaiorData
From
  Alunos

-- Buscando registros por parte de um conte�do texto (Operador LIKE)
Select * From Alunos
Select * From Alunos Where Nome like 'as%' -- Alguma coisa + coringa = Tem que come�ar com essa coisa
Select * From Alunos Where Nome like '%es' -- Coringa + alguma coisa = Tem que terminar com essa coisa
Select * From Alunos Where Nome like '%b%' -- Coringa + alguma coisa + coringa = Tem que ter, em algum lugar do texto, a "coisa" que eu pedi
Select * From Alunos Where Nome like 'Astolfo'
Select * From Alunos Where Nome = 'Astolfo'

-- Mais fun��es de texto
Select DataLength('458')
Select Len('458')
                            --1234567890123456
-- Me mostra a posi��o inicial de um texto passado por par�metro
Select CharIndex('audi�ncia', 'O documento da audi�ncia est� sobre a mesa')

-- Substitui no texto original o texto passado por par�metro por um novo texto
Select Replace('O documento da audi�ncia est� sobre a mesa', 'da audi�ncia', 'do f�rum')
Select Replace('O documento da audi�ncia est� sobre a mesa', 'da janela', 'do f�rum')


Select Replace('092.845.389-90', '.', '')
Select Replace('092.845.389-90', '-', '')

Select Replace('092.845.389-90', '-', '')
Select Replace(     Replace('092.845.389-90', '-', ''),       '.','')

---------------------------------------------------------------------------------------------

-- Come�ando a "brincar" com o Group By

Select Min(DataNascimento) as MenorData From Alunos Group by Cidade

Select Cidade, Min(DataNascimento) as MenorData From Alunos Group by Cidade
Select Cidade, Count(*) as Total From Alunos Group by Cidade

-- Pega os campos da tabela onde os registros tenham tal conte�do agrupando-os por tal campo

-- Selecione <lista_de_campos> da tabela <nome_tabela> agrupado por <campo>
Select Bairro, Count(*) as Total From Alunos Group by Bairro

-- Selecione <lista_de_campos> da tabela <nome_tabela> onde <condi��o> agrupado por <campo>
Select Bairro, Count(*) as Total From Alunos Where Cidade = 'Friburgo' Group by Bairro

Select Bairro, Count(*) as Total From Alunos Group by Bairro
Select Bairro, Cidade, Count(*) as Total From Alunos Group by Bairro, Cidade


/*
BATE-PAPO sobre Views

Create View vw_AlunosPorBairro as
Select Bairro, Count(*) as Total From Alunos Where Cidade = 'Friburgo' Group by Bairro

Select * From vw_AlunosPorBairro
*/

/*
Create View vw_AlunosDePetropolis as
Select * From Alunos Where (Cidade = 'Petr�polis')

Select * From vw_AlunosDePetropolis Where Bairro = 'Itaipava'
*/
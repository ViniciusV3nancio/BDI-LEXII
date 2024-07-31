-- 1. Crie um novo Banco de Dados denominado ListaDeExercicios2 -- 

Create Database ListaDeExercicios2
Go

-- 2. Acesse este respectivo banco de dados --

Use ListaDeExercicios2
Go

-- 3. Construa as respectivas tabelas apresentadas acima, respeitando sua estrutura de colunas, tipos de dados, tamanhos e constraints --

-- Criando a Tabela de Produtos -- 

Create Table Produtos
(CodProduto Int Not Null Primary Key Identity (1,1),
Descricao VarChar (80) Null,
DataCadastro DateTime Null Default GetDate(),
CodEstoque Int Null,
CodCategoria Int Null, 
SaldoEstoque Int Null)
Go

-- Professor, tenho uma duvida, como eu poderia colocar as colunas "CodEstoque" e "CodCategoria" serem auto numeradas ao inserir mais linhas de registro sem usar a Identity (1,1) se eu posso usar o mesmo apenas uma vez em cada tabela?

** Por padrão você não pode utilizar o Identity() em mais de uma coluna! Mas estas colunas serão as chaves estrangeiras, neste caso a numeração tem que ser definida nas tabelas de origem de cada uma delas**

-- Criando a Tabela de Categorias_Produtos --

Create Table Categoria_Produtos
(Codigo Int Not Null Primary Key Identity (1,1),
Descricao Varchar (80) Null, 
Status Varchar(80) Null)
Go

-- Criando a Tabela Estoques --

Create Table Estoques
(Codigo Int Not Null Primary Key Identity (1,1),
Descricao Varchar (80) Null, 
Situacao Varchar (80) Null,
CodigoEmpresa Int Null)
Go

-- Criando a Tabela Empresas --

Create Table Empresas
(Codigo Int Not Null Primary Key Identity (1,1),
RazaoSocial Varchar (80) Null,
CNPJ Char (14) Null,
DataCadastro DateTime Not Null Default GetDate())
Go

-- Criando a Tabela de Clientes --

Create Table Clientes
(Codigo Int Not Null Primary Key Identity (1,1),
CodEmpresa Int Null, 
Nome Varchar (80) Null,
DataCadastro DateTime Not Null Default GetDate(),
DataUltimaCompra DateTime Not Null Default GetDate(),
Situacao Varchar (80) Null,
TipoCliente Varchar (80) Null)
Go

-- Criando a Tabela de Fornecedores --

Create Table Fornecedores 
(Codigo Int Not Null Primary Key Identity (1,1),
RazaoSocial Varchar (80) Null,
CNPJ Char (14) Null)
Go

-- 4. Estabeleça o relacionamento físico entre a todas as tabelas, inclusive entre Fornecedores e Produtos (o qual não está sendo apresentado na Figura 1) --

-- Adicionando o Relacionamento Físico Entre a Tabela de Fornecedores e a Tabela de Produtos --

Alter Table Produtos
Add Constraint [FK_Fornecedores_Produtos] Foreign Key (CodEstoque)
References Fornecedores (Codigo)
Go

-- Adicionando o Relacionamento Físico Entre a Tabela de Produtos e Categoria_Produtos --

Alter Table Produtos
Add Constraint [FK_Produtos_Categoria_Produtos] Foreign Key (CodCategoria)
References Categoria_Produtos (Codigo)
Go

-- Adicionando o Relacionamento Físico Entre a Tabela de Produtos e a Tabela de Estoques --

Alter Table Produtos
Add Constraint [FK_Produtos_Codigo_Estoques] Foreign Key (CodEstoque)
References Estoques (Codigo)
Go

-- Adicionando o Relaciomento Físico Entre a Tabela de Estoques e a Tabela de Empresas -- 

Alter Table Estoques
Add Constraint [FK_CodigoEmpresa_Estoques] Foreign Key (CodigoEmpresa)
References Empresas (Codigo)
Go

-- Adicionando o Relacionamento Físico Entre a Tabela de Clientes e a Tabela de Empresas --

Alter Table Clientes
Add Constraint [FK_Clientes_CodEmp_398D8EEE] Foreign Key (CodEmpresa)
References Empresas (Codigo)
Go

-- 5. Insira de forma aleatória Dez(10) linhas de registros em cada tabela, iniciando o bloco de inserção de linhas através da tabela Fornecedores --

-- Inserindo Dez(10) Linhas de Registro na Tabela Fornecedores --

Insert Into Fornecedores (RazaoSocial, CNPJ)
Values ('Sapataria Catarro', 85247196315975),
		('Kéimaku', 85463215498753),
		('Ké Kejo', 36847213792486),
		('AssombraSom', 48621793258469),
		('Thai Tanic', 65412345789159),
		('Lord of the Rinse', 95125874125864),
		('Abra Kebabra', 35795124862534),
		('Bread Zeppelin', 99955511133375),
		('SobranSheila', 10258097501268),
		('Wesley Salgadão', 51486269802489)
Go

-- Inserindo Dez(10) Linhas de Registro na Tabela de Produtos -- 

Insert Into Produtos (Descricao, SaldoEstoque, CodEstoque, CodCategoria)
Values ('Sapato Verde de Catarro', 20, 01,100),
		('Esfrega Rego', 69, 02, 200),
		('Queijo Fumegante', 7, 03, 300),
		('JBL Assustadora', 9, 04, 400),
		('Peixe a Moda de Afundar', 3, 05, 500),
		('Lava e Seca', 1, 06, 600),
		('Cocada', 5, 06, 600),
		('Pão Sovado', 13, 07, 700),
		('Pinça', 4, 08, 800),
		('Esfirra de Frango', 23, 09,900)
Go

-- Inserindo Dez(10) Linhas de Registro na Tabela de Categoria_Produtos --
Insert Into Categoria_Produtos (Descricao, Status)
Values ('Alimento', 'Disponpível'),
		('Utensílio', 'Disponível'),
		('Alimento', 'Disponível'),
		('Utensílio', 'Disponível'),
		('Alimento', 'Disponível'),
		('Serviço', 'Disponível'),
		('Alimento', 'Disponível'),
		('Alimento', 'Disponível'),
		('Utensílio', 'Disponível'),
		('Alimento', 'Disponível')
Go

-- Inserindo Dez(10) Linhas de Registro na Tabela de Estoques --
Insert Into Estoques (Descricao, Situacao, CodigoEmpresa)
Values ('No Homocharifado A', 'Ok', 10),
		('No Homocharifado B', 'Ok', 11),
		('No Homocharifado A', 'Ok', 12),
		('No Homocharifado B', 'Ok', 13),
		('No Homocharifado A', 'Ok', 14),
		('No Homocharifado C', 'Ok', 15),
		('No Homocharifado A', 'Ok', 16),
		('No Homocharifado A', 'Ok', 17),
		('No Homocharifado B', 'Ok', 18),
		('No Homocharifado A', 'Ok', 19)
Go

-- Inserindo Dez(10) Linhas de Registro na Tabela de Empresas --
Insert Into Empresas (RazaoSocial, CNPJ)
Values ('Sakana Japanese Restaurant', 78945031742695),
		('Churrasic Park', 15974268951753),
		('Necrotério Bar', 04173982035974),
		('BomBARdeio', 12347890426857),
		('Bar do Suvaco', 86254274637419),
		('Paulo Fusos', 69542588428576),
		('Kudossi', 95483544654123),
		('Bendito Pão', 72936925471593),
		('Paul Molé', 62481357642819),
		('O Senhor dos Pastéis', 42783436025846)
Go

-- Inserindo Dez(10) Linhas de Registro na Tabela de Clientes -- 
Insert Into Clientes (Nome, Situacao, TipoCliente, CodEmpresa)
Values ('Paulo Escobar', 'Ricasso', 'Gastador', 20),
		('Heitor', 'Fálido', 'Pobre', 21),
		('Rubens', 'Professor', 'Comunista', 22),
		('Abner', 'Peão', 'Pobre', 23),
		('Fabricio', 'Empregado', 'Ancap', 24),
		('Vitor', 'Empregado', 'Parcelado', 25),
		('Allan', 'Empregado', 'Pobre', 26),
		('Caio', 'Fálido', 'Pobre', 27),
		('Vinícius', 'Fálido', 'Em Busca de Estágio', 28),
		('Cleyton', 'Burguês', 'Gastador', 29)
Go

-- 6. Consulte os dados armazenados em cada tabela para garantir que os mesmos foram inseridos corretamente --

-- Consultando os Dados da Tabela de Produtos --
Select CodProduto, Descricao, DataCadastro, CodEstoque, CodCategoria, SaldoEstoque 
From Produtos
Go

-- Consultando os Dados da Tabela de Fornecedores --
Select Codigo, RazaoSocial, CNPJ
From Fornecedores
Go

-- Consultando os Dados da Tabela de Categoria_Produtos -- 
Select Codigo, Descricao, Status
From Categoria_Produtos
Go
		
-- Consultando os Dados da Tabela de Estoques --
Select Codigo, Descricao, Situacao, CodigoEmpresa
From Estoques
Go

-- Consultando os Dados da Tabela de Empresas --
Select Codigo, RazaoSocial, CNPJ, DataCadastro
From Empresas
Go

-- Consultando os Dados da Tabela de Clientes --
Select Codigo, CodEmpresa, Nome, DataCadastro, DataUltimaCompra, Situacao, TipoCliente
From Clientes
Go

-- 7. Realize a junção entre as tabelas Estoques, Categorias_Produtos e Produtos no mesmo comando Select através do operador de junção Inner Join --
Select E.Descricao As 'Descrição do Estoque',
		C.Descricao As 'Descrição da Categoria do Produto',
		P.Descricao As 'Descrição do Produto',
		E.Situacao As 'Situação do Estoque', 
		C.Status As 'Status da Categoria do Produto', 
		P.DataCadastro As 'Data de Cadastro do Produto',
		P.SaldoEstoque As 'Quantidade de Produtos no Estoque'
From Estoques As E Inner Join Categoria_Produtos As C 
														On E.Codigo = C.Codigo
														Inner Join Produtos As P
														On E.Codigo = P.CodProduto
Go

-- 8. Através do Select realizado no passo 7 apresente somente os produtos que possuem através da coluna quantidade o valor maior que 20 --
Select E.Descricao As 'Descrição do Estoque',
		C.Descricao As 'Descrição da Categoria do Produto',
		P.Descricao As 'Descrição do Produto',
		E.Situacao As 'Situação do Estoque', 
		C.Status As 'Status da Categoria do Produto', 
		P.DataCadastro As 'Data de Cadastro do Produto',
		P.SaldoEstoque As 'Quantidade de Produtos no Estoque'
From Estoques As E Inner Join Categoria_Produtos As C 
														On E.Codigo = C.Codigo
														Inner Join Produtos As P
														On E.Codigo = P.CodProduto
														Where P.SaldoEstoque > 20
Go

-- 9. Através do Select realizado no passo 7 apresente somente os produtos que possuem através da coluna DataCadastro exclusivos valores de datas entre os dias: 2023-11-01 e 2023-11-30 --
Select E.Descricao As 'Descrição do Estoque',
		C.Descricao As 'Descrição da Categoria do Produto',
		P.Descricao As 'Descrição do Produto',
		E.Situacao As 'Situação do Estoque', 
		C.Status As 'Status da Categoria do Produto', 
		P.DataCadastro As 'Data de Cadastro do Produto',
		P.SaldoEstoque As 'Quantidade de Produtos no Estoque'
From Estoques As E Inner Join Categoria_Produtos As C 
														On E.Codigo = C.Codigo
														Inner Join Produtos As P
														On E.Codigo = P.CodProduto
														Where P.DataCadastro Between '01-11-2023' And '30-11-2023' -- Cuidado ao passar valores de data no formato em português --
Go

-- 10. Através do Select realizado no passo 7, evolua o mesmo adicionando a junções com as tabelas Empresas e Clientes. --

Select E.Descricao As 'Descrição do Estoque',
		C.Descricao As 'Descrição da Categoria do Produto',
		P.Descricao As 'Descrição do Produto',
		R.RazaoSocial As 'Nome da Empresa',
		N.Nome As 'Nome do Cliente',
		E.Situacao As 'Situação do Estoque', 
		C.Status As 'Status da Categoria do Produto', 
		P.DataCadastro As 'Data de Cadastro do Produto',
		R.CNPJ As 'Número do CNPJ',
		N.Situacao As 'Situação Financeira do Cliente',
		P.SaldoEstoque As 'Quantidade de Produtos no Estoque',
		N.TipoCliente As 'Condição da Carteira'
		


From Estoques As E Inner Join Categoria_Produtos As C 
														On E.Codigo = C.Codigo
														Inner Join Produtos As P
														On E.Codigo = P.CodProduto
														Inner Join Empresas As R
														On E.Codigo = R.Codigo
														Inner Join Clientes As N
														On E.Codigo = N.Codigo
Go

-- Copie e execute os blocos de códigos apresentados abaixo para uma “Nova Consulta” no Microsoft SQL Server Management Studio --

-- Criando a Tabela Funcao --
Create Table Funcao
(CodigoFuncao Char(3) Primary Key Not Null,
DescricaoFuncao Varchar(50) Not Null, 
ValorSalario Numeric(6,2) Not Null)
Go

-- Criando a Tabela Areas --
Create Table Areas
(CodigoArea Char(2) Primary Key Not Null,
DescricaoArea Varchar(30) Not Null,
RamalTelefone SmallInt Not Null)
Go

-- Create Table Funcionarios --
Create Table Funcionarios
(NumeroRegistro Int Primary Key Not Null,
NomeFuncionario Varchar(80) Not Null,
DtAdmissao Date Default GetDate(),
Sexo Char (1) Not Null Default 'M',
CodigoFuncao Char(3) Not Null,
CodigoArea Char(2) Not Null,
CodigoDoGestor TinyInt Not Null)
Go

-- Criando os Relacionamentos --
Alter Table Funcionarios 
Add Constraint [FK_Funcionarios_Funcaos] Foreign Key (CodigoArea)
References Areas(CodigoArea) 
Go

Alter Table Funcionarios 
Add Constraint [FK_Funcionarios_Areas] Foreign Key (CodigoArea)
References Areas (CodigoArea)
Go

-- Inserindo os Dados --
Insert Into Funcao (CodigoFuncao, DescricaoFuncao, ValorSalario)
Values ('F1', 'Aux.Vendas', 350.00), ('F2', 'Vigia', 400.00), ('F3', 'Vendedor', 800.00),
		('F4', 'Aux.Cobrança', 250.00), ('F5', 'Gerente', 1000.00), ('F6', 'Diretor', 2500.00),
		('F7', 'Diretor II', 4500.00), ('F8', 'Diretor III', 6500.00), ('F9', 'Vice-Presidente', 800.00),
		('F10', 'Presidente', 9990.00)
Go

Insert Into Areas (CodigoArea, DescricaoArea, RamalTelefone)
Values ('A1', 'Assist.Técnica', 2246), ('A2', 'Estoque', 2589), ('A3', 'Administração', 2772),
		('A4', 'Segurança', 1810), ('A5', 'Vendas', 2599), ('A6', 'Cobrança', 2688),
		('A7', 'Tecnologia', 2110), ('A8', 'Engenharia', 3499), ('A9', 'Qualidade', 4868)
Go

Insert Into Funcionarios (NumeroRegistro, NomeFuncionario, DtAdmissao, Sexo, CodigoArea, CodigoFuncao, CodigoDoGestor)
Values (101, 'Juca Sampaio', '2003-08-10', 'M', 'A3', 'F5', 22),
		(104, 'Fernando Pereira', '2004-03-02', 'M', 'A4', 'F6', 101),
		(134, 'João Alves', '2002-05-03', 'M', 'A5', 'F1', 123),
		(121, 'Paulo Souza', '2001-12-10', 'M', 'A6', 'F5', 115),
		(195, 'Maria Silveira', '2002-01-05', 'F', 'A3', 'F5', 139),
		(139, 'Ana Laura', '2003-01-12', 'F', 'A4', 'F6', 123),
		(123, 'Silvio Rocha', '2003-06-29', 'M', 'A6', 'F3', 148)
Go

Insert Into Funcionarios (NumeroRegistro, NomeFuncionario, DtAdmissao, Sexo, CodigoArea, CodigoFuncao, CodigoDoGestor)
Values (100, 'Rita Cadilac', '2004-11-15', 'M', 'A8', 'F10', 100),
		(148, 'Iolanda Aguiar', '2002-06-01', 'F', 'A5', 'F3', 195),
		(115, 'Roberto Fernandes', '2003-10-15', 'M', 'A2', 'F2', 148),
		(102, 'Sergio Noriega', '2000-02-10', 'M', 'A6', 'F6', 100),
		(203, 'Chico Dito', '2005-06-30', 'M', 'A5', 'F8', 148),
		(204, 'Maria Bonita', '2001-06-03', 'F', 'A7', 'F9', 203)
Go

-- 1. Agora, você deverá criar os blocos de códigos indicados para responder as seguintes operações: --


-- a) Deseja através de um comando Select, obter: O nome, data de admissão e sexo de todos os funcionários. --

Select NomeFuncionario, DtAdmissao, Sexo
From Funcionarios
Go

-- b) Deseja através de um comando Select, obter: Quais são os funcionários de sexo feminino? -- 
Select NomeFuncionario
From Funcionarios
Where Sexo = 'F'
Go

-- c) Deseja através de um comando Select, apresentar: As informações dos funcionários e de Funcao: Linhas de Funcionarios X Linhas de Funcao. --
Select F.NumeroRegistro, D.CodigoFuncao, F.NomeFuncionario, D.DescricaoFuncao, F.DtAdmissao, D.ValorSalario, F.Sexo, F.CodigoFuncao, F.CodigoArea, F.CodigoDoGestor
From Funcionarios F Cross Join Funcao D
Go

-- d) Deseja através de um comando Select, apresentar: A combinação de Tabelas e Linhas entre selects distintos sem repetição de dados no resultado. -- VOLTA AQUI!
Select CodigoArea, CodigoFuncao, CodigoDoGestor
From Funcionarios
Where CodigoFuncao In ('F1','F3','F5','F7','F9')

Union

Select CodigoArea, CodigoFuncao, CodigoDoGestor
From Funcionarios
Where CodigoFuncao In ('F2','F4','F6','F8','F10')


-- Aqui o mais indicado seria utilizar o comando Intersect para este exemplo --

-- e) Deseja através de um comando Select, obter: Todas as funções existentes na tabela Funcao que não possuam funcionários cadastrados. -- Existe em Funções e não Existe Funcionário
Select DescricaoFuncao, CodigoFuncao From Funcao
Where CodigoFuncao Not In (Select CodigoFuncao From Funcionarios)
Go


-- 1. Realize o processo de importação do arquivo Banco de Dados I – Lista de Exercícios II – Queimadas 2022.txt, para o Banco de Dados ListaDeExercicios2, criando a tabela Queimadas2022; --
Select DataHora, Satelite, Pais
From Queimadas2022
Go

-- 2. Defina a coluna chave primária --

-- Adicionando a Coluna CodigoQueimada na Tabela de Queimadas 2022 --

Alter Table Queimadas2022
Add CodigoQueimada Int Identity (1,1)
Go

-- Transformando a Coluna CodigoQueimada em Chave Primária --
Alter Table Queimadas2022
Add Constraint PK_CodigoQueimada_Queimadas2022 Primary Key (CodigoQueimada)
Go

-- 3. Remova as fisicamente as colunas: Pais, Precipitacao e Satelite -- 
Alter Table Queimadas2022
Drop Column Pais, Precipitacao, Satelite
Go

-- 4. Altere o tipo de dados da coluna DataHora para DateTime --

-- Convertendo o Tipo de Dado de "nvarchar" para DateTime --
Update Queimadas2022
Set DataHora=CONVERT(DateTime, DataHora, 102)
Go

Alter Table Queimadas2022
Alter Column DataHora DateTime Not Null
Go

-- 5. Adicione três novas colunas computadas denominadas Dia, Mês e Ano com base na coluna DataHora --
Alter Table Queimadas2022
 Add Ano As Year(DataHora),
         Mes As Month(DataHora),
		 Dia As Day(DataHora)
Go

-- 6. Através do comando Select em conjunto com uma função de agregação específica para contagem de dados, identifique a quantidade correta de linhas importadas: 195844 --
Select Count(CodigoQueimada) As 'Numero de Linhas' From Queimadas2022
Go

-- 7. Através do comando Select em conjunto com a cláusula Group By, realize o agrupamento de dados apresentando seu resultado similar a Figura 3 apresentada abaixo:
Select F.Mes, F.Estado, F.Municipio, F.Bioma, Count(Distinct F.RiscoFogo) As TotalDeQueimadas
From Queimadas2022 F
Where MONTH(F.DataHora) > = 1
Group By F.Mes, F.Estado, F.Municipio, F.Bioma
order by F.Mes, F.Estado, F.Municipio Desc
Go

-- 8. Através do comando Select em conjunto com a cláusula Group By Grouping Sets, vamos criar conjunto de agrupamento de valores e seus respectivos totais, desta forma responda as questões abaixo: --
Select Estado, Municipio, Bioma, COUNT(*) As TotalDeQueimadas -- Evite utilizar o * --
From Queimadas2022
Where Estado In ('Goias', 'Mato Grosso') Or Municipio In ('Monteiro', 'Rubelita') Or Bioma = 'Cerrado'
Group By Grouping Sets 
(
(Estado), (Municipio), (Bioma)
)
Order by Municipio Asc

-- a. Total de focos de queimadas para o estado de Goiás: 4651; --
-- b. Total de focos de queimadas para o estado do Mato Grosso: 28702; --
-- c. Total de focos de queimadas para o município de Monteiro: 17; --
-- d. Total de focos de queimadas para o município de Rubelita: 37; e -- 
-- e. Total de focos de queimadas para o bioma de Cerrado: 55341; --


** Você poderia ter resumido da seguinte forma: --
Select Case 
	When Estado Is Not Null Then Estado
	When Municipio IS NOT NULL Then Municipio
	When Bioma IS NOT NULL Then Bioma
	End As Categoria,
Count(CodigoQueimada) AS 'Total de Focos de Queimadas' -- Cuidado ao usar o * --
From Queimadas2022
Group By Grouping Sets ((Estado), (Municipio), (Bioma))
Having Estado In ('Goias', 'Mato Grosso') Or 
	   Municipio In ('Monteiro', 'Rubelita') Or 
	   Bioma = 'Cerrado'
Go





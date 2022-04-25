# Pset 1
Este subdiretório foi utilizado para documentar a resolução do primeiro problem set da disciplina
## Arquivos
### diagramaarchitect1.architect
Este arquivo consiste no código do diagrama que recebi para trabalhar nesse pset, que pode ser visto também na imagem Esquemaimagem.png, no subdiretório imagens.
### htmlarchitect1.html
Código HTML que representa as tabelas do banco esquematizado pelo diagrama.
### diagramaarchitectcorrigido.architect
Este arquivo consiste no código do diagrama após eu tê-lo alterando, visando acertar os erros que o mesmo apresentava.
### htmlarchitectcorrigido.html
Código HTML que representa as tabelas do banco esquematizado pelo diagrama corrigido.
### script PostgreSQL
Texto do script utilizado para criar o banco de dados UVV esquematizado no diagrama corrigido utilizando o SGBD PostgreSQL em um máquina virtual Linux.
### script MariaDB
Texto do script utilizado para criar o banco de dados UVV esquematizado no diagrama corrigido utilizando o SGBD MariaDB em um máquina virtual Linux.
## Afinal, quais correções eu fiz?
- Remover a restrição NOT NULL da coluna cpf_supervisor da tabela Funcionário, visando permitir que os dados do Jorge, funcionário que não possuí supervisor algum, sejam inseridos, com um NULL nessa coluna.
- Remover a coluna numero_departamento da tabela Funcionário, já que esta conceitualmente deveria ser uma FK da tabela departamento, mas caso fosse criaria um looping, já que essa tabela também tem uma fk que interage com a tabela Funcionário e ambas são NOT NULL, fazendo com que não se pudesse inserir os dados de uma tabela sem ter inserido o da outra. Para acertar isso, criei uma coluna substitúta, chamada de numero_departamento_do_funcionario, colocando ela na tabela Trabalha_Em, a qual não criaria um looping mas ainda permitiria a vizualização do departamento de determinado funcionário.
- Remover a restrição NOT NULL da coluna horas da tabela Trabalha_Em, visando permitir que os dados do Jorge, funcionário que não possuí um valor em horas, sejam inseridos, com um NULL nessa coluna.

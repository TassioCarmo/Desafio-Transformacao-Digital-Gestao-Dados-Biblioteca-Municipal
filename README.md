# Desafio Transformação Digital e Gestão de Dados da Biblioteca Municipal

## Cliente e Contexto

A Biblioteca Municipal do Estado foi inaugurada pelo governo, em 11 de dezembro de 1988. Inicialmente, atendia a zona central do município pela pequena quantidade de obras que tinha, mas o acervo inicial foi ampliado com a colaboração de várias entidades e cidadãos e hoje seu acervo ultrapassa mais de vinte mil obras e revistas.

A Biblioteca expandiu seu acervo e seus serviços. Foram criados os setores circulantes para o público infanto-juvenil e adulto, onde os mesmo poderiam ter um maior contato com as obras incentivando a leitura da população. O projeto de informatização foi totalmente implantado em 1999. No mesmo ano, foi instalada a sala de internet, com computadores para acesso à internet.

Em razão da necessidade de um local melhor que atendesse a grande quantidade de usuários e o aumento do acervo, a biblioteca mudou de local e hoje está em um lugar mais adequado, o espaço passou por reforma e planejamento arquitetônico e foi inaugurada no dia 22 de setembro de 2012.

Com a Biblioteca reformada nos contrataram para criar uma Base de Dados com informações cadastrais do acervo, usuário, funcionário, empréstimo e reserva. Esses dados eram armazenados em arquivos de pastas suspensas e com isso a biblioteca não tinha um controle eficiente das informações, a consulta do acervo, controle de reserva e empréstimo eram feitos manualmente.

A Biblioteca trabalha com um sistema de empréstimo de livros no qual o usuário pode reservar ou retirar diversos livros para utilizar em um tempo determinado, caso a devolução seja feita depois da data estipulada a pessoa  deverá pagar uma multa por atraso.

Para que pudéssemos realizar o projeto a equipe da Biblioteca nos entregou o modelo lógico ao lado e o arquivo excel –”dados_biblioteca.csv” contendo as informações a serem inseridas na Base de Dados.

![image](https://github.com/user-attachments/assets/5996aff6-5cb9-4f71-9c0e-e0be6868b986)

## ESCOPO

Durante a negociação do projeto, ficou acordado que faremos: a melhor modelagem física baseada no modelo logico entregue,  carga dos dados reduzidos do arquivo excel (em anexo), a criação da 1ª versão do dicionário de dados e os SQLs para as seguintes solicitações: 


- 1. A Diretora Camilla Prado solicitou uma pesquisa que informe todas as obras cadastradas no acervo ordenadas por data de publicação.
- 2. O Governador vai doar duzentos livros para a Biblioteca, mas só irá doar se a biblioteca tiver menos de 300 obras. O Gerente Márcio Tales solicitou que fosse feita a contagem de quantas obras a Biblioteca possui atualmente.
- **3. A Gerência solicitou uma pesquisa para saber quais datas ocorreram empréstimos de livros e a quantidade emprestada. A consulta deverá retornar apenas um registro para cada data.**
- 4. O Funcionário João Paulo Assistente de RH solicitou uma pesquisa que informasse todos os empréstimos que a Recepcionista Alice Meire fez no horário das 8hs as 9hs.
- 5. A Diretoria solicitou uma pesquisa sobre devolução de livros entre as datas 29/03/2012 a 02/02/2013.
- 6. A Gerência solicitou uma pesquisa para saber quais reservas de livros que foram feitas com data maior  ou igual a 18/08/2011 que ainda possuem o status de “reservado”.
- 7. A área de RH solicitou uma pesquisa para saber quais devoluções de livros  foram feitas antes de 29/03/2012.
- 8. A Gerência solicitou uma pesquisa para saber quais obras existem no acervo que são diferentes dos títulos das obras ‘O Conde de Monte Cristo’ e ‘Filhos e Amantes’
- 9. O Funcionário João Paulo solicitou uma pesquisa para saber quantas obras do gênero ‘Ficção’ existem no acervo.
- 10. A Diretoria solicitou uma pesquisa para identificar qual o livro possuiu a maior quantidade em estoque, incluir respectiva editora e o respectivo autor.
- 11. O Financeiro precisa saber qual é o livro  que possui a menor quantidade em estoque e quantas vezes ele foi emprestado para que seja feita uma analise para compra de mais alguns exemplares.
- 12. A área de RH precisa identificar a quantidade total dos empréstimos feitos por cada funcionário ativos.
- 13. A Diretoria identificar as obras com os maiores números de publicações agrupados por gênero.
- 14. A Funcionária Alice Meire solicitou a alteração da obra ‘Discurso do Método’ para o gênero Político.
- 15. A Recepcionista Alice Meire solicitou a alteração do bairro do usuário ‘Alberto Roberto’ que morava no ‘IAPI’  e agora mora no bairro de ‘Perdizes’.
- 16. A Biblioteca recebeu a visita de um grupo de alunos, mas após a visita foi verificado desaparecimento de três livros, as obras que sumiram do acervo foram ‘Filho Nativo’, ‘Vidas Secas’ e ‘Dom Casmurro’, com isto será necessária a alteração da quantidade de livros no estoque de cada obra.
- 17. A Recepcionista Claudia Cristina não conseguiu terminar o cadastro de cinco usuários que passaram pela Biblioteca, foi solicitado a inserção desses usuários. São eles: 
```
- 31, Alfredo Tenttoni, Rua Amazonas 58, Pirai, 6549-5421, 02170-251, 294.264.875-32
- 32, Cindy Crall, Rua Ipiranga 123, Vila Cristal, 5846-6577, 02182-637, 122.147.655-49
- 33, Rubens Pardo, Avenida dos Monges 51, Campo Grande, 5184-8978, 52412-365, 654.586.472-98
- 34, Carlos Pracidelli, Travessa dos Irmãos 48, Cotia, 8945-7986, 23124-005, 341.251.651-75
- 35, Ernesto Coimbra, Avenida Ampére 414, Jardim Elvira, 5844-2654, 05728-368, 193.107.214-35
----
```
- 18. Gerência solicitou uma consulta para verificar se existe duplicidade de usuários no Banco de Dados.
- 19. A Recepção recebeu a informação que existem dois usuários duplicados na base, será necessária a exclusão de um desses registros.
- 20. O Financeiro solicitou a inserção do valor individual de cada obra. Crie um campo com o nome Valor_Livro  na tabela Obra. Defina o tipo de dados que poderá ser aceito e o valor de cada título.
- 21. A Consultoria verificou que o campo Multa_Atraso está com o tamanho Varchar(2), foi solicitada a alteração do campo para  Varchar(3).
- 22. Foi verificado que o campo Multa_Atraso está com os registros preenchidos de forma errada, foi solicitada a alteração dos registros que forem 0 para Não e 1 para SIM.
- 23. A Diretoria solicitou a exclusão do campo Valor_Livro da tabela Obra pois, o pedido feito pelo Financeiro estava errado.
- 24. A Diretoria solicitou a lista de todos os livros que já foram emprestados mas foram entregues com atraso e os respectivos os nomes dos funcionários que fizeram os empréstimos.
- 25. A Gerência solicitou a lista de todos os livros, cujos autores não são brasileiros, que já foram devolvidos e o valor total de cada livro.
- 26. A área de RH solicitou a lista de todos usuários que fizeram empréstimo com o dia de entrega igual 21/08/2011.
- 27. O Financeiro solicitou a lista de todas as obras que tiveram data de publicação menor que 04/03/2013, sua respectiva  quantidade e o seu valor unitário.
- 28. A área de RH solicitou a lista de todos os funcionários separados por ativos ou não, seus respectivos cargos e salários.
- 29. A Gerência solicitou uma lista de todos os livros com os nomes dos autores, nomes das editoras e a quantidade de livros em estoque.
- 30. A Diretoria solicitou a lista de todos os funcionários da Biblioteca com seus respectivos departamentos que tem idade entre 30 e 40 anos.
- 31. O Financeiro solicitou a criação de uma visão que retorne o nome do livro, seu autor e o valor.
- 32. A Recepção solicitou uma lista com o código do livro, nome do livro cujo valor do livro seja maior que  R$ 90,00.
- 33. A área de RH solicitou a atualização do salário do Auxiliar Financeiro de 12% sobre o seu salário atual.
- 34. O Financeiro solicitou uma atualização da data de demissão da funcionária Alice Meire para o último dia do Mês que você se encontra atualmente.
- 35. A Gerência solicitou uma lista de todas as Obras, que contenham a letra “C ordenadas por gênero   data de publicação entre 2011 e 2013.
- 36. A Recepção solicitou uma lista  como todos os funcionários da Biblioteca com código, nome, e departamento, classificado pelo nome do funcionário que não emprestaram nenhum livro.
- 37. A Biblioteca solicitou uma lista que exiba a quantidade de logradouros de usuários agrupados por número do CEP.
- 38. A Diretoria  solicitou uma lista que exiba a quantidade de endereços agrupados por usuário.
- 39. Foi solicitado a busca de informações de todas as obras que foram reservadas no dia 18/08/11 as 15:00 e o nome do responsável pela reserva.
- 40. O financeiro solicitou o levantamento da informação de quando as usuárias Emily Mall e Whitney Cinse pegaram livros emprestados, quais foram os  livros e seus respectivos valores unitários.
- 41. Hoje é aniversario da biblioteca e para comemorar foram comprados presentes a todos os usuários que foram os primeiros a utilizar a biblioteca, o gerente Carlos mendes pediu a relação da primeira pessoa  a reservar,  pegar emprestado e devolver um livro e suas respectivas informações para que possa ser entrado em contato com ele.
- 42. Foi solicitado pela diretoria saber quantas obras cada editora tem na biblioteca.
- 43. É fechamento referente ao mês de janeiro (hoje dia 03/02/2013) e a biblioteca está no vermelho, foi solicitado pelo financeiro que fosse feito um levantamento de todos os livros que não foram devolvidos, mostrando quantos dias de atraso e para cada dia foi dado uma multa de 5 reais, e mostrar o nome do usuário , livro emprestado e o total a receber pela biblioteca.
- 44. Foi solicitado a informação de todos os usuários que morem em uma avenida, e ainda, que seja mostrado o nome do usuário, CPF e logradouro em ordem de CPF do maior para o menor.
- 45. Chegou na biblioteca uma mensagem urgente da Camila pedindo um relatório contendo a informação de todos os livros que foram emprestados mais de uma vez nos anos de 2011 a 2013 agrupados pelo nome do livro.
- 46. O Financeiro pediu para apresentar o valor médio dos livros e informar quais são os que estão abaixo dessa media, referente a devolução e empréstimo.
- 47. Barbara do financeiro pediu para verificar qual a media do salario dos funcionários e quem são os que ganham mais do que a media em cada departamento.
- 48. Carlos pediu que seja feita uma pesquisa informando  de todos os usuários que tem cadastro na biblioteca e que nunca levaram livros mostrar o nome de todos em Maiúsculas.
- 49. A recepção pediu para verificar quais os usuários que já pegaram mais de 3 livros, e em caso positivo, mostrar nomes e quais livros, ordenando pelo CEP (crescente).
- 50. A diretoria pediu que fosse feito uma analise do estoque, apresentando uma lista com todos os livros que já foram reservados e emprestados e, mostrar quantos estão disponíveis classificados por Gênero.
- 51. Foi solicitada a pesquisa de qual a hora que a biblioteca tem mais movimento e, também, qual o horário de menor movimentação,  faça a avaliação de todas as horas de devolução, empréstimo e reserva.
- 52. A sociedade brasileira de editoras solicitou o levantamento para a biblioteca de qual são os 3 autores que tem mais livros lidos no ano de 2012 e 2013 e os 2 que tem menos obras lidas.
- 53. Crie uma tabela que exiba uma lista de todos livros por funcionario, o total de empréstimos e devoluções que cada um atendeu.
- 54. A biblioteca quer fechar parceria com as editoras, e existem usuários que trabalham nas editoras facilitando esse contato, para tanto, verificar quais usuários possuem o mesmo endereço das editoras, informe seu nome, telefone e o nome da editora que trabalha.
- 55. Foi solicitado a criação de uma visão que traga todos os livros e o preço da editora Leya.
- 56. A biblioteca foi comprar mais livros para aumentar seu acervo, mas a editora Saraiva aumentou em 16% o valor de seus livros, atualize os preços dos livros da editora na porcentagem designada.
- 57. Foi solicitado apresentarmos quais as 5 obras que tiveram menos publicações e as 5 de maior, ainda,  mostrar qual  o autor, editora, nome do livro e quantidade de publicações em ordem decrescente .
- 58. Fazem cento e noventa e três meses que o instituto bibliográfico brasileiro surgiu. Para comemorar a diretoria pediu a relação de todos os usuários que tem o cpf com o começo 193 que receberão um presente de comemoração. Para isto, foi solicitado informar o nome e o cpf de todos os usuários que estejam nesse padrão mas mostrar cpf os 3 primeiros dígitos e os dois últimos os do meio apresentar um "*" como no exemplo: 193.***.***-35, lembrando que devemos apresentar dessa maneira, pois a diretoria quer preservar essas informações que são sigilosas.

# Projeto: Abandono Zero

**Data:** 2024-05-10

**Autor:** Wildisley José de Souza Filho

**Objetivo:** Descrever o modelo relacional do projeto de forma resumida e simplificada.

## Entidades

Entidades são componentes genéricos da realidade e sobre os quais queremos guardar informações. Nesse sentido, no processo de elaboração de um Modelo relacional, devemos abstrair da realidade os dados que queremos armazenar de determinados objetos/estruturas e, ao mesmo tempo, estabelecer logicamente como esse dados serão guardados, sendo esse cuidado no armazenamento lógico que diferencia a modelagem relacional da modelagem conceitual [[1]](#referências).

Nesse sentido, estão listadas as entidades da modelagem relacional do projeto e suas respectivas descrições (Quadro 1):

<div align="center">

<sup> Quadro 1 - Entidades do projeto</sup>

| Entidade                  | Descrição |
| :-----------------------: | --------- |
| `user`                    | Armazena informações de cadastro do usuário, tais como nome, email, senha e o papel (atributo que determina quais informações o usuário tem acesso dentro da aplicação). É por meio desta tabela que pode-se estabelecer conexão com as tabelas dos formulários e com a "resenha".|
| `resenha`                 | Armazena informações gerais do usuário, bem como informações geográficas e informações para contato. Esta tabela também armazena qual o formulário escolhido pelo usuário. |
| `have_dog`                | Armazena as repostas inseridas pelo usuário no formulário destinado a pessoas que possuem cães. Possui uma chave estrangeira que a conecta à tabela "user", facilitando processos de consulta e cruzamento dos dados. |
| `had_dog`                 | Armazena as respostas inseridas pelo usuário no formulário destinado a pessoas que tiveram cães no passado, mas não os têm no tempo presente. Possui uma chave estrangeira que a conecta à tabela "user", facilitando processos de consulta e cruzamento dos dados. |
| `want_dog`                | Armazena as respostas inseridas pelo usuário no formulário destinado a pessoas que querem, futuramente, ter um cão. Possui uma chave estrangeira que a conecta à tabela "user", facilitando processos de consulta e cruzamento dos dados. |
| `dont_want_dog`           | Armazena a resposta inserida pelo usuário no formulário destinado a pessoas que não desejam ter cães. Possui uma chave estrangeira que a conecta à tabela "user", facilitando processos de consulta e cruzamento dos dados. |
| `reasons_to_have_the_dog` | Esta é uma tabela que reúne todas as alternativas da perguntas relativa às razões pelas quais o usuário tem, teve ou quer ter um cão. Os dados armazenados nesta tabela são sempre booleanos, no qual guarda-se o valor `true` caso o usuário selecione determinada alternativa `false` caso alguma seja deixada em branco. A escolha dessa abordagem é a possibilidade de armazenar múltiplas respostas de forma mais organizada e lógica. |

<sup> Fonte: Material produzido pelo autor (2024).</sup>

</div>

## Relacionamentos

Relacionamentos, de maneira bastante intuitiva, descrevem como as tabelas interagem (ou se relacionam) dentro de um banco de dados. Os relacionamentos são marcadas por uma propriedade chamada cardinalidade, ligada a como os elementos dentro de uma tabela interagem com elementos de outra tabela em quesito numérico (uma analogia a se pensar é que um funcionário pode trabalhar apenas em um setor, enquanto um setor pode ter vários funcionários).

Analisando as entidades do diagrama relaciona, observa-se que:

- Um usuário pode ter um único formulário geral (1:1).
- Um usuário pode ter vários respostas em formulários (1:N), desde que responda em intervalos temporais pré-estabelecidos.
- Um usuário pode não ter resposta alguma em certo formulário
- Uma resposta nas tabelas `have_dog`, `had_dog` ou `want_dog` podem ter uma relação em `reasons_to_have_the_dog`

Os relacionamentos descritos anteriormente foram resumidos e compilados em um modelo conceitual (Figura 1) com o intuito de facilitar a compreensão.

<div align="center">
<sup> Figura 1 - Modelo conceitual com cardinalidade</sup>

<img src="./assets/modeloConceitual.png">

<sup> Fonte: Material produzido pelo autor (2024).</sup>
</div>

## Regras de Negócio

Regras de negócio dizem respeito às regras e restrições que certa aplicação deve seguir para atender as necessidades do negócio [[2]](#referências). Nesse sentido, estão listadas a seguir alguns comportamentos que nossa aplicação deve apresentar para seu correto funcionamento.

- Todos os campos obrigatórios devem ser preenchidos.
- Existem campos que podem ser mantidos com valor `NULL`.
- As informações devem ser consistentes entre os formulários.
- Os usuários não podem editar informações já salvas, porém, após intervalos determinados de tempo, podem inserir novas respostas.
- As informações dos usuários são confidenciais.
- Um usuário não deve ter acesso a dois formulários em um mesmo momento no tempo.
- Um usuário não deve ser capaz de consultar os dados, apenas inseri-los.

## Diagrama

Objetivando facilitar a compreensão de como as diversas entidades se relacionam dentro do modelo relacional, produziu-se um diagrama simplificado (Figura 2). Com o diagrama, ficam evidenciados os relacionamentos entre as entidades e as origens das chaves estrangeiras usadas nas várias tabelas.

<div align="center">
<sup> Figura 2 - Diagrama simplificado</sup>

<img src="./assets/diagramaSimplificado.png">

<sup> Fonte: Material produzido pelo autor (2024).</sup>
</div>

## Considerações Finais

Com isso, é possível observar a importancia do modelo relacional na elaboração e concretização das relações entre as diferentes entidades que compõe um banco de dados.

Ademais, cabe salientar que o trabalho aqui exposto pode passar por remodelações antes de sua implementação final.

## Referências

1. PICHETTI, Roni Francisco Vida. Banco de dados. Porto Alegre: SAGAH, 2021. 1 recurso online. ISBN 9786556900186. Disponível em: https://integrada.minhabiblioteca.com.br/books/9786556900186. Acesso em: 7 mai. 2024.

2. O que são regras de negócio? Disponível em: <https://www.alura.com.br/artigos/o-que-sao-regras-de-negocio>. Acesso em: 10 mai. 2024.
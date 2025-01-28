# Modelo Relacional - Sistema de Ordens de Serviço e Peças
## Objetivo
O objetivo deste projeto foi implementar um banco de dados relacional a partir de um modelo conceitual do sistema ordem de serviço. Desenvolvido no MySQL Workbench.


## Modelagem do Banco de Dados
O sistema ordem de serviço foi modelado com as seguintes entidades e relações:
### Tabelas Criadas:

1. **Cliente**: Contém informações sobre os clientes que usam os serviços par seus veículos.
2. **Ordem_Servico**: Armazena informações sobre as ordens de serviço, incluindo dados do cliente e do veículo.
3. **Peca**: Contém dados sobre as peças usadas nas ordens de serviço, com vínculo com a tabela `Ordem_Serviço`.
4. **Servico**: Armazena informações sobre os serviços realizados nas ordens de serviço, associando-se à tabela `Ordem_Serviço`.
5. **Mecanico**: Guarda os dados dos mecânicos responsáveis pelos diferentes serviços.
6. **Servico_Mecanico**: Relaciona os serviços aos mecânicos responsáveis, criando uma relação N:M entre `Servico` e `Mecanico`.
7. **Veiculo**: Armazena dados sobre os veículos dos clientes, relacionados às ordens de serviço. Cada veículo pode ter várias ordens de serviço associadas.

###  Este repositório contém os seguintes arquivos:

1. **Ordem-S-DIO.sql**  
   Contém o script SQL responsável pela criação das tabelas e a definição das constraints e relacionamentos entre elas. Este script define o esquema do banco de dados relacional, criando as tabelas necessárias para o sistema de ordem de serviço.
   
2. **Ordem-S-DIO_Queries.sql**  
   Contém uma série de queries SQL que realizam consultas sobre o banco de dados. 

3. **Ordem-S-DIO_Dados.sql**  
   Este arquivo contém os dados inseridos nas tabelas criadas pelo script `Ordem-S-DIO.sql`. Ele serve para popular o banco de dados com informações de clientes, veiculos, serviços e mais, permitindo realizar testes e consultas no sistema.

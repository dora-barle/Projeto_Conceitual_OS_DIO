# Modelo Conceitual de Sistema de Gestão de Oficinas

## Descrição Geral
Este projeto consistiu na criação de um modelo conceitual de banco de dados para um sistema de **Gestão de Oficinas**. O objetivo foi mapear as entidades e os relacionamentos essenciais para gerenciar clientes, veículos, ordens de serviço, peças, serviços e mecânicos, garantindo a organização e escalabilidade do sistema.

---

## Objetivo
O modelo foi desenvolvido para representar de forma clara e eficiente as seguintes funcionalidades:

- Cadastro de clientes e seus veículos, permitindo que um cliente possua múltiplos veículos.
- Registro de ordens de serviço associadas a clientes e veículos.
- Gerenciamento de serviços realizados, peças utilizadas e mecânicos responsáveis.


### Tabelas Principais

| **Tabela**       | **Descrição**                                                                                 |
|-------------------|-----------------------------------------------------------------------------------------------|
| **Cliente**      | Armazena informações dos clientes. Um cliente pode ter vários veículos e várias ordens de serviço. |
| **Veículo**      | Contém os dados dos veículos. Cada veículo pertence a um único cliente e pode ter várias ordens de serviço. |
| **Ordens de Serviço** | Registra os serviços realizados. Cada ordem está associada a um único cliente e a um único veículo. |
| **Peça**         | Lista as peças utilizadas em cada ordem de serviço.                                          |
| **Serviço**      | Detalha os serviços disponíveis e permite associá-los aos mecânicos responsáveis.            |
| **Mecânico**     | Contém os dados dos mecânicos e os serviços realizados por eles.                             |

## Relacionamentos
- Um **cliente** pode possuir **vários veículos** e realizar **várias ordens de serviço**.
- Cada **veículo** pertence a **um único cliente** e pode ter **várias ordens de serviço**.
- Uma **ordem de serviço** pode incluir **várias peças** e **vários serviços**, mas está vinculada a **um cliente** e **um veículo**.
- Um **serviço** pode ser executado por um ou mais **mecânicos**.

## Diagrama Conceitual
O modelo foi desenvolvido no **MySQL Workbench** e reflete a estrutura descrita acima. Ele inclui todas as entidades, atributos e relacionamentos detalhados, garantindo consistência e integridade dos dados.


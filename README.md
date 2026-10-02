# Sistema de Banco de Dados Relacional para Gestão Financeira de Pet Shop

Este repositório contém a modelagem, implementação e otimização de um banco de dados relacional robusto, desenvolvido em PostgreSQL, focado no controle operacional e gerenciamento de fluxo de caixa para empresas do segmento de pet shop.

## Arquitetura do Projeto

O projeto foi estruturado seguindo as melhores práticas de versionamento de banco de dados e migrações (migrations), sendo segregado em módulos sequenciais para garantir a manutenção e a rastreabilidade do código:

* **01_schema.sql**: Definição da estrutura das tabelas, tipos de dados e restrições de integridade referencial.
* **02_seed.sql**: Carga de dados fictícios para validação de integridade, testes de volume e simulações de fluxo de caixa.
* **03_queries.sql**: Consultas analíticas aplicadas a Business Intelligence (BI) e extração de relatórios gerenciais.
* **04_views.sql**: Camadas de abstração criadas para simplificar o acesso a consultas complexas frequentes.
* **05_functions.sql**: Implementação de inteligência em camadas internas do banco (Stored Procedures / Functions).
* **06_indexes.sql**: Configurações de planos de execução e tunagem de performance.

## Funcionalidades e Regras de Negócio Implementadas

* **Integridade Referencial Estrita**: Uso de constraints de chaves estrangeiras (FOREIGN KEY) para impedir a órfandade de registros entre as entidades de clientes, pets, categorias e movimentações financeiras.
* **Validação de Entrada de Dados (Data Constraining)**: Implementação de cláusulas CHECK para assegurar que valores monetários sejam estritamente positivos e que classificações contábeis aceitem apenas os domínios 'RECEITA' ou 'DESPESA'.
* **Gerenciamento de Fluxo Contábil**: Mecanismo estruturado na coluna de controle de pagamentos para monitoramento preciso de contas adimplentes e controle rigoroso de inadimplência corporativa.

## Diferenciais Técnicos e Otimização de Performance

* **Estratégia de Indexação**: Criação manual de índices B-Tree nas colunas que atuam como chaves estrangeiras e em campos de filtragem recorrente (WHERE), evitando operações de Sequential Scan em favor de Index Scans rápidos em grandes volumes de dados.
* **Camada de Abstração Contábil**: Criação das funções `calcular_saldo()` e `calcular_inadimplencia()`, movendo a carga matemática complexa de agregação financeira diretamente para o motor do PostgreSQL, otimizando o consumo de banda de rede entre aplicação e banco.

## Instruções de Implantação

1. Instancie um servidor PostgreSQL e crie um banco de dados vazio (ex: `sonhosdepet_db`).
2. Execute os scripts localizados no diretório `sql/` respeitando estritamente a ordem de numeração dos arquivos (01 a 06).

## Nota sobre a Massa de Dados

Os dados contidos no arquivo 02_seed.sql foram gerados de forma padronizada e simplificada com o objetivo estrito de validar a integridade das restrições (constraints), testar os planos de execução dos índices e garantir o comportamento matemático das funções financeiras, simulando cenários genéricos de homologação.

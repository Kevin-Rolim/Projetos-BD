# SQL Server Lab

Repositório destinado ao estudo prático de **Banco de Dados com SQL Server**, utilizando projetos progressivos baseados em cenários próximos aos encontrados no mercado.

A proposta é desenvolver cada banco a partir de um **pedido de cliente**, um **mini-mundo** e um conjunto de requisitos, realizando desde a modelagem até a implementação completa em T-SQL.

## Objetivo

Praticar Banco de Dados Relacional e SQL Server através de projetos com níveis crescentes de complexidade.

Ao longo dos projetos serão trabalhados conceitos como:

- modelagem conceitual e lógica;
- DER — Diagrama Entidade-Relacionamento;
- Primary Keys e Foreign Keys;
- relacionamentos `1:1`, `1:N` e `N:N`;
- entidades associativas;
- constraints;
- views;
- functions;
- stored procedures;
- triggers;
- indexes;
- transactions;
- tratamento de erros;
- integridade referencial;
- auditoria;
- histórico de dados;
- consultas analíticas;
- otimização de consultas;
- segurança;
- concorrência;
- grandes volumes de dados;
- Data Warehouse.

---

# Projetos

## 01 — ServiceFlow

### HelpDesk e Gestão de Ativos de TI

Sistema interno para gerenciamento de chamados de suporte técnico e equipamentos utilizados pelos funcionários de uma empresa.

O banco deverá controlar:

- departamentos;
- funcionários;
- usuários;
- técnicos;
- equipes de suporte;
- categorias;
- prioridades;
- status;
- chamados;
- histórico de alterações;
- comentários;
- tags;
- equipamentos;
- histórico de alocação de equipamentos;
- SLA.

### Principais conceitos

- relacionamentos `1:1`, `1:N` e `N:N`;
- entidades associativas;
- PK e FK;
- `UNIQUE`;
- `CHECK`;
- `DEFAULT`;
- views;
- functions escalares;
- table-valued functions;
- stored procedures;
- triggers;
- índices compostos;
- índices filtrados;
- `INCLUDE`;
- transações;
- histórico de dados;
- regras de negócio.

---

## 02 — CommerceHub

### E-commerce B2B

Plataforma de vendas entre empresas, permitindo que clientes empresariais façam pedidos de produtos fornecidos por diferentes fornecedores.

O banco deverá controlar:

- empresas clientes;
- usuários;
- endereços;
- fornecedores;
- produtos;
- categorias;
- tabelas de preço;
- estoque;
- carrinhos;
- pedidos;
- itens dos pedidos;
- pagamentos;
- descontos;
- cupons;
- movimentações de estoque;
- histórico dos pedidos.

### Principais conceitos

- pedidos e itens;
- cálculos financeiros;
- controle de estoque;
- movimentação de estoque;
- procedures transacionais;
- prevenção de estoque negativo;
- concorrência;
- agregações;
- funções de cálculo;
- auditoria;
- índices para consultas comerciais;
- relatórios de faturamento;
- produtos mais vendidos;
- clientes mais rentáveis.

---

## 03 — SupplyCore

### Compras e Gestão de Fornecedores

Sistema utilizado por uma empresa para controlar requisições internas de compra, cotações, fornecedores e recebimento de materiais.

O banco deverá controlar:

- departamentos;
- funcionários;
- fornecedores;
- produtos;
- requisições de compra;
- itens requisitados;
- aprovações;
- cotações;
- propostas de fornecedores;
- ordens de compra;
- itens comprados;
- recebimentos;
- divergências;
- histórico de preços.

### Principais conceitos

- fluxo de aprovação;
- relacionamentos complexos;
- estados de processo;
- histórico;
- comparação de propostas;
- procedures com múltiplas etapas;
- transações;
- integridade entre documentos;
- consultas utilizando CTE;
- window functions;
- ranking;
- análise de fornecedores;
- histórico de preços.

---

## 04 — SubscriptionCore

### Plataforma SaaS por Assinatura

Banco de dados responsável pelo gerenciamento comercial de uma plataforma SaaS utilizada por diferentes empresas.

O banco deverá controlar:

- empresas;
- usuários;
- planos;
- recursos disponíveis;
- assinaturas;
- alterações de plano;
- períodos de cobrança;
- faturas;
- itens de cobrança;
- pagamentos;
- descontos;
- cancelamentos;
- tentativas de pagamento;
- histórico de assinatura.

### Principais conceitos

- dados históricos;
- vigência;
- planos e versões;
- recorrência;
- cobrança;
- faturamento;
- períodos;
- datas;
- cálculo proporcional;
- controle de estados;
- consultas temporais;
- functions;
- procedures;
- relatórios financeiros;
- receita recorrente.

---

## 05 — RouteFlow

### Transportadora e Gestão Logística

Sistema para controlar operações de transporte de cargas entre diferentes localidades.

O banco deverá controlar:

- clientes;
- remetentes;
- destinatários;
- motoristas;
- veículos;
- cidades;
- endereços;
- cargas;
- volumes;
- viagens;
- rotas;
- paradas;
- ocorrências;
- entregas;
- rastreamento;
- manutenção dos veículos.

### Principais conceitos

- estruturas de localização;
- relacionamento entre viagens e cargas;
- sequenciamento de rotas;
- histórico de eventos;
- rastreamento;
- consultas por períodos;
- cálculos de prazo;
- índices para grandes históricos;
- funções analíticas;
- ranking;
- cálculo de desempenho;
- manutenção preventiva.

---

## 06 — FinanceCore

### Gestão Financeira Empresarial

Sistema financeiro responsável por controlar contas, receitas, despesas e movimentações financeiras de uma empresa.

O banco deverá controlar:

- empresas;
- contas financeiras;
- centros de custo;
- categorias financeiras;
- fornecedores;
- clientes;
- contas a pagar;
- contas a receber;
- parcelas;
- pagamentos;
- recebimentos;
- transferências;
- conciliações;
- lançamentos;
- fechamento de períodos.

### Principais conceitos

- consistência financeira;
- débito e crédito;
- saldos;
- transações;
- atomicidade;
- fechamento contábil;
- prevenção de alterações após fechamento;
- conciliação;
- procedures críticas;
- auditoria;
- funções de saldo;
- relatórios financeiros;
- fluxo de caixa;
- inadimplência;
- projeções.

---

## 07 — InsightDW

### Data Warehouse e Business Intelligence

Projeto destinado à construção de uma estrutura analítica separada dos bancos transacionais.

Dados provenientes dos projetos anteriores poderão ser utilizados como fontes.

O Data Warehouse deverá possuir informações relacionadas a:

- clientes;
- produtos;
- departamentos;
- funcionários;
- datas;
- vendas;
- chamados;
- compras;
- faturamento;
- pagamentos.

### Principais conceitos

- OLTP x OLAP;
- modelagem dimensional;
- Star Schema;
- tabelas fato;
- tabelas dimensão;
- dimensões conformadas;
- dimensão calendário;
- surrogate keys;
- Slowly Changing Dimensions;
- ETL;
- cargas incrementais;
- tabelas staging;
- agregações;
- indicadores;
- análise histórica.

---

## 08 — EnterpriseCore

### Sistema Corporativo de Alta Complexidade

Projeto final da trilha.

O objetivo é construir um banco corporativo preparado para trabalhar com grande quantidade de dados, múltiplos usuários e requisitos mais rígidos de segurança e desempenho.

O sistema poderá reunir conceitos de:

- clientes;
- contratos;
- serviços;
- operações;
- faturamento;
- usuários;
- permissões;
- auditoria;
- integrações;
- processamento assíncrono;
- histórico.

### Principais conceitos

- arquitetura de banco;
- grandes volumes;
- otimização;
- planos de execução;
- estatísticas;
- índices avançados;
- deadlocks;
- locks;
- níveis de isolamento;
- concorrência;
- paginação;
- auditoria;
- segurança;
- roles;
- permissions;
- schemas;
- particionamento;
- arquivamento;
- procedures de alta criticidade;
- análise de performance.

---

# Progressão

A trilha segue aproximadamente esta evolução:

```text
01 — Modelagem relacional
        ↓
02 — Transações e estoque
        ↓
03 — Processos empresariais
        ↓
04 — Dados temporais e recorrência
        ↓
05 — Histórico e grande volume de eventos
        ↓
06 — Integridade financeira
        ↓
07 — Data Warehouse
        ↓
08 — Performance, concorrência e arquitetura
```

Cada projeto aumenta a complexidade do anterior e introduz novos problemas de banco de dados.

---

# Estrutura do repositório

```text
sql-server-lab/
│
├── README.md
│
├── 01-serviceflow/
│   ├── README.md
│   ├── docs/
│   ├── sql/
│   └── screenshots/
│
├── 02-commercehub/
│   ├── README.md
│   ├── docs/
│   ├── sql/
│   └── screenshots/
│
├── 03-supplycore/
├── 04-subscriptioncore/
├── 05-routeflow/
├── 06-financecore/
├── 07-insightdw/
└── 08-enterprisecore/
```

---

# Estrutura interna dos projetos

Cada projeto poderá seguir a seguinte organização:

```text
projeto/
│
├── README.md
│
├── docs/
│   ├── pedido-cliente.md
│   ├── mini-mundo.md
│   ├── regras-negocio.md
│   ├── der.drawio
│   └── decisoes-modelagem.md
│
├── sql/
│   ├── 00-create-database.sql
│   ├── 01-tables.sql
│   ├── 02-constraints.sql
│   ├── 03-indexes.sql
│   ├── 04-functions.sql
│   ├── 05-views.sql
│   ├── 06-procedures.sql
│   ├── 07-triggers.sql
│   ├── 08-seed.sql
│   ├── 09-queries.sql
│   └── 10-tests.sql
│
└── screenshots/
```

---

# Metodologia

Cada projeto começa com um cenário apresentado como uma solicitação real de um cliente.

Serão definidos:

- pedido do cliente;
- mini-mundo;
- regras de negócio;
- funcionalidades necessárias;
- consultas esperadas;
- views necessárias;
- functions necessárias;
- procedures necessárias;
- requisitos de integridade;
- requisitos de auditoria;
- necessidades de indexação;
- casos de teste.

A solução não será entregue pronta.

O objetivo é analisar o problema, construir o DER, tomar as decisões de modelagem e desenvolver a implementação utilizando SQL Server.

---

# Tecnologias

- Microsoft SQL Server
- T-SQL
- DBeaver
- SQL Server Management Studio
- draw.io
- Git
- GitHub

---

# Objetivo final

Ao término da trilha, o repositório deverá demonstrar conhecimento prático em diferentes áreas de Banco de Dados, desde a criação de tabelas e relacionamentos até problemas envolvendo:

- modelagem;
- integridade;
- transações;
- auditoria;
- performance;
- concorrência;
- segurança;
- análise de dados;
- Data Warehouse.

O objetivo é que cada projeto represente não apenas um exercício de SQL, mas um problema de banco de dados que poderia existir em um ambiente real.
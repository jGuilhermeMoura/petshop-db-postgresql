-- Tabela de clientes e seus pets
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    pet_nome VARCHAR (100) NOT NULL,
    valor NUMERIC (10,2) NOT NULL,
    telefone VARCHAR(20),
    data_servico VARCHAR(100) NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- Tabela de categorias financeiras
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('RECEITA', 'DESPESA'))
);

-- Tabela de contas a receber
CREATE TABLE contas_receber (
    id_conta SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    pet_nome VARCHAR(100) NOT NULL,
    id_categoria INTEGER NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    valor NUMERIC(10,2) NOT NULL CHECK (valor > 0),
    data_pagamento VARCHAR(200) NOT NULL,
    CONSTRAINT fk_conta_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_conta_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabela de contas a pagar
CREATE TABLE contas_pagar (
    id_conta SERIAL PRIMARY KEY,
    nome_conta VARCHAR(100) NOT NULL,
    id_categoria INTEGER NOT NULL,
    descricao VARCHAR (200) NOT NULL,
    valor NUMERIC(10,2) NOT NULL CHECK (valor > 0),
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    CONSTRAINT fk_conta_categoria FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
);

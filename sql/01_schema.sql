-- 1. Tabela de clientes (Agora sem dados do pet e com data_servico removida, pois serviços mudam)
CREATE TABLE clientes ( 
    id_cliente SERIAL PRIMARY KEY, 
    nome_cliente VARCHAR(100) NOT NULL, 
    telefone VARCHAR(20), 
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- 2. NOVA TABELA: Pets (Um cliente pode ter vários pets - Relacionamento 1:N)
CREATE TABLE pets (
    id_pet SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    nome_pet VARCHAR(100) NOT NULL,
    CONSTRAINT fk_pet_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

-- 3. Tabela de categorias financeiras (Mantida igual, pois está correta)
CREATE TABLE categorias ( 
    id_categoria SERIAL PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL UNIQUE, 
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('RECEITA', 'DESPESA'))
);

-- 4. Tabela de contas a receber (Corrigida: aponta para o PET, que por consequência já sabe quem é o dono)
CREATE TABLE contas_receber ( 
    id_conta SERIAL PRIMARY KEY, 
    id_pet INTEGER NOT NULL, -- Mudou aqui! Agora vincula ao pet específico
    id_categoria INTEGER NOT NULL, 
    descricao VARCHAR(200) NOT NULL, 
    valor NUMERIC(10,2) NOT NULL CHECK (valor > 0), 
    data_servico DATE NOT NULL, -- Melhor usar DATE do que VARCHAR para datas
    data_pagamento DATE, -- Permitir NULL se a conta ainda não foi paga
    CONSTRAINT fk_conta_pet FOREIGN KEY (id_pet) REFERENCES pets(id_pet), 
    CONSTRAINT fk_conta_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- 5. Tabela de contas a pagar (Mantida igual, apenas com o ajuste estético de identação)
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

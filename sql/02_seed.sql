-- 1. Cadastro dos clientes (Sem dados de pets, valores ou dias da semana)
INSERT INTO clientes (nome_cliente, telefone, data_cadastro)
VALUES
    ('Cliente 1', '11 98765-0001', '2026-10-01'),
    ('Cliente 2', '21 98765-0002', '2026-10-02'),
    ('Cliente 3', '31 98765-0003', '2026-10-03'),
    ('Cliente 4', '41 98765-0004', '2026-10-04'),
    ('Cliente 5', '51 98765-0005', '2026-10-05'),
    ('Cliente 6', '61 98765-0006', '2026-10-06'),
    ('Cliente 7', '71 98765-0007', '2026-10-07'),
    ('Cliente 8', '81 98765-0008', '2026-10-08'),
    ('Cliente 9', '85 98765-0009', '2026-10-09'),
    ('Cliente 10', '91 98765-0010', '2026-10-10'),
    ('Cliente 11', '98 98765-0011', '2026-10-11'),
    ('Cliente 12', '19 98765-0012', '2026-10-12'),
    ('Cliente 13', '27 98765-0013', '2026-10-13'),
    ('Cliente 14', '11 99999-1111', '2026-09-15'),
    ('Cliente 15', '21 99999-2222', '2026-09-18'),
    ('Cliente 16', '31 99999-3333', '2026-09-20');

-- 2. NOVA SEED: Cadastro dos pets vinculados aos clientes pelo id_cliente
INSERT INTO pets (id_cliente, nome_pet)
VALUES
    (1, 'Pet 1'),
    (2, 'Pet 2'),
    (3, 'Pet 3'),
    (4, 'Pet 4'),
    (5, 'Pet 5'),
    (6, 'Pet 6'),
    (7, 'Pet 7'),
    (8, 'Pet 8'),
    (9, 'Pet 9'),
    (10, 'Pet 10'),
    (11, 'Pet 11'),
    (12, 'Pet 12'),
    (13, 'Pet 13'),
    (14, 'Pet 14'),
    (15, 'Pet 15'),
    (16, 'Pet 16');

-- 3. Cadastro das categorias financeiras
INSERT INTO categorias (nome, tipo)
VALUES
    ('Serviço', 'RECEITA'),
    ('Aluguel', 'DESPESA'),
    ('Energia', 'DESPESA');

-- 4. Cadastro das contas a receber (Agora vinculadas ao id_pet e com campos de data corretos)
-- Para as contas que já foram pagas, defini uma data real em Outubro/2026. Para as "Em aberto", deixei NULL.
INSERT INTO contas_receber (id_pet, id_categoria, descricao, valor, data_servico, data_pagamento)
VALUES
    (1, 1, 'Mensal', 120.00, '2026-10-01', '2026-10-05'),
    (2, 1, 'Mensal', 150.50, '2026-10-02', '2026-10-10'),
    (3, 1, 'Mensal', 95.00,  '2026-10-03', '2026-10-15'),
    (4, 1, 'Mensal', 210.00, '2026-10-04', '2026-10-20'),
    (5, 1, 'Mensal', 135.00, '2026-10-05', '2026-10-05'),
    (6, 1, 'Mensal', 80.00,  '2026-10-06', '2026-10-10'),
    (7, 1, 'Mensal', 175.20, '2026-10-07', '2026-10-15'),
    (8, 1, 'Mensal', 110.00, '2026-10-08', '2026-10-20'),
    (9, 1, 'Mensal', 145.00, '2026-10-09', '2026-10-05'),
    (10, 1, 'Mensal', 200.00, '2026-10-10', '2026-10-10'),
    (11, 1, 'Mensal', 125.50, '2026-10-11', '2026-10-15'),
    (12, 1, 'Mensal', 90.00,  '2026-10-12', '2026-10-20'),
    (13, 1, 'Mensal', 320.00, '2026-10-13', '2026-10-05'),
    (14, 1, 'Semanal', 150.00, '2026-09-15', NULL), -- Em aberto
    (15, 1, 'Semanal', 90.00,  '2026-09-18', NULL), -- Em aberto
    (16, 1, 'Mensal', 220.00, '2026-09-20', NULL);  -- Em aberto
     
-- 5. Cadastro das contas a pagar
INSERT INTO contas_pagar (nome_conta, id_categoria, descricao, valor, data_vencimento, data_pagamento)
VALUES 
    ('Aluguel', 2, 'Referente ao mês de Setembro', 1000.00, '2026-10-05', NULL);

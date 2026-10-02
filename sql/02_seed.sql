-- Cadastro dos clientes
INSERT INTO clientes (nome_cliente, pet_nome, valor, telefone, data_servico, data_cadastro)
VALUES
    ('Cliente 1', 'Pet 1', 120.00, '11 98765-0001', 'Segunda-feira', '2026-10-01'),
    ('Cliente 2', 'Pet 2', 150.50, '21 98765-0002', 'Terça-feira',   '2026-10-02'),
    ('Cliente 3', 'Pet 3', 95.00,  '31 98765-0003', 'Quarta-feira',  '2026-10-03'),
    ('Cliente 4', 'Pet 4', 210.00, '41 98765-0004', 'Quinta-feira',  '2026-10-04'),
    ('Cliente 5', 'Pet 5', 135.00, '51 98765-0005', 'Sexta-feira',   '2026-10-05'),
    ('Cliente 6', 'Pet 6', 80.00,  '61 98765-0006', 'Sábado',        '2026-10-06'),
    ('Cliente 7', 'Pet 7', 175.20, '71 98765-0007', 'Segunda-feira', '2026-10-07'),
    ('Cliente 8', 'Pet 8', 110.00, '81 98765-0008', 'Terça-feira',   '2026-10-08'),
    ('Cliente 9', 'Pet 9', 145.00, '85 98765-0009', 'Quarta-feira',  '2026-10-09'),
    ('Cliente 10', 'Pet 10', 200.00, '91 98765-0010', 'Quinta-feira', '2026-10-10'),
    ('Cliente 11', 'Pet 11', 125.50, '98 98765-0011', 'Sexta-feira',  '2026-10-11'),
    ('Cliente 12', 'Pet 12', 90.00,  '19 98765-0012', 'Sábado',       '2026-10-12'),
    ('Cliente 13', 'Pet 13', 320.00, '27 98765-0013', 'Segunda-feira', '2026-10-13'),
    ('Cliente 14', 'Pet, 14', 150.00, '11 99999-1111', 'Quinta-feira', '2026-09-15'),
    ('Cliente 15', 'Pet 15', 90.00, '21 99999-2222', 'Sexta-feira', '2026-09-18'),
    ('Cliente 16', 'Pet 16', 220.00, '31 99999-3333', 'Sábado', '2026-09-20');

-- Cadastro das categorias financeiras
INSERT INTO categorias (nome, tipo)
VALUES
    ('Serviço', 'RECEITA'),
    ('Aluguel', 'DESPESA'),
    ('Energia', 'DESPESA');

-- Cadastro das contas a receber
INSERT INTO contas_receber (id_cliente, pet_nome, id_categoria, descricao, valor, data_pagamento)
VALUES
    (1, 'Pet 1', 1, 'Mensal', 120.00, 'Todo dia 05'),
    (2, 'Pet 2', 1, 'Mensal', 150.50, 'Todo dia 10'),
    (3, 'Pet 3', 1, 'Mensal', 95.00,  'Todo dia 15'),
    (4, 'Pet 4', 1, 'Mensal', 210.00, 'Todo dia 20'),
    (5, 'Pet 5', 1, 'Mensal', 135.00, 'Todo dia 05'),
    (6, 'Pet 6', 1, 'Mensal', 80.00,  'Todo dia 10'),
    (7, 'Pet 7', 1, 'Mensal', 175.20, 'Todo dia 15'),
    (8, 'Pet 8', 1, 'Mensal', 110.00, 'Todo dia 20'),
    (9, 'Pet 9', 1, 'Mensal', 145.00, 'Todo dia 05'),
    (10, 'Pet 10', 1, 'Mensal', 200.00, 'Todo dia 10'),
    (11, 'Pet 11', 1, 'Mensal', 125.50, 'Todo dia 15'),
    (12, 'Pet 12', 1, 'Mensal', 90.00,  'Todo dia 20'),
    (13, 'Pet 13', 1, 'Mensal', 320.00, 'Todo dia 05'),
    (14, 'Pet 14', 1, 'Semanal', 150.00, 'Em aberto'),
    (15, 'Pet 15', 1, 'Semanal', 90.00, 'Em aberto'),
    (16, 'Pet 16', 1, 'Mensal', 220.00, 'Em aberto');
     
-- Cadastro das contas a pagar
INSERT INTO contas_pagar (nome_conta, id_categoria, descricao, valor, data_vencimento, data_pagamento)
VALUES 
    ('Aluguel', 2, 'Referente ao mês de Setembro', 1000.00, '2026-10-05', NULL);

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
    ('Banho', 'RECEITA'),
    ('Banho e Tosa', 'RECEITA'),
    ('Tosa', 'RECEITA'),
    ('Aluguel', 'DESPESA'),
    ('Energia', 'DESPESA'),
    ('Água', 'DESPESA'),
	('Multa', 'DESPESA');

-- 4. Cadastro das contas a receber 
INSERT INTO contas_receber (id_pet, id_categoria, descricao, valor, data_servico, data_pagamento)
VALUES
    -- Lançamentos de Outubro (Pagas)
    (1, 1, 'Mensalidade de Outubro', 120.00, '2026-10-01', '2026-10-05'),
    (2, 6, 'Mensalidade de Outubro', 150.50, '2026-10-02', '2026-10-10'),
    (3, 7, 'Mensalidade de Outubro', 95.00,  '2026-10-03', '2026-10-15'),
    (4, 1, 'Mensalidade de Outubro', 210.00, '2026-10-04', '2026-10-20'),
    (5, 1, 'Mensalidade de Outubro', 135.00, '2026-10-05', '2026-10-05'),
    (6, 6, 'Mensalidade de Outubro', 80.00,  '2026-10-06', '2026-10-10'),
    (7, 6, 'Mensalidade de Outubro', 175.20, '2026-10-07', '2026-10-15'),
    (8, 1, 'Mensalidade de Outubro', 110.00, '2026-10-08', '2026-10-20'),
    (9, 1, 'Mensalidade de Outubro', 145.00, '2026-10-09', '2026-10-05'),
    (10, 1, 'Mensalidade de Outubro', 200.00, '2026-10-10', '2026-10-10'),
    (11, 6, 'Mensalidade de Outubro', 125.50, '2026-10-11', '2026-10-15'),
    (12, 1, 'Mensalidade de Outubro', 90.00,  '2026-10-12', '2026-10-20'),
    (13, 7, 'Mensalidade de Outubro', 320.00, '2026-10-13', '2026-10-05'),
    
    -- Lançamentos de Setembro (Já Pagas)
    (1, 1, 'Mensalidade de Setembro', 120.00, '2026-09-01', '2026-09-05'),
    (2, 6, 'Mensalidade de Setembro', 140.00, '2026-09-02', '2026-09-10'),
    (3, 7, 'Mensalidade de Setembro', 110.00, '2026-09-03', '2026-09-15'),
    (4, 1, 'Mensalidade de Setembro', 210.00, '2026-09-04', '2026-09-05'),
    (5, 6, 'Mensalidade de Setembro', 135.00, '2026-09-05', '2026-09-10'),
    (6, 7, 'Mensalidade de Setembro', 85.00,  '2026-09-06', '2026-09-15'),
    (7, 1, 'Mensalidade de Setembro', 170.00, '2026-09-07', '2026-09-05'),
    (8, 6, 'Mensalidade de Setembro', 115.00, '2026-09-08', '2026-09-10'),
    (9, 7, 'Mensalidade de Setembro', 150.00, '2026-09-09', '2026-09-15'),
    (10, 1, 'Mensalidade de Setembro', 190.00, '2026-09-10', '2026-09-12'),
    (11, 6, 'Mensalidade de Setembro', 125.00, '2026-09-11', '2026-09-14'),
    (12, 7, 'Mensalidade de Setembro', 95.00,  '2026-09-12', '2026-09-15'),
    (13, 1, 'Mensalidade de Setembro', 310.00, '2026-09-13', '2026-09-13'),
    (1,  6, 'Mensalidade de Setembro', 130.00, '2026-09-14', '2026-09-16'),
    (2,  7, 'Mensalidade de Setembro', 160.00, '2026-09-15', '2026-09-17'),
    (3,  1, 'Mensalidade de Setembro', 100.00, '2026-09-16', '2026-09-18'),
    (4,  6, 'Mensalidade de Setembro', 215.00, '2026-09-17', '2026-09-19'),
    (5,  7, 'Mensalidade de Setembro', 125.00, '2026-09-18', '2026-09-20'),
    
    -- Lançamentos de Setembro (Em aberto)
    (14, 1, 'Mensalidade de Setembro (Semanal)', 150.00, '2026-09-15', NULL),
    (15, 6, 'Mensalidade de Setembro (Semanal)', 90.00,  '2026-09-18', NULL),
    (16, 1, 'Mensalidade de Setembro', 220.00, '2026-09-20', NULL);



-- 5. Cadastro das contas a pagar
INSERT INTO contas_pagar (nome_conta, id_categoria, descricao, valor, data_vencimento, data_pagamento)
VALUES 
    ('Aluguel', 2, 'Referente ao mês de Setembro', 1000.00, '2026-09-05', NULL),
    ('Aluguel', 2, 'Referente ao mês de Outubro', 1000.00, '2026-10-05', NULL),
    ('Energia', 3, 'Referente ao mês de Setembro', 200.00, '2026-09-10', NULL),
    ('Energia', 3, 'Referente ao mês de Outubro', 250.00, '2026-10-10', NULL),
    ('Água', 4, 'Referente ao mês de Setembro', 450.00, '2026-09-07', NULL),
    ('Água', 4, 'Referente ao mês de Setembro', 500.00, '2026-10-07', NULL),
    ('Multa', 5, 'Multa veículo - Alta velocidade', 195.00, '2026-10-21', NULL);

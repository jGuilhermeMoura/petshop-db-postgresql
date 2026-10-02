-- 1. Visualização Geral de Contas a Receber por Cliente (Sua Query)
-- Relaciona os lançamentos financeiros diretamente aos dados dos tutores e pets
SELECT 
    c.nome_cliente AS cliente,
    c.pet_nome AS pet_nome,
    cr.descricao,
    cr.valor,
    cr.data_pagamento
FROM contas_receber cr 
JOIN clientes c ON cr.id_cliente = c.id_cliente;


-- 2. Total Geral de Receitas Projetadas (Sua Query)
-- Exibe a soma de todos os lançamentos de entrada do sistema
SELECT SUM(valor) AS total_a_receber FROM contas_receber;


-- 3. Total Geral de Despesas Projetadas (Sua Query)
-- Exibe a soma de todos os lançamentos de saída do sistema
SELECT SUM(valor) AS total_a_pagar FROM contas_pagar;


-- 4. Relatório Detalhado de Fluxo de Caixa com Categoria (Adicionada)
-- Exibe a prestação de contas completa, traduzindo os IDs em nomes de categorias legíveis
SELECT 
    cr.id_conta AS id_transacao,
    cl.nome_cliente,
    cr.pet_nome,
    cat.nome AS categoria,
    cr.descricao,
    cr.valor,
    cr.data_pagamento
FROM contas_receber cr
INNER JOIN clientes cl ON cr.id_cliente = cl.id_cliente
INNER JOIN categorias cat ON cr.id_categoria = cat.id_categoria
ORDER BY cr.id_conta ASC;


-- 5. Ranking de Clientes (Top Clientes que mais geraram Faturamento) (Adicionada)
-- Identifica os clientes mais lucrativos e frequentes para estratégias de fidelização
SELECT 
    cl.nome_cliente,
    COUNT(cr.id_conta) AS total_atendimentos,
    SUM(cr.valor) AS total_gasto
FROM contas_receber cr
INNER JOIN clientes cl ON cr.id_cliente = cl.id_cliente
GROUP BY cl.nome_cliente
ORDER BY total_gasto DESC;


-- 6. Resumo Financeiro Consolidado por Categoria de Serviço (Adicionada)
-- Permite analisar o desempenho de cada serviço prestado pelo Pet Shop
SELECT 
    cat.nome AS categoria,
    cat.tipo AS tipo_fluxo,
    COUNT(cr.id_conta) AS quantidade_transacoes,
    SUM(cr.valor) AS total_acumulado
FROM contas_receber cr
INNER JOIN categorias cat ON cr.id_categoria = cat.id_categoria
GROUP BY cat.nome, cat.tipo;

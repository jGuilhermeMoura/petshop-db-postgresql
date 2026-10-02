-- Executar após criação: SELECT * FROM vw_contas_receber
-- Visualizar: nome dos clientes, valor, descrição e data de pagamento
CREATE VIEW vw_contas_receber AS SELECT
    c.nome_cliente AS cliente,
    cat.nome AS categoria,
    cr.descricao,
    cr.valor,
    cr.data_pagamento
FROM contas_receber cr
JOIN clientes c
    ON cr.id_cliente = c.id_cliente
JOIN categorias cat
    ON cr.id_categoria = cat.id_categoria;

-- Executar após a criação: SELECT * FROM vw_contas_pagar
-- Visualizar Nome da conta, descrição, valor, data de vencimento e pagamento
CREATE view vw_contas_pagar AS SELECT
    cat.nome AS categoria,
    cp.descricao,
    cp.valor,
    cp.data_vencimento,
    cp.data_pagamento
FROM contas_pagar cp
JOIN categorias cat
    ON cp.id_categoria = cat.id_categoria;

-- Executar após a criação: SELECT * FROM vw_resumo_financeiro
-- Resumo financeiro e previsão de saldo após debitos e pagamentos
CREATE view vw_resumo_financeiro AS SELECT 
    (SELECT SUM(valor) FROM vw_contas_receber) AS total_a_receber,
    (SELECT SUM(valor) FROM vw_contas_pagar) AS total_a_pagar,
    ( (SELECT COALESCE(SUM(valor), 0) FROM vw_contas_receber) - 
      (SELECT COALESCE(SUM(valor), 0) FROM vw_contas_pagar) ) AS saldo_previsto;
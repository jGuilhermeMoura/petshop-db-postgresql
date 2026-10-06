-- 1. Função para calcular o saldo atual (Apenas com dinheiro que já entrou e saiu de fato)
-- Para visualizar: SELECT calcular_saldo();
CREATE OR REPLACE FUNCTION calcular_saldo()
RETURNS NUMERIC(10,2)
LANGUAGE SQL
AS $$
    SELECT
        COALESCE((
            SELECT SUM(valor)
            FROM contas_receber
            WHERE data_pagamento IS NOT NULL 
        ), 0)
        -
        COALESCE((
            SELECT SUM(valor)
            FROM contas_pagar
            WHERE data_pagamento IS NOT NULL 
        ), 0);
$$;


-- 2. Função para calcular o total de gastos (Tudo que foi lançado para pagar, vencendo ou não)
-- Para visualizar: SELECT calcular_gastos();
CREATE OR REPLACE FUNCTION calcular_gastos()
RETURNS NUMERIC(10,2)
LANGUAGE SQL
AS $$
    SELECT
        COALESCE((
            SELECT SUM(valor)
            FROM contas_pagar
            WHERE data_vencimento IS NOT NULL
        ), 0);
$$;


-- 3. Função para calcular o total de valores em aberto (Inadimplência / Previsão de recebimento)
-- Para visualizar: SELECT calcular_inadimplencia();
CREATE OR REPLACE FUNCTION calcular_inadimplencia()
RETURNS NUMERIC(10,2)
LANGUAGE SQL
AS $$
    SELECT COALESCE(SUM(valor), 0)
    FROM contas_receber
    WHERE data_pagamento IS NULL; 
$$;

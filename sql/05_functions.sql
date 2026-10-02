-- Função para calcular o saldo atual
-- Para visualizar: SELECT calcular_saldo();
CREATE FUNCTION calcular_saldo()
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


-- Função para calcular o total de gastos
-- Para visualizar: SELECT calcular_gastos();
CREATE FUNCTION calcular_gastos()
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


-- Função para calcular o total de valores em aberto
-- Para visualizar: SELECT calcular_inadimplencia();
CREATE OR REPLACE FUNCTION calcular_inadimplencia()
RETURNS NUMERIC(10,2)
LANGUAGE SQL
AS $$
    SELECT COALESCE(SUM(valor), 0)
    FROM contas_receber
    WHERE data_pagamento IS NULL;
$$;

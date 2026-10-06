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


-- 3. Função para calcular o total de valores em aberto (Inadimplência / Previsão de recebimento).
-- Para visualizar: SELECT * FROM calcular_inadimplencia();
CREATE OR REPLACE FUNCTION calcular_inadimplencia()
RETURNS TABLE (
    nome_cliente VARCHAR(100),
    total_inadimplente NUMERIC(10,2)
)
LANGUAGE SQL
AS $$
    SELECT 
        c.nome_cliente,
        COALESCE(SUM(cr.valor), 0)
    FROM contas_receber cr
    INNER JOIN pets p ON p.id_pet = cr.id_pet
    INNER JOIN clientes c ON c.id_cliente = p.id_cliente
    WHERE cr.data_pagamento IS NULL
    GROUP BY c.nome_cliente;
$$;


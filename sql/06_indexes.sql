-- 1. Acelera os relatórios de caixa e funções de inadimplência (evita ler a tabela toda)
CREATE INDEX idx_contas_receber_pagamento 
ON contas_receber (data_pagamento);

-- 2. AJUSTADO: Otimiza o JOIN entre contas_receber e pets (Antes era id_cliente)

CREATE INDEX idx_contas_receber_pet 
ON contas_receber (id_pet);

-- 3. Otimiza o JOIN entre contas_receber e categorias (Mantido)
CREATE INDEX idx_contas_receber_categoria 
ON contas_receber (id_categoria);

-- 4. Otimiza o JOIN entre contas_pagar e categorias (Mantido)
CREATE INDEX idx_contas_pagar_categoria 
ON contas_pagar (id_categoria);

-- 5. NOVO ÍNDICE SUGERIDO: Otimiza o JOIN entre pets e clientes
CREATE INDEX idx_pets_cliente 
ON pets (id_cliente);

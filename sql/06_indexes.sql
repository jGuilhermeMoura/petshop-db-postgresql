-- Acelera os relatórios de caixa e funções de inadimplência (evita ler a tabela toda)
CREATE INDEX idx_contas_receber_pagamento 
ON contas_receber (data_pagamento);

-- Otimiza o JOIN entre contas_receber e clientes
CREATE INDEX idx_contas_receber_cliente 
ON contas_receber (id_cliente);

-- Otimiza o JOIN entre contas_receber e categorias
CREATE INDEX idx_contas_receber_categoria 
ON contas_receber (id_categoria);

-- Otimiza o JOIN entre contas_pagar e categorias
CREATE INDEX idx_contas_pagar_categoria 
ON contas_pagar (id_categoria);

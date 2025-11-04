-- Convertendo a coluna 'Data' para o formato 'DATE'
ALTER TABLE data_clean
MODIFY COLUMN Data DATE;

-- VENDAS POR MÊS

-- Venda total
SELECT MONTH(Data) AS mes, SUM(Quantidade * Preco) as 'Total venda'
FROM data_clean
GROUP BY MONTH(Data)
ORDER BY MONTH(Data);

-- Venda unitária
-- Venda por mês
SELECT MONTH(Data) AS mes, SUM(Quantidade) as 'Unidades vendidas'
FROM data_clean
GROUP BY MONTH(Data)
ORDER BY MONTH(Data);

-- VENDA POR PRODUTO

-- Venda total
SELECT Produto, Categoria, SUM(Quantidade * Preco) as 'Total venda'
FROM data_clean
GROUP BY Produto, Categoria
ORDER BY SUM(Quantidade * Preco) DESC;

-- Venda de unidades
SELECT Produto, Categoria, SUM(Quantidade) as 'Unidades vendidas'
FROM data_clean
GROUP BY Produto, Categoria
ORDER BY SUM(Quantidade) DESC;

-- VENDA POR CATEGORIA

-- Venda total
SELECT Categoria, SUM(Quantidade * Preco) as 'Total venda'
FROM data_clean
GROUP BY Categoria
ORDER BY SUM(Quantidade * Preco) DESC;

-- Venda por unidade
SELECT Categoria, SUM(Quantidade) as 'Unidades vendidas'
FROM data_clean
GROUP BY Categoria
ORDER BY SUM(Quantidade) DESC;
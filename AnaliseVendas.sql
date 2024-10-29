-- Relatório de Vendas por Cliente
SELECT
    a.ClienteID,
    a.Nome, 
    a.Cidade,
    a.Estado,
    SUM(b.Total) AS TotalGasto
FROM 
    Clientes a WITH (NOLOCK)
INNER JOIN 
    Pedidos b ON a.ClienteID = b.ClienteID
GROUP BY 
    a.ClienteID, a.Nome, a.Cidade, a.Estado
ORDER BY 
    TotalGasto DESC


-- Produtos Mais Vendidos
SELECT 
    c.ProdutoID,
    c.NomeProduto,
    c.Categoria,
    SUM(c.Quantidade) AS TotalVendido
FROM 
    ItensPedido c WITH (NOLOCK)
INNER JOIN 
    Produtos d ON c.ProdutoID = d.ProdutoID
GROUP BY 
    c.ProdutoID, c.NomeProduto, c.Categoria
ORDER BY 
    TotalVendido DESC


-- Controle de Estoque
SELECT 
    ProdutoID,
    NomeProduto,
    Estoque
FROM 
    Produtos WITH (NOLOCK)
WHERE
    Estoque <= 5 -- Limite definido para considerar o estoque baixo
ORDER BY 
    Estoque ASC


-- Atualização de Estoque com Base nos Itens do Pedido
UPDATE 
    Produtos
SET 
    Estoque = Estoque - e.Quantidade
FROM 
    Produtos d WITH (NOLOCK)
INNER JOIN 
    ItensPedido e ON d.ProdutoID = e.ProdutoID


-- Detalhamento de Pedidos
SELECT 
    p.PedidoID,    
    c.Nome AS NomeCliente,
    p.DataPedido,    
    pr.NomeProduto,    
    i.Quantidade,    
    i.PrecoUnitario,    
    (i.Quantidade * i.PrecoUnitario) AS TotalItem
FROM 
    Pedidos p
JOIN 
    ItensPedido i ON p.PedidoID = i.PedidoID
JOIN 
    Produtos pr ON i.ProdutoID = pr.ProdutoID
JOIN 
    Clientes c ON p.ClienteID = c.ClienteID
ORDER BY 
    p.DataPedido DESC, p.PedidoID


-- Relatório de Faturamento por Período
SELECT 
    YEAR(p.DataPedido) AS Ano,
    MONTH(p.DataPedido) AS Mes,
    SUM(p.Total) AS FaturamentoMensal
FROM 
    Pedidos p
GROUP BY 
    YEAR(p.DataPedido), MONTH(p.DataPedido)
ORDER BY 
    Ano DESC, Mes DESC

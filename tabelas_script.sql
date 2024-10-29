--***Tabelas do Banco de Dados***
 
 
--> Clientes
 
CREATE TABLE Clientes (
    ClienteID SMALLINT,                    -- Identificador único do cliente
    Nome NVARCHAR(100) NOT NULL,           -- Nome do cliente
    Email NVARCHAR(100),                   -- Email do cliente
    Telefone NVARCHAR(20),                 -- Telefone de contato
    Cidade NVARCHAR(50),                   -- Cidade do cliente
    Estado NVARCHAR(50)                    -- Estado do cliente
)
 
 
--> Produtos
 
CREATE TABLE Produtos (
    ProdutoID SMALLINT,                   -- Identificador único do produto
    NomeProduto NVARCHAR(100) NOT NULL,    -- Nome do produto
    Categoria NVARCHAR(50),                -- Categoria do produto (e.g., Eletrônicos, Acessórios)
    Preco DECIMAL(10, 2) NOT NULL,         -- Preço do produto
    Estoque INT NOT NULL                   -- Quantidade disponível em estoque
)
 
 
--> Pedidos
 
CREATE TABLE Pedidos (
    PedidoID SMALLINT,                     -- Identificador único do pedido
    ClienteID INT,                         -- Relacionamento com o cliente que fez o pedido
    DataPedido DATE NOT NULL,              -- Data em que o pedido foi realizado
    Total DECIMAL(10, 2),                  -- Total do pedido
)
 
--> ItensPedido
 
CREATE TABLE ItensPedido (
    ItemID INT PRIMARY KEY IDENTITY,       -- Identificador único do item no pedido
    PedidoID INT,                          -- Identificador do pedido ao qual o item pertence
    ProdutoID INT,                         -- Identificador do produto
    Quantidade INT NOT NULL,               -- Quantidade de produtos no pedido
    PrecoUnitario DECIMAL(10, 2) NOT NULL, -- Preço unitário do produto no pedido
)

CREATE DATABASE Vendas;
USE Vendas;

CREATE TABLE Endereco (
	id_endereco INT PRIMARY KEY IDENTITY(1,1),
	cidade VARCHAR(50) NOT NULL,
	uf CHAR(2) NOT NULL,
	logradouro VARCHAR(100)
);

CREATE TABLE Categoria (
	id_categoria INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE Status_Pedido (
	id_status_pedido INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(30) NOT NULL
);

CREATE TABLE Cliente (
	id_cliente INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(15)
);

CREATE TABLE Cliente_Endereco(
	tipo_endereco VARCHAR(50) NOT NULL,
	fk_cliente INT NOT NULL,
	fk_endereco INT NOT NULL,

	PRIMARY KEY(fk_cliente, fk_endereco),

	CONSTRAINT fk_cliente_endereco_cliente
		FOREIGN KEY (fk_cliente)
		REFERENCES Cliente (id_cliente),

	CONSTRAINT fk_cliente_endereco_endereco
		FOREIGN KEY (fk_endereco)
		REFERENCES Endereco (id_endereco)
);

CREATE TABLE Pedido (
	id_pedido INT PRIMARY KEY IDENTITY(1,1),
	data_pedido DATETIME2 NOT NULL,
	data_pagamento DATETIME2,
	data_entrega DATETIME2,
	fk_cliente INT NOT NULL,
	fk_status_pedido INT NOT NULL,
	fk_endereco INT NOT NULL,

	CONSTRAINT fk_pedido_cliente 
		FOREIGN KEY (fk_cliente)
		REFERENCES Cliente (id_cliente),

	CONSTRAINT fk_pedido_status 
		FOREIGN KEY (fk_status_pedido)
		REFERENCES Status_Pedido (id_status_pedido),

	CONSTRAINT fk_pedido_endereco 
		FOREIGN KEY (fk_endereco)
		REFERENCES Endereco (id_endereco)
);

CREATE TABLE Produto(
	id_produto INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50) NOT NULL,
	valor_unitario DECIMAL(10,2) NOT NULL,
	fk_categoria INT NOT NULL,

	CONSTRAINT chk_valor_positivo
		CHECK (valor_unitario > 0),

	CONSTRAINT fk_produto_categoria
		FOREIGN KEY (fk_categoria)
		REFERENCES Categoria (id_categoria)
);

CREATE TABLE Item_Pedido (
	id_item_pedido INT PRIMARY KEY IDENTITY(1,1),
	quantidade INT NOT NULL,
	valor_unitario DECIMAL(10,2) NOT NULL,
	fk_pedido INT NOT NULL,
	fk_produto INT NOT NULL,

	CONSTRAINT chk_quantidade_positiva
		CHECK (quantidade > 0),

	CONSTRAINT chk_valorun_positivo
		CHECK (valor_unitario > 0),

	CONSTRAINT fk_item_pedido
		FOREIGN KEY (fk_pedido)
		REFERENCES Pedido (id_pedido),

	CONSTRAINT fk_item_produto
		FOREIGN KEY (fk_produto)
		REFERENCES Produto (id_produto)
);


--Indices para otimizar agregações e consultas
CREATE INDEX idx_cliente_endereco_cliente
ON Cliente_Endereco (fk_cliente)

CREATE INDEX idx_cliente_endereco_endereco
ON Cliente_Endereco (fk_endereco)

CREATE INDEX idx_pedido_cliente
ON Pedido (fk_cliente)

CREATE INDEX idx_pedido_status
ON Pedido (fk_status_pedido)

CREATE INDEX idx_produto_categoria
ON Produto (fk_categoria)

CREATE INDEX idx_pedido_endereco
ON Pedido (fk_endereco)

CREATE INDEX idx_item_pedido
ON Item_Pedido (fk_pedido)

CREATE INDEX idx_item_produto
ON Item_Pedido (fk_produto)


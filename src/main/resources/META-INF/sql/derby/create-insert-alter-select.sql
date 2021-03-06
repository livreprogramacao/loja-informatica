DROP TABLE APP.proposta_produto;
DROP TABLE APP.proposta;
DROP TABLE APP.proposta_status;
DROP TABLE APP.produto;
DROP TABLE APP.fornecedor;
DROP TABLE APP.categoria;
DROP TABLE APP.cliente;
DROP TABLE APP.vendedor;

DROP SEQUENCE APP.vendedor_seq;
DROP SEQUENCE APP.cliente_seq;
DROP SEQUENCE APP.fornecedor_seq;
DROP SEQUENCE APP.categoria_seq;
DROP SEQUENCE APP.produto_seq;
DROP SEQUENCE APP.proposta_seq;
DROP SEQUENCE APP.proposta_status_seq;
DROP SEQUENCE APP.proposta_produto_seq;

CREATE TABLE APP.vendedor (id integer NOT NULL CONSTRAINT vendedor_pk PRIMARY KEY, nome VARCHAR (30), obs VARCHAR (30));
CREATE TABLE APP.cliente (id integer GENERATED ALWAYS AS IDENTITY NOT NULL CONSTRAINT cliente_pk PRIMARY KEY, vendedor_id integer, nome VARCHAR (30));
CREATE TABLE APP.fornecedor (id integer GENERATED ALWAYS AS IDENTITY NOT NULL CONSTRAINT fornecedor_pk PRIMARY KEY, nome VARCHAR (30));
CREATE TABLE APP.categoria (id integer NOT NULL CONSTRAINT categoria_pk PRIMARY KEY, nome VARCHAR (30));
CREATE TABLE APP.produto (id integer GENERATED ALWAYS AS IDENTITY NOT NULL CONSTRAINT produto_pk PRIMARY KEY, fornecedor_id integer, categoria_id integer, nome VARCHAR (30), preço double);
CREATE TABLE APP.proposta (id integer GENERATED ALWAYS AS IDENTITY NOT NULL CONSTRAINT proposta_pk PRIMARY KEY, cliente_id integer, proposta_status_id integer, data_criacao date, total double);
CREATE TABLE APP.proposta_status (id integer GENERATED ALWAYS AS IDENTITY NOT NULL CONSTRAINT proposta_status_pk PRIMARY KEY, status VARCHAR (30));
CREATE TABLE APP.proposta_produto (id integer GENERATED ALWAYS AS IDENTITY NOT NULL CONSTRAINT proposta_produto_pk PRIMARY KEY, proposta_id integer, produto_id integer, quantidade double, valor double);

ALTER TABLE APP.cliente ADD CONSTRAINT vendedor_fk Foreign Key (vendedor_id) REFERENCES APP.vendedor (id);
ALTER TABLE APP.produto ADD CONSTRAINT fornecedor_fk Foreign Key (fornecedor_id) REFERENCES APP.fornecedor (id);
ALTER TABLE APP.produto ADD CONSTRAINT categoria_fk Foreign Key (categoria_id) REFERENCES APP.categoria (id);
ALTER TABLE APP.proposta ADD CONSTRAINT proposta_cliente_fk Foreign Key (cliente_id) REFERENCES APP.cliente (id);
ALTER TABLE APP.proposta ADD CONSTRAINT proposta_status_fk Foreign Key (proposta_status_id) REFERENCES APP.proposta_status (id);
ALTER TABLE APP.proposta_produto ADD CONSTRAINT proposta_fk Foreign Key (proposta_id) REFERENCES APP.proposta (id);
ALTER TABLE APP.proposta_produto ADD CONSTRAINT produto_fk Foreign Key (produto_id) REFERENCES APP.produto (id);

INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.vendedor (id, nome) VALUES (NEXT VALUE FOR vendedor_seq, 'Carina');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.cliente (vendedor_id, nome) VALUES (1, 'Fabio');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.fornecedor (nome) VALUES ('Casas Bahia');
INSERT INTO APP.categoria (id, nome) VALUES (1, 'genérico');
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.produto (fornecedor_id, categoria_id, nome, preço) VALUES (1, 1, 'Ventilador', 1.99);
INSERT INTO APP.proposta_status (status) VALUES ('ORÇAMENTO');
INSERT INTO APP.proposta_status (status) VALUES ('APROVAÇÃO');
INSERT INTO APP.proposta_status (status) VALUES ('COMPRA');
INSERT INTO APP.proposta_status (status) VALUES ('BUSCA DE FORNECEDORES');
INSERT INTO APP.proposta_status (status) VALUES ('AVALIAÇÃO TÉCNICA');
INSERT INTO APP.proposta_status (status) VALUES ('ENTREGA');
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 1.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 2.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 3.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 4.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 5.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 6.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 7.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 8.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 9.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 10.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 11.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 12.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 13.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 14.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 15.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 16.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 17.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 18.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 19.99);
INSERT INTO APP.proposta (cliente_id, proposta_status_id, data_criacao, total) VALUES (1, 1, '2015-02-13', 20.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (1, 1, 1.0, 1.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (2, 2, 2.0, 2.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (3, 3, 3.0, 3.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (4, 4, 4.0, 4.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (5, 5, 5.0, 5.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (6, 6, 6.0, 6.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (7, 7, 7.0, 7.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (8, 8, 8.0, 8.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (9, 9, 9.0, 9.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (10, 10, 10.0, 10.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (11, 11, 11.0, 11.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (12, 12, 12.0, 12.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (13, 13, 13.0, 13.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (14, 14, 14.0, 14.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (15, 15, 15.0, 15.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (16, 16, 16.0, 16.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (17, 17, 17.0, 17.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (18, 18, 18.0, 18.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (19, 19, 19.0, 19.99);
INSERT INTO APP.proposta_produto (proposta_id, produto_id, quantidade, valor) VALUES (20, 20, 20.0, 20.99);

UPDATE APP.vendedor SET nome = CAST (id AS CHAR(2)) || ' - ' || nome, obs = 'vazio';
UPDATE APP.cliente SET nome = CAST (id AS CHAR(2)) || ' - ' || nome;
UPDATE APP.fornecedor SET nome = CAST (id AS CHAR(2)) || ' - ' || nome;
UPDATE APP.categoria SET nome = CAST (id AS CHAR(2)) || ' - ' || nome;
UPDATE APP.produto SET nome = CAST (id AS CHAR(2)) || ' - ' || nome;

SELECT * FROM  APP.vendedor;
SELECT * FROM  APP.cliente;
SELECT * FROM  APP.proposta;
SELECT * FROM  APP.proposta_status;
SELECT * FROM  APP.proposta_produto;
SELECT * FROM  APP.produto;
SELECT * FROM  APP.categoria;
SELECT * FROM  APP.fornecedor;
CREATE TABLE APP.vendedor (id integer NOT NULL CONSTRAINT vendedor_pk PRIMARY KEY, nome VARCHAR (30), observacao VARCHAR (30))
CREATE TABLE APP.cliente (id integer NOT NULL CONSTRAINT cliente_pk PRIMARY KEY, vendedor_id integer, nome VARCHAR (30))
CREATE TABLE APP.fornecedor (id integer NOT NULL CONSTRAINT fornecedor_pk PRIMARY KEY, nome VARCHAR (30))
CREATE TABLE APP.categoria (id integer NOT NULL CONSTRAINT categoria_pk PRIMARY KEY, nome VARCHAR (30))
CREATE TABLE APP.produto (id integer NOT NULL CONSTRAINT produto_pk PRIMARY KEY, fornecedor_id integer, categoria_id integer, nome VARCHAR (30), preco double)
CREATE TABLE APP.proposta (id integer NOT NULL CONSTRAINT proposta_pk PRIMARY KEY, cliente_id integer, proposta_status_id integer, data_criacao date, total double)
CREATE TABLE APP.proposta_status (id integer NOT NULL CONSTRAINT proposta_status_pk PRIMARY KEY, status VARCHAR (30))
CREATE TABLE APP.proposta_produto (id integer NOT NULL CONSTRAINT proposta_produto_pk PRIMARY KEY, proposta_id integer, produto_id integer, quantidade double, valor double)

CREATE SEQUENCE APP.vendedor_seq AS bigint START WITH 1 INCREMENT BY 1
CREATE SEQUENCE APP.cliente_seq AS bigint START WITH 1 INCREMENT BY 1
CREATE SEQUENCE APP.fornecedor_seq AS bigint START WITH 1 INCREMENT BY 1
CREATE SEQUENCE APP.categoria_seq AS bigint START WITH 1 INCREMENT BY 1
CREATE SEQUENCE APP.produto_seq AS bigint START WITH 1 INCREMENT BY 1
CREATE SEQUENCE APP.proposta_seq AS bigint START WITH 1 INCREMENT BY 1
CREATE SEQUENCE APP.proposta_status_seq AS bigint START WITH 1 INCREMENT BY 1
CREATE SEQUENCE APP.proposta_produto_seq AS bigint START WITH 1 INCREMENT BY 1

ALTER TABLE APP.cliente ADD CONSTRAINT vendedor_fk Foreign Key (vendedor_id) REFERENCES APP.vendedor (id)
ALTER TABLE APP.produto ADD CONSTRAINT fornecedor_fk Foreign Key (fornecedor_id) REFERENCES APP.fornecedor (id)
ALTER TABLE APP.produto ADD CONSTRAINT categoria_fk Foreign Key (categoria_id) REFERENCES APP.categoria (id)
ALTER TABLE APP.proposta ADD CONSTRAINT proposta_cliente_fk Foreign Key (cliente_id) REFERENCES APP.cliente (id)
ALTER TABLE APP.proposta ADD CONSTRAINT proposta_status_fk Foreign Key (proposta_status_id) REFERENCES APP.proposta_status (id)
ALTER TABLE APP.proposta_produto ADD CONSTRAINT proposta_fk Foreign Key (proposta_id) REFERENCES APP.proposta (id)
ALTER TABLE APP.proposta_produto ADD CONSTRAINT produto_fk Foreign Key (produto_id) REFERENCES APP.produto (id)
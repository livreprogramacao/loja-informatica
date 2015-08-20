/*

Depois que executar o SQL verificar os erros assim:

1. Salvar a saída deste SQL no arquivo sql/saida-postgresql-create-tables.txt
2. mudar o diretorio atual
    cd ~/j/workspace/NetBeansProjects/waretech.com.br/loja/src/main/resource
3. Filtrar linhas
    $ grep -v -F -i "não existe" sql/saida-postgresql-create-tables.txt | grep -v -F -i "afetadas" > sql/saida-postgresql-create-tables-filtrado.txt
4. verificar os erros e ajustar com o comando: %s/\"$\n/" --> /g e ordenar.
    $ gvim sql/saida-postgresql-create-tables-filtrado.txt

*/

-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';h
-- SET
CREATE TABLE "loja"."atividade_economica"
 (
	"id"			bigserial,
	"codigo"			VARCHAR (30),
	"descricao"			VARCHAR (100),
	"tabela_preco"			VARCHAR (20),
	"padrao"			BOOL NOT NULL,
	"dt_alteracao"			TIMESTAMP WITHOUT TIME ZONE,
	"usuario_id"			bigint
);

COMMENT ON COLUMN "loja"."atividade_economica"."codigo" IS 'Código de identificação da Atividade Econômica.';

COMMENT ON COLUMN "loja"."atividade_economica"."descricao" IS 'Descrição da Atividade Econômica.';

COMMENT ON COLUMN "loja"."atividade_economica"."tabela_preco" IS 'Indica qual a tabela de preços padrão a ser aplicada na venda.';

COMMENT ON COLUMN "loja"."atividade_economica"."padrao" IS 'Padrão do Sistema';

COMMENT ON COLUMN "loja"."atividade_economica"."dt_alteracao" IS 'Data da alteracação';

COMMENT ON COLUMN "loja"."atividade_economica"."usuario_id" IS 'Usuário que modificou';

-- CREATE INDEXES ...
ALTER TABLE "loja"."atividade_economica" ADD CONSTRAINT "atveconomica_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "atveconomica_ID_idx" ON "loja"."atividade_economica" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/atveconomica.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "loja"."classificacao_fiscal"
 (
	"id"			bigserial,
	"codigo"		VARCHAR (24),
	"descricao"		VARCHAR (100),
	"ordem"		VARCHAR (4),
	"padrao"		BOOL NOT NULL,
	"datamod"		TIMESTAMP WITHOUT TIME ZONE,
	"user"		VARCHAR (30)
);

COMMENT ON COLUMN "loja"."classificacao_fiscal"."codigo" IS 'Código de Classificação Fiscal NCM';

COMMENT ON COLUMN "loja"."classificacao_fiscal"."descricao" IS 'Descrição da Classificação Fiscal NCM';

COMMENT ON COLUMN "loja"."classificacao_fiscal"."ordem" IS 'Identificador Único do Código';

COMMENT ON COLUMN "loja"."classificacao_fiscal"."padrao" IS 'Padrão do Sistema';

COMMENT ON COLUMN "loja"."classificacao_fiscal"."datamod" IS 'Data';

COMMENT ON COLUMN "loja"."classificacao_fiscal"."user" IS 'Usuário';

-- CREATE INDEXES ...
ALTER TABLE "loja"."classificacao_fiscal" ADD CONSTRAINT "classfiscal_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "classfiscal_ID_idx" ON "loja"."classificacao_fiscal" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/classfiscal.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."classfiscal_substituicao"
 (
	"id"			bigserial,
	"codigo"			VARCHAR (100),
	"rdncm"			VARCHAR (40),
	"rdreducao"			DOUBLE PRECISION,
	"rdicms"			DOUBLE PRECISION,
	"rdvaloragregado"			DOUBLE PRECISION,
	"rdoperacaopropria"			DOUBLE PRECISION,
	"rdcodtributacao"			VARCHAR (6),
	"rdempresaid"			INTEGER
);

COMMENT ON COLUMN "contabil"."classfiscal_substituicao"."codigo" IS 'Região do Pais';

COMMENT ON COLUMN "contabil"."classfiscal_substituicao"."rdncm" IS 'Código do Produto';

COMMENT ON COLUMN "contabil"."classfiscal_substituicao"."rdreducao" IS 'Percentual de Redução';

COMMENT ON COLUMN "contabil"."classfiscal_substituicao"."rdicms" IS 'Taxa de ICMS normal da Região';

COMMENT ON COLUMN "contabil"."classfiscal_substituicao"."rdvaloragregado" IS 'Porcentagem de Valor Agregado';

COMMENT ON COLUMN "contabil"."classfiscal_substituicao"."rdoperacaopropria" IS 'Porcentagem de Operação Própria';

COMMENT ON COLUMN "contabil"."classfiscal_substituicao"."rdcodtributacao" IS 'Código da Tributação Referente ao estado';

-- CREATE INDEXES ...
ALTER TABLE "contabil"."classfiscal_substituicao" ADD CONSTRAINT "classfiscal_substituicao_pkey" PRIMARY KEY ("codigo", "rdncm");

CREATE INDEX "classfiscal_substituicao_rdemrpesaid_idx" ON "contabil"."classfiscal_substituicao" ("rdempresaid");

CREATE INDEX "classfiscal_substituicao_ID_idx" ON "contabil"."classfiscal_substituicao" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/classfiscal_substituicao.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."codtributorigem"
 (
	"codigo"			VARCHAR (6),
	"id"			bigserial,
	"ctbdescricao"			VARCHAR (160),
	"padrao"			BOOL NOT NULL
);

COMMENT ON COLUMN "contabil"."codtributorigem"."codigo" IS 'Código de Tributação de Origem.';

COMMENT ON COLUMN "contabil"."codtributorigem"."ctbdescricao" IS 'Descrição do código de tributação de origem.';

COMMENT ON COLUMN "contabil"."codtributorigem"."padrao" IS 'Padrão do Sistema';

-- CREATE INDEXES ...
CREATE INDEX "codtributorigem_CodTrib_idx" ON "contabil"."codtributorigem" ("codigo");

ALTER TABLE "contabil"."codtributorigem" ADD CONSTRAINT "codtributorigem_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "codtributorigem_ID_idx" ON "contabil"."codtributorigem" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/codtributorigem.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."condpagto"
 (
	"id"			bigserial,
	"codigo"		VARCHAR (40),
	"cpgdescricao"		VARCHAR (140),
	"cpgencargos"		DOUBLE PRECISION,
	"cpgparcelas"		INTEGER,
	"cpgsumpercent"		DOUBLE PRECISION,
	"padrão"		BOOL NOT NULL,
	"cpgoperador"		VARCHAR (30),
	"cpgdatamod"		DATE,
	"cpgweb"		BOOL NOT NULL
);

COMMENT ON COLUMN "telemarketing"."condpagto"."codigo" IS 'Código de identificação da condição de pagamento.';

COMMENT ON COLUMN "telemarketing"."condpagto"."cpgdescricao" IS 'Descrição da condição de pagamento.';

COMMENT ON COLUMN "telemarketing"."condpagto"."cpgencargos" IS 'Encargos financeiros da condição de pagamento.';

COMMENT ON COLUMN "telemarketing"."condpagto"."cpgparcelas" IS 'Quantidades de parcelas da condição de pagamento.';

COMMENT ON COLUMN "telemarketing"."condpagto"."cpgsumpercent" IS 'Soma total dos percentuais das parcelas.';

COMMENT ON COLUMN "telemarketing"."condpagto"."padrão" IS 'Padrão do Sistema';

COMMENT ON COLUMN "telemarketing"."condpagto"."cpgoperador" IS 'Operador';

COMMENT ON COLUMN "telemarketing"."condpagto"."cpgdatamod" IS 'Data da alteracação';

COMMENT ON COLUMN "telemarketing"."condpagto"."cpgweb" IS 'Identifica se a Condição de Pagamento está disponível na Web';

-- CREATE INDEXES ...
CREATE INDEX "condpagto_cpgdescricao_idx" ON "telemarketing"."condpagto" ("cpgdescricao");

ALTER TABLE "telemarketing"."condpagto" ADD CONSTRAINT "condpagto_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "condpagto_ID_idx" ON "telemarketing"."condpagto" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/condpagto.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."funcionario_cargo"
 (
	"id"			bigserial,
	"codigo"			SERIAL,
	"carcod"			VARCHAR (20),
	"cardesc"			VARCHAR (100),
	"carvalorhora"			DOUBLE PRECISION,
	"Padrao"			BOOL NOT NULL
);

COMMENT ON COLUMN "pessoa"."funcionario_cargo"."codigo" IS 'Contador';

COMMENT ON COLUMN "pessoa"."funcionario_cargo"."carcod" IS 'Código do Cargo';

COMMENT ON COLUMN "pessoa"."funcionario_cargo"."cardesc" IS 'Descrição do Cargo';

COMMENT ON COLUMN "pessoa"."funcionario_cargo"."carvalorhora" IS 'Valor Médio da Hora';

COMMENT ON COLUMN "pessoa"."funcionario_cargo"."Padrao" IS 'Registro Padrão';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "funcionariocargos_codigo_idx" ON "pessoa"."funcionario_cargo" ("codigo");

ALTER TABLE "pessoa"."funcionario_cargo" ADD CONSTRAINT "funcionariocargos_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "funcionariocargos_ID_idx" ON "pessoa"."funcionario_cargo" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/funcionariocargos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."moeda"
 (
	"codigo"			VARCHAR (20),
	"moedadescricao"			VARCHAR (100),
	"id"			bigserial,
	"padrao"			BOOL NOT NULL
);

COMMENT ON COLUMN "compras"."moeda"."codigo" IS 'Código de identificação da moeda.';

COMMENT ON COLUMN "compras"."moeda"."moedadescricao" IS 'Descrição da moeda.';

COMMENT ON COLUMN "compras"."moeda"."padrao" IS 'Padrão do Sistema';

-- CREATE INDEXES ...
ALTER TABLE "compras"."moeda" ADD CONSTRAINT "moedas_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "moedas_ID_idx" ON "compras"."moeda" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/moedas.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."natureza_operacao_codigo"
 (
	"codigo"			VARCHAR (8) NOT NULL,
	"codnatdesc"			VARCHAR (200),
	"codnataliq"			DOUBLE PRECISION,
	"codnatcfop"			VARCHAR (100)
);

-- CREATE INDEXES ...
ALTER TABLE "contabil"."natureza_operacao_codigo" ADD CONSTRAINT "naturezaoperacaocodigos_pkey" PRIMARY KEY ("codigo");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/naturezaoperacaocodigos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."pais"
 (
	"id"			bigserial,
	"paisnome"			VARCHAR (100),
	"codigo"			VARCHAR (6)
);

COMMENT ON COLUMN "pessoa"."pais"."paisnome" IS 'Nome do pais';

COMMENT ON COLUMN "pessoa"."pais"."codigo" IS 'sigla do pais com 3 letras';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "pais_cidnome_idx" ON "pessoa"."pais" ("paisnome");

ALTER TABLE "pessoa"."pais" ADD CONSTRAINT "pais_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "pais_ID_idx" ON "pessoa"."pais" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/pais.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."regiao"
 (
	"codigo"			VARCHAR (30),
	"regdescricao"			VARCHAR (160),
	"padrao"			BOOL NOT NULL,
	"id"			bigserial
);

COMMENT ON COLUMN "pessoa"."regiao"."codigo" IS 'Código de identificação da região.';

COMMENT ON COLUMN "pessoa"."regiao"."regdescricao" IS 'Descrição da região.';

COMMENT ON COLUMN "pessoa"."regiao"."padrao" IS 'Registro Padrão';

-- CREATE INDEXES ...
ALTER TABLE "pessoa"."regiao" ADD CONSTRAINT "regiao_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "regiao_ID_idx" ON "pessoa"."regiao" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/regiao.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "deposito"."estoque"
 (
	"id"			bigserial,
	"codigo"		VARCHAR (60),
	"padrao"		BOOL NOT NULL
);

COMMENT ON COLUMN "deposito"."estoque"."codigo" IS 'Tipo de Status de Estoque.';
COMMENT ON COLUMN "deposito"."estoque"."padrao" IS 'Registro Padrão do sistema';

-- CREATE INDEXES ...
ALTER TABLE "deposito"."estoque" ADD CONSTRAINT "codigo_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "codigo_ID_idx" ON "deposito"."estoque" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/status.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "servicos"."undmedida"
 (
	"id"			bigserial,
	"codigo"		VARCHAR (20),
	"unddescricao"		VARCHAR (60),
	"padrao"		BOOL NOT NULL
);

COMMENT ON COLUMN "servicos"."undmedida"."codigo" IS 'Código de identificação da Unidade de Medida.';
COMMENT ON COLUMN "servicos"."undmedida"."unddescricao" IS 'Descrição da Unidade de Medida.';
COMMENT ON COLUMN "servicos"."undmedida"."padrao" IS 'Padrão do Sistema';

-- CREATE INDEXES ...
ALTER TABLE "servicos"."undmedida" ADD CONSTRAINT "undmedida_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "undmedida_ID_idx" ON "servicos"."undmedida" ("id");

-- CREATE Relationships ...
--sql script successful >>> /tmp/qbdados/1/undmedida.sql












































































-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."aliquota"
 (
	"alpais"			VARCHAR (6),
	"codigo"			VARCHAR (4),
	"alestado"			VARCHAR (100),
	"alicms"			DOUBLE PRECISION,
	"aldatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"id"			bigserial,
	"aluser"			VARCHAR (30),
	"alicmscompra"			DOUBLE PRECISION
);

COMMENT ON COLUMN "contabil"."aliquota"."codigo" IS 'Sigla de identificação do estado.';

COMMENT ON COLUMN "contabil"."aliquota"."alestado" IS 'Nome completo do estado.';

COMMENT ON COLUMN "contabil"."aliquota"."alicms" IS 'Percentual da alíquota de ICMS.';

COMMENT ON COLUMN "contabil"."aliquota"."aldatamod" IS 'Data modificação';

COMMENT ON COLUMN "contabil"."aliquota"."aluser" IS 'Usuário';

COMMENT ON COLUMN "contabil"."aliquota"."alicmscompra" IS 'Percentual da alíquota de ICMS nas compras interestaduais';

-- CREATE INDEXES ...
ALTER TABLE "contabil"."aliquota" ADD CONSTRAINT "aliquota_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "aliquota_ID_idx" ON "contabil"."aliquota" ("id");

-- CREATE Relationships ...
ALTER TABLE "contabil"."aliquota" ADD CONSTRAINT "aliquota_alpais_fk" FOREIGN KEY ("alpais") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/aliquota.sql


-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."cidade"
 (
	"id"			bigserial,
	"ciduf"			VARCHAR (4),
	"cidnome"			VARCHAR (160),
	"codigo"			SERIAL,
	"cidCod"			VARCHAR (14),
	"cidCodUf"			VARCHAR (4)
);

COMMENT ON COLUMN "pessoa"."cidade"."cidnome" IS 'Nome da Cidade.';

-- CREATE INDEXES ...
CREATE INDEX "cidade_codigo_idx" ON "pessoa"."cidade" ("codigo");

CREATE INDEX "cidade_cidnome_idx" ON "pessoa"."cidade" ("cidnome");

ALTER TABLE "pessoa"."cidade" ADD CONSTRAINT "cidade_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "cidade_ID_idx" ON "pessoa"."cidade" ("id");

-- CREATE Relationships ...
-- Relationship from "pessoa"."cidade" ("ciduf") to "contabil"."aliquota"("codigo") does not enforce integrity.
--sql script successful >>> /tmp/qbdados/2/cidade.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."contato"
 (
	"Gen_ctclifoto"			INTEGER,
	"ctcodigo"			VARCHAR (32),
	"id"			bigserial,
	"ctclinome"			VARCHAR (160),
	"ctclifuncao"			VARCHAR (100),
	"ctcliramal"			VARCHAR (16),
	"ctclifoneres"			VARCHAR (16),
	"ctclimala"			BOOL NOT NULL,
	"ctclinascimento"			TIMESTAMP WITHOUT TIME ZONE,
	"ctclisexo"			VARCHAR (20),
	"ctcliuser"			VARCHAR (30),
	"ctclidatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"ctclifoto"			BYTEA,
	"ctcliemail"			VARCHAR (100),
	"ctclifax"			VARCHAR (16),
	"ctcliddd"			VARCHAR (12)
);

COMMENT ON COLUMN "pessoa"."contato"."ctcodigo" IS 'Código de identificação do cliente.';

COMMENT ON COLUMN "pessoa"."contato"."ctclinome" IS 'Nome Completo.';

COMMENT ON COLUMN "pessoa"."contato"."ctclifuncao" IS 'Função ou Cargo na empresa.';

COMMENT ON COLUMN "pessoa"."contato"."ctcliramal" IS 'Número do ramal.';

COMMENT ON COLUMN "pessoa"."contato"."ctclifoneres" IS 'Número do telefone particular.';

COMMENT ON COLUMN "pessoa"."contato"."ctclimala" IS 'Incluir o nome para Mala Direta?';

COMMENT ON COLUMN "pessoa"."contato"."ctclinascimento" IS 'Data de Aniversário.';

COMMENT ON COLUMN "pessoa"."contato"."ctclisexo" IS 'Sexo.';

COMMENT ON COLUMN "pessoa"."contato"."ctcliuser" IS 'Usuário modificou';

COMMENT ON COLUMN "pessoa"."contato"."ctclidatamod" IS 'Data Modificação';

COMMENT ON COLUMN "pessoa"."contato"."ctclifoto" IS 'Foto da Pessoa';

COMMENT ON COLUMN "pessoa"."contato"."ctcliemail" IS 'Endereço de correio eletrônico na Internet.';

COMMENT ON COLUMN "pessoa"."contato"."ctclifax" IS 'Telefone de Fax';

COMMENT ON COLUMN "pessoa"."contato"."ctcliddd" IS 'DDD do Contato';

-- CREATE INDEXES ...
CREATE INDEX "clientecontatos_CGC/CPF_idx" ON "pessoa"."contato" ("ctcodigo");

CREATE INDEX "clientecontatos_ctclinome_idx" ON "pessoa"."contato" ("ctclinome", "ctcodigo");

CREATE INDEX "clientecontatos_Nome_idx" ON "pessoa"."contato" ("ctclinome");

ALTER TABLE "pessoa"."contato" ADD CONSTRAINT "clientecontatos_pkey" PRIMARY KEY ("ctcodigo", "ctclinome");

CREATE INDEX "clientecontatos_ID_idx" ON "pessoa"."contato" ("id");

-- CREATE Relationships ...
--ALTER TABLE "pessoa"."contato" ADD CONSTRAINT "clientecontatos_ctcodigo_fk" FOREIGN KEY ("ctcodigo") REFERENCES "pessoa"."cliente"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/clientecontatos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."funcionario"
 (
	"Gen_funcfoto"			INTEGER,
	"codigo"			VARCHAR (30),
	"id"			bigserial,
	"funcapelido"			VARCHAR (100),
	"funcnome"			VARCHAR (160),
	"funccargo"			VARCHAR (60),
	"funcend"			VARCHAR (160),
	"funcnumero"			VARCHAR (10),
	"funccomplemento"			VARCHAR (80),
	"funcpais"			VARCHAR (80),
	"funcbairro"			VARCHAR (100),
	"funccidade"			VARCHAR (100),
	"funcuf"			VARCHAR (4),
	"funccep"			VARCHAR (20),
	"funcddd"			VARCHAR (12),
	"funcfone"			VARCHAR (22),
	"funcnascimento"			DATE,
	"funcsalario"			DOUBLE PRECISION,
	"funcvenda"			BOOL NOT NULL,
	"funcativo"			BOOL NOT NULL,
	"funcautoriza"			BOOL NOT NULL,
	"padrao"			BOOL NOT NULL,
	"funcemail"			VARCHAR (100),
	"funcoperador"			VARCHAR (30),
	"funcdatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"funcarea"			INTEGER,
	"funchoras"			INTEGER,
	"funcvalorhora"			DOUBLE PRECISION,
	"funcfoto"			BYTEA
);

COMMENT ON COLUMN "pessoa"."funcionario"."codigo" IS 'Código de identificação do funcionário.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcapelido" IS 'Nome pelo qual é mais conhecido.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcnome" IS 'Nome completo.';

COMMENT ON COLUMN "pessoa"."funcionario"."funccargo" IS 'Cargo ou Função na empresa.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcend" IS 'Endereço.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcbairro" IS 'Bairro.';

COMMENT ON COLUMN "pessoa"."funcionario"."funccidade" IS 'Cidade.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcuf" IS 'Estado.';

COMMENT ON COLUMN "pessoa"."funcionario"."funccep" IS 'Código de endereçamento postal.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcddd" IS 'Código de DDD';

COMMENT ON COLUMN "pessoa"."funcionario"."funcfone" IS 'Número do telefone.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcnascimento" IS 'Data de nascimento.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcsalario" IS 'Remuneração mensal.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcvenda" IS 'Determina se o funcionário faz parte da equipe de vendas.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcativo" IS 'Determina se o funcionário é ativo ou não.';

COMMENT ON COLUMN "pessoa"."funcionario"."funcautoriza" IS 'Determina se o usuário pode autorizar vendas fora do padrão';

COMMENT ON COLUMN "pessoa"."funcionario"."padrao" IS 'Padrão do Sistema';

COMMENT ON COLUMN "pessoa"."funcionario"."funcemail" IS 'Endereço de correio eletrônico na Internet';

COMMENT ON COLUMN "pessoa"."funcionario"."funcoperador" IS 'Operador';

COMMENT ON COLUMN "pessoa"."funcionario"."funcdatamod" IS 'Data da última modificação';

COMMENT ON COLUMN "pessoa"."funcionario"."funcarea" IS 'Determina a área de serviços do funcionário.';

COMMENT ON COLUMN "pessoa"."funcionario"."funchoras" IS 'Número de horas mês de trabalho';

COMMENT ON COLUMN "pessoa"."funcionario"."funcvalorhora" IS 'Valor da hora de trabalho';

COMMENT ON COLUMN "pessoa"."funcionario"."funcfoto" IS 'Foto da Pessoa';

-- CREATE INDEXES ...
CREATE INDEX "funcionario_Apelido_idx" ON "pessoa"."funcionario" ("funcapelido");

CREATE INDEX "funcionario_Cargo_idx" ON "pessoa"."funcionario" ("funccargo");

CREATE INDEX "funcionario_CódigoPostal_idx" ON "pessoa"."funcionario" ("funccep");

CREATE UNIQUE INDEX "funcionario_Endereço_idx" ON "pessoa"."funcionario" ("funcend");

CREATE UNIQUE INDEX "funcionario_Funcionário_idx" ON "pessoa"."funcionario" ("funcnome");

CREATE UNIQUE INDEX "funcionario_Matrícula_idx" ON "pessoa"."funcionario" ("codigo");

ALTER TABLE "pessoa"."funcionario" ADD CONSTRAINT "funcionario_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "funcionario_ID_idx" ON "pessoa"."funcionario" ("id");

-- CREATE Relationships ...
ALTER TABLE "pessoa"."funcionario" ADD CONSTRAINT "funcionario_funcuf_fk" FOREIGN KEY ("funcuf") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."funcionario" ADD CONSTRAINT "funcionario_funcarea_fk" FOREIGN KEY ("funcarea") REFERENCES "pessoa"."funcionario_cargo"("codigo") ON UPDATE CASCADE;

-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."cliente"
 (
	"codigo"			VARCHAR (32),
	"clijuridica"			BOOL NOT NULL,
	"clicodigo"			VARCHAR (20),
	"clirsocial"			VARCHAR (120),
	"clifantasia"			VARCHAR (120),
	"clieconomica"			VARCHAR (30),
	"cliendereco"			VARCHAR (110),
	"clinumero"			VARCHAR (10),
	"clicomplemento"			VARCHAR (60),
	"clibairro"			VARCHAR (80),
	"clicep"			VARCHAR (18),
	"clipais"			VARCHAR (80),
	"cliuf"			VARCHAR (4),
	"clicidade"			VARCHAR (100),
	"cliddd"			VARCHAR (12),
	"clifone01"			VARCHAR (22),
	"clifone02"			VARCHAR (22),
	"clifax"			VARCHAR (22),
	"clienderecocob"			VARCHAR (110),
	"clinumcob"			VARCHAR (10),
	"clibairrocob"			VARCHAR (80),
	"clicomplecob"			VARCHAR (60),
	"clipaiscob"			VARCHAR (100),
	"cliufcob"			VARCHAR (4),
	"clicidadecob"			VARCHAR (100),
	"clicepcob"			VARCHAR (18),
	"clienderecoent"			VARCHAR (110),
	"clinument"			VARCHAR (10),
	"clibairroent"			VARCHAR (80),
	"clicompleent"			VARCHAR (60),
	"clipaisent"			VARCHAR (100),
	"cliufent"			VARCHAR (4),
	"clicidadeent"			VARCHAR (100),
	"clicepent"			VARCHAR (18),
	"cliinsestadual"			VARCHAR (40),
	"cliinsminicipal"			VARCHAR (30),
	"cliemail"			VARCHAR (120),
	"cliobs"			TEXT,
	"cliregiao"			VARCHAR (30),
	"clicontribuinte"			BOOL NOT NULL,
	"cliativo"			BOOL NOT NULL,
	"clichkcgc"			BOOL NOT NULL,
	"clitxtcgc"			VARCHAR (80),
	"clisite"			VARCHAR (100),
	"cliconsfinal"			BOOL NOT NULL,
	"clidiretorio"			VARCHAR (100),
	"clicredito"			DOUBLE PRECISION,
	"clipedido"			DOUBLE PRECISION,
	"clidevedor"			DOUBLE PRECISION,
	"clivendedor"			VARCHAR (100),
	"clitransportadora"			INTEGER,
	"clidesconto"			REAL,
	"clicondpagto"			VARCHAR (40),
	"clicomissao"			REAL,
	"clioperador"			VARCHAR (30),
	"clidatamodificacao"			TIMESTAMP WITHOUT TIME ZONE,
	"cligerente"			VARCHAR (100),
	"clicadastro"			DATE,
	"cliexpira"			SMALLINT,
	"clireservamod"			VARCHAR (100),
	"Gen_cliobs"			INTEGER,
	"id"			bigserial
);

COMMENT ON COLUMN "pessoa"."cliente"."codigo" IS 'Número do CGC ou do CPF.';

COMMENT ON COLUMN "pessoa"."cliente"."clijuridica" IS 'Determina se Pessoa Jurídica ou Pessoa Física.';

COMMENT ON COLUMN "pessoa"."cliente"."clirsocial" IS 'Razão Social.';

COMMENT ON COLUMN "pessoa"."cliente"."clifantasia" IS 'Nome Fantasia.';

COMMENT ON COLUMN "pessoa"."cliente"."clieconomica" IS 'Identifica o código de atividade econômica.';

COMMENT ON COLUMN "pessoa"."cliente"."cliendereco" IS 'Endereço';

COMMENT ON COLUMN "pessoa"."cliente"."clinumero" IS 'Número do endereço padrão do cliente.';

COMMENT ON COLUMN "pessoa"."cliente"."clibairro" IS 'Bairro.';

COMMENT ON COLUMN "pessoa"."cliente"."clicep" IS 'Código de endereçamento postal.';

COMMENT ON COLUMN "pessoa"."cliente"."clipais" IS 'Pais de cadastro';

COMMENT ON COLUMN "pessoa"."cliente"."cliuf" IS 'Sigla do Estado.';

COMMENT ON COLUMN "pessoa"."cliente"."clicidade" IS 'Cidade.';

COMMENT ON COLUMN "pessoa"."cliente"."cliddd" IS 'Código de DDD.';

COMMENT ON COLUMN "pessoa"."cliente"."clifone01" IS 'Número do telefone';

COMMENT ON COLUMN "pessoa"."cliente"."clifone02" IS 'Número do telefone.';

COMMENT ON COLUMN "pessoa"."cliente"."clifax" IS 'Número do Fax.';

COMMENT ON COLUMN "pessoa"."cliente"."clienderecocob" IS 'Endereço de cobrança.';

COMMENT ON COLUMN "pessoa"."cliente"."clinumcob" IS 'End Numero de Cobrança';

COMMENT ON COLUMN "pessoa"."cliente"."clibairrocob" IS 'Bairro do Endereço de Cobrança';

COMMENT ON COLUMN "pessoa"."cliente"."clicomplecob" IS 'Complemto de Cobrança';

COMMENT ON COLUMN "pessoa"."cliente"."clipaiscob" IS 'Pais de cobrança';

COMMENT ON COLUMN "pessoa"."cliente"."cliufcob" IS 'Sigla do Estado.';

COMMENT ON COLUMN "pessoa"."cliente"."clicidadecob" IS 'Cidade do endereço de cobrança';

COMMENT ON COLUMN "pessoa"."cliente"."clicepcob" IS 'Código de endereçamento postal para o endereço de entrega.';

COMMENT ON COLUMN "pessoa"."cliente"."clienderecoent" IS 'Endereço de entrega.';

COMMENT ON COLUMN "pessoa"."cliente"."clinument" IS 'End Numero de Entrega';

COMMENT ON COLUMN "pessoa"."cliente"."clibairroent" IS 'Bairro do Endereço de Entrega';

COMMENT ON COLUMN "pessoa"."cliente"."clicompleent" IS 'Complemento de Entrega';

COMMENT ON COLUMN "pessoa"."cliente"."clipaisent" IS 'Pais entrega';

COMMENT ON COLUMN "pessoa"."cliente"."cliufent" IS 'Sigla do Estado.';

COMMENT ON COLUMN "pessoa"."cliente"."clicidadeent" IS 'Cidade do Endereço de Entrega';

COMMENT ON COLUMN "pessoa"."cliente"."clicepent" IS 'Código de endereçamento postal para o endereço de cobrança.';

COMMENT ON COLUMN "pessoa"."cliente"."cliinsestadual" IS 'Número da Inscrição Estadual.';

COMMENT ON COLUMN "pessoa"."cliente"."cliinsminicipal" IS 'Número da Inscrição Municipal.';

COMMENT ON COLUMN "pessoa"."cliente"."cliemail" IS 'Endereço de correio eletrônico na Internet.';

COMMENT ON COLUMN "pessoa"."cliente"."cliobs" IS 'Observações e ou comentários sobre o cliente.';

COMMENT ON COLUMN "pessoa"."cliente"."cliregiao" IS 'Código de identificação da região.';

COMMENT ON COLUMN "pessoa"."cliente"."clicontribuinte" IS 'Indica se o cliente é contribuinte ou não.';

COMMENT ON COLUMN "pessoa"."cliente"."cliativo" IS 'Determina se o cliente está ativo ou não.';

COMMENT ON COLUMN "pessoa"."cliente"."clichkcgc" IS 'Identifica se o número do CGC é um número válido.';

COMMENT ON COLUMN "pessoa"."cliente"."clitxtcgc" IS 'Texto de avaliação de CGC ou CPF.';

COMMENT ON COLUMN "pessoa"."cliente"."clisite" IS 'Endereço eletrônico na Internet';

COMMENT ON COLUMN "pessoa"."cliente"."cliconsfinal" IS 'Consumidor Final';

COMMENT ON COLUMN "pessoa"."cliente"."clidiretorio" IS 'Diretório do Cliente';

COMMENT ON COLUMN "pessoa"."cliente"."clicredito" IS 'Limite de crédito.';

COMMENT ON COLUMN "pessoa"."cliente"."clipedido" IS 'Somatória dos pedidos em aberto.';

COMMENT ON COLUMN "pessoa"."cliente"."clidevedor" IS 'Saldo devedor acumulado.';

COMMENT ON COLUMN "pessoa"."cliente"."clivendedor" IS 'Vendedor preferencial';

COMMENT ON COLUMN "pessoa"."cliente"."clitransportadora" IS 'Transportadora preferencial';

COMMENT ON COLUMN "pessoa"."cliente"."clidesconto" IS 'Desconto normal do cliente';

COMMENT ON COLUMN "pessoa"."cliente"."clicondpagto" IS 'Condição de Pagamento Normal do Cliente';

COMMENT ON COLUMN "pessoa"."cliente"."clicomissao" IS 'Comissão Do Vendedor para este Cliente';

COMMENT ON COLUMN "pessoa"."cliente"."clioperador" IS 'Operador';

COMMENT ON COLUMN "pessoa"."cliente"."clidatamodificacao" IS 'Data da última modificação do registro';

COMMENT ON COLUMN "pessoa"."cliente"."cligerente" IS 'Gerente de Conta';

COMMENT ON COLUMN "pessoa"."cliente"."clicadastro" IS 'Data de Cadastramento';

COMMENT ON COLUMN "pessoa"."cliente"."cliexpira" IS 'Número de dias em reserva para o vendedor';

COMMENT ON COLUMN "pessoa"."cliente"."clireservamod" IS 'Usuário que modificou a reserva';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "cliente_CGC/CPF_idx" ON "pessoa"."cliente" ("codigo");

CREATE UNIQUE INDEX "cliente_cliendereco_idx" ON "pessoa"."cliente" ("cliendereco");

CREATE INDEX "cliente_clienderecocob_idx" ON "pessoa"."cliente" ("clienderecocob");

CREATE INDEX "cliente_clienderecoent_idx" ON "pessoa"."cliente" ("clienderecoent");

CREATE UNIQUE INDEX "cliente_Fantasia_idx" ON "pessoa"."cliente" ("clifantasia");

ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "cliente_Razão Social_idx" ON "pessoa"."cliente" ("clirsocial");

CREATE UNIQUE INDEX "cliente_ID_idx" ON "pessoa"."cliente" ("id");

-- CREATE Relationships ...
ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_cliufcob_fk" FOREIGN KEY ("cliufcob") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_cliufent_fk" FOREIGN KEY ("cliufent") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_cliuf_fk" FOREIGN KEY ("cliuf") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_clieconomica_fk" FOREIGN KEY ("clieconomica") REFERENCES "loja"."atividade_economica"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_clicondpagto_fk" FOREIGN KEY ("clicondpagto") REFERENCES "telemarketing"."condpagto"("codigo") ON UPDATE CASCADE;

--ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_clivendedor_fk" FOREIGN KEY ("clivendedor") REFERENCES "pessoa"."funcionario"("codigo") ON UPDATE CASCADE;
ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_clioperador_fk" FOREIGN KEY ("clioperador") REFERENCES "pessoa"."funcionario"("codigo") ON UPDATE CASCADE;
ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_cligerente_fk" FOREIGN KEY ("cligerente") REFERENCES "pessoa"."funcionario"("codigo") ON UPDATE CASCADE;
ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_clipais_fk" FOREIGN KEY ("clipais") REFERENCES "pessoa"."pais"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_cliregiao_fk" FOREIGN KEY ("cliregiao") REFERENCES "pessoa"."regiao"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."cliente" ADD CONSTRAINT "cliente_clitransportadora_fk" FOREIGN KEY ("clitransportadora") REFERENCES "servicos"."transportadora"("codigo") ON UPDATE CASCADE;
--sql script successful >>> /tmp/qbdados/2/cliente.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."compra_nota_parcial"
 (
	"cpnpid"			INTEGER NOT NULL,
	"cpnpprod"			VARCHAR (40) NOT NULL,
	"cpnpemp"			INTEGER,
	"cpnpped"			INTEGER NOT NULL,
	"cpnpqtd"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
CREATE INDEX "compranotaparciais_cpnpid_idx" ON "compras"."compra_nota_parcial" ("cpnpid");

-- CREATE Relationships ...
ALTER TABLE "compras"."compra_nota_parcial" ADD CONSTRAINT "compranotaparciais_cpnpid_fk" FOREIGN KEY ("cpnpid") REFERENCES "compras"."compranota"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "compras"."compra_nota_parcial" ADD CONSTRAINT "compranotaparciais_cpnpped_fk" FOREIGN KEY ("cpnpped") REFERENCES "compras"."compra"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "compras"."compra_nota_parcial" ADD CONSTRAINT "compranotaparciais_cpnpemp_fk" FOREIGN KEY ("cpnpemp") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE;
ALTER TABLE "compras"."compra_nota_parcial" ADD CONSTRAINT "compranotaparciais_cpnpprod_fk" FOREIGN KEY ("cpnpprod") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE;
--sql script successful >>> /tmp/qbdados/2/compranotaparciais.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."compranotaprod"
 (
	"cpmpdnota"			INTEGER,
	"cpmpdcodigo"			VARCHAR (40),
	"cpmpdempresa"			INTEGER,
	"cpmpdqtd"			DOUBLE PRECISION,
	"cpmpdvalorunit"			DOUBLE PRECISION,
	"cpmpdicms"			DOUBLE PRECISION,
	"cpmpdipi"			DOUBLE PRECISION,
	"cpmpdvaloripi"			DOUBLE PRECISION,
	"cpmpdvalorcusto"			DOUBLE PRECISION,
	"cpmpdqtddevol"			DOUBLE PRECISION,
	"cpmpdvaloricms"			DOUBLE PRECISION,
	"cpmpddesconto"			REAL,
	"id"			bigserial,
	"cpmpdreducao"			BOOL NOT NULL,
	"cpmpdbase"			DOUBLE PRECISION,
	"cpmpdmargem"			DOUBLE PRECISION,
	"cpmpdsubstituicao"			BOOL NOT NULL,
	"cpmpdvalorsubstituicao"			DOUBLE PRECISION,
	"cpmpdbasesubstituicao"			DOUBLE PRECISION,
	"cpmpdcfop"			INTEGER
);

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdnota" IS 'Controle interno da Nota Fiscal.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdcodigo" IS 'Código de Identificação do produto.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdqtd" IS 'Quantidade comprada do produto.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdvalorunit" IS 'Valor unitário do produto.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdicms" IS 'Alíquota de ICMS.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdipi" IS 'Alíquota de IPI.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdvaloripi" IS 'Valor do IPI na Nota Fiscal.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdvalorcusto" IS 'Valor do custo rateado';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdqtddevol" IS 'Quantidade devolvida do produto.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdvaloricms" IS 'Valor do ICMS na Nota Fiscal.';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpddesconto" IS 'Desconto no Item';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdreducao" IS 'Produto com Redução de Base de ICMS';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdbase" IS 'Base de cálculo de ICMS';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdmargem" IS 'Margem de Contribuição';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdsubstituicao" IS 'se teve subsituicao ou não';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdvalorsubstituicao" IS 'valor da substituicao';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdbasesubstituicao" IS 'base de substituicao';

COMMENT ON COLUMN "compras"."compranotaprod"."cpmpdcfop" IS 'Natureza Opercao do Produto';

-- CREATE INDEXES ...
CREATE INDEX "compranotaprod_nfcempresa_idx" ON "compras"."compranotaprod" ("cpmpdempresa");

CREATE UNIQUE INDEX "compranotaprod_nfcpdnota_idx" ON "compras"."compranotaprod" ("cpmpdnota");

ALTER TABLE "compras"."compranotaprod" ADD CONSTRAINT "compranotaprod_pkey" PRIMARY KEY ("cpmpdnota", "cpmpdcodigo");

CREATE UNIQUE INDEX "compranotaprod_prodid_idx" ON "compras"."compranotaprod" ("cpmpdcodigo");

CREATE UNIQUE INDEX "compranotaprod_ID_idx" ON "compras"."compranotaprod" ("id");

-- CREATE Relationships ...
ALTER TABLE "compras"."compranotaprod" ADD CONSTRAINT "compranotaprod_cpmpdempresa_fk" FOREIGN KEY ("cpmpdempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE;
ALTER TABLE "compras"."compranotaprod" ADD CONSTRAINT "compranotaprod_cpmpdcodigo_fk" FOREIGN KEY ("cpmpdcodigo") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE;
ALTER TABLE "compras"."compranotaprod" ADD CONSTRAINT "compranotaprod_cpmpdnota_fk" FOREIGN KEY ("cpmpdnota") REFERENCES "compras"."compranota"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/compranotaprod.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."compranota"
 (
	"id"			bigserial,
	"Gen_cpnmotivo"			INTEGER,
	"nf_entrada"			INTEGER,
	"cpnempresa"			INTEGER,
	"cpnfuncionario"			bigint,
	"cpnnumero"			DOUBLE PRECISION,
	"cpnfornecedor"			VARCHAR (32),
	"cpndataemissao"			DATE,
	"cpndatarecebimento"			DATE,
	"cpnbaseicms"			DOUBLE PRECISION,
	"cpnvaloricms"			DOUBLE PRECISION,
	"cpnvaloripi"			DOUBLE PRECISION,
	"cpnvaloriss"			DOUBLE PRECISION,
	"cpnvalorfrete"			DOUBLE PRECISION,
	"cpnvalorseguro"			DOUBLE PRECISION,
	"cpnvalordiversos"			DOUBLE PRECISION,
	"cpntotalprodutos"			DOUBLE PRECISION,
	"cpntotalservicos"			DOUBLE PRECISION,
	"cpntotalnota"			DOUBLE PRECISION,
	"cpnflagpedcompra"			BOOL NOT NULL,
	"cpnnumpedcompra"			INTEGER,
	"cpncancel"			BOOL NOT NULL,
	"cpnmotivo"			TEXT,
	"cpntipo"			INTEGER,
	"cpncodigo"			VARCHAR (40),
	"cpntipodespesa"			VARCHAR (60),
	"cpnoperador"			VARCHAR (30),
	"cpncondpagto"			bigint,
	"cpnmoeda"			bigint,
	"cpnop"			INTEGER,
	"cpnimp"			BOOL NOT NULL,
	"cpndesconto"			REAL,
	"cpnicmsubst"			DOUBLE PRECISION,
	"cpnvaloricmsubst"			DOUBLE PRECISION,
	"cpntipoicms"			VARCHAR (16),
	"cpnfobcif"			BOOL NOT NULL,
	"cpntransportadora"			INTEGER,
	"cpncontato"			VARCHAR (160),
	"codigo"			INTEGER,
	"cpnufveiculo"			VARCHAR (4),
	"cpnplaca"			VARCHAR (16),
	"cpnfreteconta"			VARCHAR (2),
	"cpnqtd"			DOUBLE PRECISION,
	"cpnmarca"			VARCHAR (100),
	"cpnespecie"			VARCHAR (100),
	"cpnbruto"			DOUBLE PRECISION,
	"cpnliquido"			DOUBLE PRECISION,
	"cpninfcomp"			TEXT,
	"cpnnfe"			INTEGER,
	"cpnenviada"			BOOL NOT NULL,
	"cpndatasaida"			DATE,
	"cpnhorasaida"			TIMESTAMP WITHOUT TIME ZONE,
	"cpnviatransp"			VARCHAR (40),
	"cpndataenvio"			DATE
);
COMMENT ON COLUMN "compras"."compranota"."nf_entrada" IS 'Controle interno de Nota Fiscal de Entrada.';
COMMENT ON COLUMN "compras"."compranota"."cpnempresa" IS 'Código de identificação da empresa.';
COMMENT ON COLUMN "compras"."compranota"."cpnfuncionario" IS 'Código de identificação do funcionário.';
COMMENT ON COLUMN "compras"."compranota"."cpnnumero" IS 'Número de Identificação da Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpnfornecedor" IS 'Número de CGC ou CPF.';
COMMENT ON COLUMN "compras"."compranota"."cpndataemissao" IS 'Data de emissão da Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpndatarecebimento" IS 'Data de recebimento da Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpnbaseicms" IS 'Valor correspondente a base de cálculo de ICMS.';
COMMENT ON COLUMN "compras"."compranota"."cpnvaloricms" IS 'Valor do ICMS da Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpnvaloripi" IS 'Valor total do IPI.';
COMMENT ON COLUMN "compras"."compranota"."cpnvaloriss" IS 'Valor total de ISS.';
COMMENT ON COLUMN "compras"."compranota"."cpnvalorfrete" IS 'Valor do frete cobrado na Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpnvalorseguro" IS 'Valor do seguro cobrado na Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpnvalordiversos" IS 'Valor de outras despesas cobradas na Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpntotalprodutos" IS 'Valor total de produtos na Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpntotalservicos" IS 'Valor total de serviços na Nota Fiscal.';
COMMENT ON COLUMN "compras"."compranota"."cpntotalnota" IS 'Valor total da Nota Fiascal.';
COMMENT ON COLUMN "compras"."compranota"."cpnflagpedcompra" IS 'Flag de controle de emissão de pedido de compra.';
COMMENT ON COLUMN "compras"."compranota"."cpnnumpedcompra" IS 'Número de controle interno do pedido de compra.';
COMMENT ON COLUMN "compras"."compranota"."cpncancel" IS 'Flag de cancelamento de Nota Fiscal de entrada.';
COMMENT ON COLUMN "compras"."compranota"."cpnmotivo" IS 'Observações sobre os motivos do cancelamento.';
COMMENT ON COLUMN "compras"."compranota"."cpntipo" IS 'Determina se a Nota Fiscal é de estoque, serviços ou produtos diversos';
COMMENT ON COLUMN "compras"."compranota"."cpncodigo" IS 'Tipo de Status de Estoque.';
COMMENT ON COLUMN "compras"."compranota"."cpntipodespesa" IS 'Descrição do tipo de Receita ou Despesa.';
COMMENT ON COLUMN "compras"."compranota"."cpnoperador" IS 'Operador';
COMMENT ON COLUMN "compras"."compranota"."cpncondpagto" IS 'Condição de Pagamento da Nota Fiscal';
COMMENT ON COLUMN "compras"."compranota"."cpnmoeda" IS 'Moeda dos Valores da Nota Fiscal';
COMMENT ON COLUMN "compras"."compranota"."cpnop" IS 'Código da Natureza da Operação';
COMMENT ON COLUMN "compras"."compranota"."cpnimp" IS 'Indica se é uma Importação';
COMMENT ON COLUMN "compras"."compranota"."cpndesconto" IS 'Desconto';
COMMENT ON COLUMN "compras"."compranota"."cpnicmsubst" IS 'Alíquota do ICMS de Substituição';
COMMENT ON COLUMN "compras"."compranota"."cpnvaloricmsubst" IS 'Valor do ICMS de Substituição';
COMMENT ON COLUMN "compras"."compranota"."cpntipoicms" IS 'Tipo de Cálculo do ICMS na Compra';
COMMENT ON COLUMN "compras"."compranota"."cpnfobcif" IS 'FOB/CIF (0=FOB;-1=CIF)';
COMMENT ON COLUMN "compras"."compranota"."cpntransportadora" IS 'Transportadora';
COMMENT ON COLUMN "compras"."compranota"."cpnufveiculo" IS 'UF do veiculo';
COMMENT ON COLUMN "compras"."compranota"."cpnplaca" IS 'Placa do Transporte';
COMMENT ON COLUMN "compras"."compranota"."cpnfreteconta" IS 'Cobrançado Frete';
COMMENT ON COLUMN "compras"."compranota"."cpnqtd" IS 'Quantidade de Volumes despachados';
COMMENT ON COLUMN "compras"."compranota"."cpnmarca" IS 'Marca dos Volumes';
COMMENT ON COLUMN "compras"."compranota"."cpnespecie" IS 'Especie dos Volumes';
COMMENT ON COLUMN "compras"."compranota"."cpnbruto" IS 'Peso Bruto da Carga';
COMMENT ON COLUMN "compras"."compranota"."cpnliquido" IS 'Peso Líquido da carga';
COMMENT ON COLUMN "compras"."compranota"."cpninfcomp" IS 'Informações Complementares';
COMMENT ON COLUMN "compras"."compranota"."cpnnfe" IS 'Código da NFe';
COMMENT ON COLUMN "compras"."compranota"."cpnenviada" IS 'Indica se a NFe foi enviada ou não';
COMMENT ON COLUMN "compras"."compranota"."cpndatasaida" IS 'Data da Saída';
COMMENT ON COLUMN "compras"."compranota"."cpnhorasaida" IS 'Hora da Saída';
COMMENT ON COLUMN "compras"."compranota"."cpnviatransp" IS 'Via de Transporte';
COMMENT ON COLUMN "compras"."compranota"."cpndataenvio" IS 'Data do envio';
-- CREATE INDEXES ...
CREATE UNIQUE INDEX "compranota_nf_entrada_idx" ON "compras"."compranota" ("nf_entrada");
CREATE UNIQUE INDEX "compranota_codigo_idx" ON "compras"."compranota" ("codigo");
CREATE UNIQUE INDEX "compranota_empresa_idx" ON "compras"."compranota" ("cpnempresa");
CREATE UNIQUE INDEX "compranota_fornecedor_idx" ON "compras"."compranota" ("cpnfornecedor");
CREATE UNIQUE INDEX "compranota_funcionario_idx" ON "compras"."compranota" ("cpnfuncionario");
CREATE UNIQUE INDEX "compranota_dataemissao_idx" ON "compras"."compranota" ("cpndataemissao");
CREATE UNIQUE INDEX "compranota_datarecebimento_idx" ON "compras"."compranota" ("cpndatarecebimento");
CREATE UNIQUE INDEX "compranota_numero_idx" ON "compras"."compranota" ("cpnnumero");
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_pkey" PRIMARY KEY ("id");
CREATE UNIQUE INDEX "compranota_rdtipo_idx" ON "compras"."compranota" ("cpntipodespesa");
CREATE UNIQUE INDEX "compranota_ID_idx" ON "compras"."compranota" ("id");
-- CREATE Relationships ...
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_empresa_fk" FOREIGN KEY ("cpnempresa") REFERENCES "pessoa"."empresa"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_fornecedor_fk" FOREIGN KEY ("cpnfornecedor") REFERENCES "pessoa"."fornecedor"("id") ON UPDATE CASCADE;
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_condpagto_fk" FOREIGN KEY ("cpncondpagto") REFERENCES "telemarketing"."condpagto"("id") ON UPDATE CASCADE;
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_moeda_fk" FOREIGN KEY ("cpnmoeda") REFERENCES "compras"."moeda"("id") ON UPDATE CASCADE;
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_transportadora_fk" FOREIGN KEY ("cpntransportadora") REFERENCES "servicos"."transportadora"("id") ON UPDATE CASCADE;
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_funcionario_fk" FOREIGN KEY ("cpnfuncionario") REFERENCES "pessoa"."funcionario"("id") ON UPDATE CASCADE;
ALTER TABLE "compras"."compranota" ADD CONSTRAINT "compranota_naturezaoperacao_fk" FOREIGN KEY ("cpnop") REFERENCES "contabil"."natureza_operacao"("id") ON UPDATE CASCADE;
--sql script successful >>> /tmp/qbdados/2/compranota.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."compra_devolucao"
 (
	"nfcpdnota"			INTEGER,
	"nfcpdcodigo"			VARCHAR (40),
	"id"			bigserial,
	"nfcpddevolnum"			INTEGER,
	"nfcpdempresa"			INTEGER,
	"nfcpdqtd"			DOUBLE PRECISION,
	"nfcpdvalorunit"			DOUBLE PRECISION,
	"nfcpdicms"			DOUBLE PRECISION,
	"nfcpdipi"			DOUBLE PRECISION,
	"nfcpdvaloripi"			DOUBLE PRECISION,
	"nfcpdvalorcusto"			DOUBLE PRECISION,
	"nfcpdvaloricms"			DOUBLE PRECISION,
	"nfcpddesconto"			REAL
);

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdnota" IS 'Controle interno da Nota Fiscal.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdcodigo" IS 'Código de Identificação do produto.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpddevolnum" IS 'Número da devolução parcial';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdqtd" IS 'Quantidade comprada do produto.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdvalorunit" IS 'Valor unitário do produto.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdicms" IS 'Alíquota de ICMS.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdipi" IS 'Alíquota de IPI.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdvaloripi" IS 'Valor do IPI na Nota Fiscal.';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdvalorcusto" IS 'Valor do custo do produto';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpdvaloricms" IS 'Valor do ICMS na Nota Fiscal';

COMMENT ON COLUMN "compras"."compra_devolucao"."nfcpddesconto" IS 'Desconto';

-- CREATE INDEXES ...
CREATE INDEX "comprasdevolucoes_nfcempresa_idx" ON "compras"."compra_devolucao" ("nfcpdempresa");

CREATE INDEX "comprasdevolucoes_nfcpdnota_idx" ON "compras"."compra_devolucao" ("nfcpdnota");

ALTER TABLE "compras"."compra_devolucao" ADD CONSTRAINT "comprasdevolucoes_pkey" PRIMARY KEY ("nfcpdnota", "nfcpdcodigo", "nfcpddevolnum");

CREATE INDEX "comprasdevolucoes_prodid_idx" ON "compras"."compra_devolucao" ("nfcpdcodigo");

CREATE INDEX "comprasdevolucoes_ID_idx" ON "compras"."compra_devolucao" ("id");

-- CREATE Relationships ...
ALTER TABLE "compras"."compra_devolucao" ADD CONSTRAINT "comprasdevolucoes_nfcpdnota_fk" FOREIGN KEY ("nfcpdnota") REFERENCES "compras"."compranota"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "compras"."compra_devolucao" ADD CONSTRAINT "comprasdevolucoes_nfcpdempresa_fk" FOREIGN KEY ("nfcpdempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE;
ALTER TABLE "compras"."compra_devolucao" ADD CONSTRAINT "comprasdevolucoes_nfcpdcodigo_fk" FOREIGN KEY ("nfcpdcodigo") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE;
--sql script successful >>> /tmp/qbdados/2/comprasdevolucoes.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."compra_produto"
 (
	"cmpid"			INTEGER,
	"cmpproduto"			VARCHAR (40),
	"cmpempresa"			INTEGER,
	"cmppreco"			DOUBLE PRECISION,
	"cmpqtdpedida"			DOUBLE PRECISION,
	"cmpqtdrecebida"			DOUBLE PRECISION,
	"cmpipi"			DOUBLE PRECISION,
	"cmpicms"			DOUBLE PRECISION,
	"cmpdesconto"			REAL,
	"cmpvaloripi"			DOUBLE PRECISION,
	"cmpvaloricms"			DOUBLE PRECISION,
	"id"			bigserial,
	"cmpreducao"			BOOL NOT NULL,
	"cmpbase"			DOUBLE PRECISION,
	"cmpmargem"			DOUBLE PRECISION,
	"cmpsubstituicao"			BOOL NOT NULL,
	"cmpvalorsubstituicao"			DOUBLE PRECISION,
	"cmpbasesubstituicao"			DOUBLE PRECISION,
	"cmpcfop"			INTEGER
);

COMMENT ON COLUMN "compras"."compra_produto"."cmpid" IS 'Controle interno de pedidos';

COMMENT ON COLUMN "compras"."compra_produto"."cmpproduto" IS 'Código de identificação do produto.';

COMMENT ON COLUMN "compras"."compra_produto"."cmpempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "compras"."compra_produto"."cmppreco" IS 'Valor unitário do produto.';

COMMENT ON COLUMN "compras"."compra_produto"."cmpqtdpedida" IS 'Quantidade do produto comprada.';

COMMENT ON COLUMN "compras"."compra_produto"."cmpqtdrecebida" IS 'Quantidade do produto comprada.';

COMMENT ON COLUMN "compras"."compra_produto"."cmpipi" IS 'Percentual de IPI.';

COMMENT ON COLUMN "compras"."compra_produto"."cmpicms" IS 'Percentual de ICMS.';

COMMENT ON COLUMN "compras"."compra_produto"."cmpdesconto" IS 'Desconto';

COMMENT ON COLUMN "compras"."compra_produto"."cmpvaloripi" IS 'Valor do IPI';

COMMENT ON COLUMN "compras"."compra_produto"."cmpvaloricms" IS 'Valor do ICMS';

COMMENT ON COLUMN "compras"."compra_produto"."cmpreducao" IS 'Produto com Redução de Base de ICMS';

COMMENT ON COLUMN "compras"."compra_produto"."cmpbase" IS 'Base de cálculo de ICMS';

COMMENT ON COLUMN "compras"."compra_produto"."cmpmargem" IS 'Margem de Contribuição';

COMMENT ON COLUMN "compras"."compra_produto"."cmpsubstituicao" IS 'se teve subsituicao ou não';

COMMENT ON COLUMN "compras"."compra_produto"."cmpvalorsubstituicao" IS 'valor da substituicao';

COMMENT ON COLUMN "compras"."compra_produto"."cmpbasesubstituicao" IS 'base de substituicao';

COMMENT ON COLUMN "compras"."compra_produto"."cmpcfop" IS 'Natureza Opercao do Produto';

-- CREATE INDEXES ...
CREATE INDEX "comprasprodutos_cmpempresa_idx" ON "compras"."compra_produto" ("cmpempresa");

CREATE INDEX "comprasprodutos_cmpid_idx" ON "compras"."compra_produto" ("cmpid");

CREATE UNIQUE INDEX "comprasprodutos_cmpproduto_idx" ON "compras"."compra_produto" ("cmpproduto");

ALTER TABLE "compras"."compra_produto" ADD CONSTRAINT "comprasprodutos_pkey" PRIMARY KEY ("cmpid", "cmpproduto");

CREATE INDEX "comprasprodutos_ID_idx" ON "compras"."compra_produto" ("id");

-- CREATE Relationships ...
ALTER TABLE "compras"."compra_produto" ADD CONSTRAINT "comprasprodutos_cmpempresa_fk" FOREIGN KEY ("cmpempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE;
ALTER TABLE "compras"."compra_produto" ADD CONSTRAINT "comprasprodutos_cmpproduto_fk" FOREIGN KEY ("cmpproduto") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE;
ALTER TABLE "compras"."compra_produto" ADD CONSTRAINT "comprasprodutos_cmpid_fk" FOREIGN KEY ("cmpid") REFERENCES "compras"."compra"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/comprasprodutos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."compra"
 (
	"codigo"			INTEGER,
	"Gen_comcancelmotivo"			INTEGER,
	"comempresa"			INTEGER,
	"comnumero"			DOUBLE PRECISION,
	"Gen_comobs"			INTEGER,
	"comnumerocpl"			VARCHAR (100),
	"comfuncionario"			VARCHAR (30),
	"comcgc"			VARCHAR (32),
	"comcontato"			VARCHAR (160),
	"comobs"			TEXT,
	"comdatapedido"			DATE,
	"comcancel"			BOOL NOT NULL,
	"comcancelmotivo"			TEXT,
	"comprazoentrega"			DATE,
	"id"			bigserial,
	"comtotalpedido"			DOUBLE PRECISION,
	"comrecebido"			BOOL NOT NULL,
	"commoeda"			VARCHAR (20),
	"comcondpagto"			VARCHAR (40),
	"comoperador"			VARCHAR (30),
	"comconfirmado"			BOOL NOT NULL,
	"comdataprevista"			DATE,
	"comdatamod"			DATE,
	"comdataconfirma"			DATE,
	"comdesconto"			REAL,
	"comtipoicms"			VARCHAR (16),
	"comfobcif"			BOOL NOT NULL,
	"comtransportadora"			INTEGER,
	"comvalorfrete"			DOUBLE PRECISION,
	"comnatoper"			INTEGER
);

COMMENT ON COLUMN "compras"."compra"."codigo" IS 'Contador de nota fiscal.';

COMMENT ON COLUMN "compras"."compra"."comempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "compras"."compra"."comnumero" IS 'Número do Proposta/Pedido.';

COMMENT ON COLUMN "compras"."compra"."comnumerocpl" IS 'Complemento do Número da Proposta/Pedido.';

COMMENT ON COLUMN "compras"."compra"."comfuncionario" IS 'Código de identificação do comprador.';

COMMENT ON COLUMN "compras"."compra"."comcgc" IS 'Número de CGC ou CPF do fornecedor.';

COMMENT ON COLUMN "compras"."compra"."comcontato" IS 'Nome Completo.';

COMMENT ON COLUMN "compras"."compra"."comobs" IS 'Observações gerais sobre a negociação.';

COMMENT ON COLUMN "compras"."compra"."comdatapedido" IS 'Data da emissão da nota fiscal.';

COMMENT ON COLUMN "compras"."compra"."comcancel" IS 'Determina o cancelamento do Orçamento/Pedido.';

COMMENT ON COLUMN "compras"."compra"."comcancelmotivo" IS 'Justificativa para o cancelamento.';

COMMENT ON COLUMN "compras"."compra"."comprazoentrega" IS 'Data de previsão de entrega.';

COMMENT ON COLUMN "compras"."compra"."comtotalpedido" IS 'Valor total da nota fiscal.';

COMMENT ON COLUMN "compras"."compra"."comrecebido" IS 'Determina se o pedido já foi recebido.';

COMMENT ON COLUMN "compras"."compra"."commoeda" IS 'Identifica a moeda da compra';

COMMENT ON COLUMN "compras"."compra"."comcondpagto" IS 'Identifica a condição de pagamento';

COMMENT ON COLUMN "compras"."compra"."comoperador" IS 'Operador';

COMMENT ON COLUMN "compras"."compra"."comconfirmado" IS 'Determina se o pedido foi confirmado';

COMMENT ON COLUMN "compras"."compra"."comdataprevista" IS 'Especifica a data prevista de recebimento';

COMMENT ON COLUMN "compras"."compra"."comdatamod" IS 'Data da última modificação';

COMMENT ON COLUMN "compras"."compra"."comdataconfirma" IS 'Data da Confirmação do Pedido';

COMMENT ON COLUMN "compras"."compra"."comdesconto" IS 'Desconto';

COMMENT ON COLUMN "compras"."compra"."comtipoicms" IS 'Tipo de Cálculo do ICMS na Compra';

COMMENT ON COLUMN "compras"."compra"."comfobcif" IS 'FOB/CIF (0=FOB;-1=CIF)';

COMMENT ON COLUMN "compras"."compra"."comtransportadora" IS 'Transportadora';

COMMENT ON COLUMN "compras"."compra"."comvalorfrete" IS 'Valor do Frete';

COMMENT ON COLUMN "compras"."compra"."comnatoper" IS 'Natureza da Operação';

-- CREATE INDEXES ...
CREATE INDEX "compras_comcgc_idx" ON "compras"."compra" ("comcgc");

CREATE INDEX "compras_codigo_idx" ON "compras"."compra" ("codigo");

CREATE INDEX "compras_comprazoentrega_idx" ON "compras"."compra" ("comprazoentrega");

CREATE INDEX "compras_ctfornome_idx" ON "compras"."compra" ("comcontato");

CREATE INDEX "compras_Data do Orçamento_idx" ON "compras"."compra" ("comdatapedido");

CREATE INDEX "compras_empresa_idx" ON "compras"."compra" ("comempresa");
ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "compras_ID_idx" ON "compras"."compra" ("id");

CREATE INDEX "compras_venfuncionario_idx" ON "compras"."compra" ("comfuncionario");

CREATE INDEX "compras_vennumero_idx" ON "compras"."compra" ("comnumero");

-- CREATE Relationships ...
ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_comempresa_fk" FOREIGN KEY ("comempresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_comcgc_fk" FOREIGN KEY ("comcgc") REFERENCES "pessoa"."fornecedor"("codigo") ON UPDATE CASCADE;
ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_comcondpagto_fk" FOREIGN KEY ("comcondpagto") REFERENCES "telemarketing"."condpagto"("codigo") ON UPDATE CASCADE;

ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_commoeda_fk" FOREIGN KEY ("commoeda") REFERENCES "compras"."moeda"("codigo") ON UPDATE CASCADE;

ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_comtransportadora_fk" FOREIGN KEY ("comtransportadora") REFERENCES "servicos"."transportadora"("codigo") ON UPDATE CASCADE;
ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_comfuncionario_fk" FOREIGN KEY ("comfuncionario") REFERENCES "pessoa"."funcionario"("codigo") ON UPDATE CASCADE;
ALTER TABLE "compras"."compra" ADD CONSTRAINT "compras_comnatoper_fk" FOREIGN KEY ("comnatoper") REFERENCES "contabil"."natureza_operacao"("codigo") ON UPDATE CASCADE;
--sql script successful >>> /tmp/qbdados/2/compras.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."condicao_pagamento"
 (
	"id"			bigserial,
	"dspgcondicao"			VARCHAR (40),
	"dspgparcela"			INTEGER,
	"dspgdias"			INTEGER,
	"dspgtaxa"			DOUBLE PRECISION
);

COMMENT ON COLUMN "telemarketing"."condicao_pagamento"."dspgcondicao" IS 'Código de identificação da condição de pagamento.';

COMMENT ON COLUMN "telemarketing"."condicao_pagamento"."dspgparcela" IS 'Número de identificação da parcela.';

COMMENT ON COLUMN "telemarketing"."condicao_pagamento"."dspgdias" IS 'Quantidade de dias para vencimento da parcela.';

COMMENT ON COLUMN "telemarketing"."condicao_pagamento"."dspgtaxa" IS 'Percentual correspondente à parcela.';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "condpagtodias_Código da Cond Pagto_idx" ON "telemarketing"."condicao_pagamento" ("dspgcondicao");

CREATE UNIQUE INDEX "condpagtodias_Parcela_idx" ON "telemarketing"."condicao_pagamento" ("dspgparcela");

ALTER TABLE "telemarketing"."condicao_pagamento" ADD CONSTRAINT "condpagtodias_pkey" PRIMARY KEY ("dspgcondicao", "dspgparcela");

CREATE INDEX "condpagtodias_ID_idx" ON "telemarketing"."condicao_pagamento" ("id");

-- CREATE Relationships ...
ALTER TABLE "telemarketing"."condicao_pagamento" ADD CONSTRAINT "condpagtodias_dspgcondicao_fk" FOREIGN KEY ("dspgcondicao") REFERENCES "telemarketing"."condpagto"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/condpagtodias.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."empresa"
 (
	"id"			bigserial,
	"codigo"			INTEGER,
	"codigoentificacao"			VARCHAR (100),
	"empnome"			VARCHAR (160),
	"empendereco"			VARCHAR (160),
	"empcep"			VARCHAR (20),
	"empbairro"			VARCHAR (100),
	"empcidade"			VARCHAR (100),
	"empuf"			VARCHAR (4),
	"emppais"			VARCHAR (80),
	"empcomplemento"			VARCHAR (70),
	"empnumero"			VARCHAR (20),
	"empddd"			VARCHAR (12),
	"empfone01"			VARCHAR (22),
	"empfone02"			VARCHAR (22),
	"empfax"			VARCHAR (22),
	"empemail"			VARCHAR (100),
	"empsite"			VARCHAR (140),
	"emplogo"			BYTEA,
	"empmoeda"			VARCHAR (20),
	"empdificms"			BOOL NOT NULL,
	"emptipocusto"			BOOL NOT NULL,
	"empcorrigirpreco"			BOOL NOT NULL,
	"empaltertab"			BOOL NOT NULL,
	"emptab01percent"			DOUBLE PRECISION,
	"emptab02percent"			DOUBLE PRECISION,
	"emptab03percent"			DOUBLE PRECISION,
	"emppathfax"			VARCHAR (200),
	"emppathcalc"			VARCHAR (200),
	"emppathclock"			VARCHAR (200),
	"empimposto1"			VARCHAR (20),
	"empimposto2"			VARCHAR (20),
	"empimposto3"			VARCHAR (20),
	"empnumvenda"			DOUBLE PRECISION,
	"empnumvendacpl"			VARCHAR (100),
	"empvalidade"			VARCHAR (50),
	"empprazoentrega"			VARCHAR (100),
	"empsomafrete"			BOOL NOT NULL,
	"empvencfrete"			INTEGER,
	"empmargemlucro"			BOOL NOT NULL,
	"empdiasminimo"			INTEGER,
	"empdiasmedia"			INTEGER,
	"empvendaminima"			BOOL NOT NULL,
	"empvendamenorvalor"			DOUBLE PRECISION,
	"empnumcompra"			DOUBLE PRECISION,
	"empnumcompracpl"			VARCHAR (100),
	"empendentrega"			VARCHAR (160),
	"empcepentrega"			VARCHAR (20),
	"empcompleentrega"			VARCHAR (100),
	"empbairroentrega"			VARCHAR (100),
	"empcidadeentrega"			VARCHAR (100),
	"emppaisentrega"			VARCHAR (100),
	"empufentrega"			VARCHAR (4),
	"empendcobranca"			VARCHAR (160),
	"empcepcobranca"			VARCHAR (20),
	"empbairrocobranca"			VARCHAR (100),
	"empcidadecobranca"			VARCHAR (100),
	"emppaiscobranca"			VARCHAR (100),
	"empcomplecobranca"			VARCHAR (100),
	"empufcobranca"			VARCHAR (4),
	"empcgc"			VARCHAR (32),
	"empinsestadual"			VARCHAR (30),
	"empinsminicipal"			VARCHAR (30),
	"empconsulprodserv"			BOOL NOT NULL,
	"emprateiofrete"			INTEGER,
	"emprateioseguro"			INTEGER,
	"emprateiodiversos"			INTEGER,
	"empnumop"			DOUBLE PRECISION,
	"empfilial"			BOOL NOT NULL,
	"empdatamodofica"			TIMESTAMP WITHOUT TIME ZONE,
	"empoperador"			VARCHAR (30),
	"empinitcontabilidade"			BOOL NOT NULL,
	"empinitestoque"			BOOL NOT NULL,
	"empmatriz"			INTEGER,
	"empnfprod"			INTEGER,
	"empnfserv"			INTEGER,
	"empplanocontas"			BOOL NOT NULL,
	"empinicioatividades"			DATE,
	"empnfaut"			BOOL NOT NULL,
	"empdupaut"			BOOL NOT NULL,
	"empbolaut"			BOOL NOT NULL,
	"empimpsimp"			BOOL NOT NULL,
	"empviatransp"			VARCHAR (30),
	"empespvol"			VARCHAR (20),
	"empfreteconta"			SMALLINT,
	"empnivelcont"			INTEGER,
	"empnivelcc"			INTEGER,
	"emprepassaipi"			BOOL NOT NULL,
	"Gen_emplogo"			INTEGER,
	"empobspadraoven"			TEXT,
	"empobspadraocomp"			TEXT,
	"empobspadraoop"			TEXT,
	"empcontroladebito"			BOOL NOT NULL,
	"empnumendentr"			VARCHAR (8),
	"empnumendcob"			VARCHAR (8),
	"empdiasatraso"			INTEGER,
	"empsereinf"			VARCHAR (6),
	"empnatordem"			INTEGER,
	"empcnae"			VARCHAR (14),
	"empcrt"			INTEGER,
	"empaliqcredsn"			DOUBLE PRECISION
);

COMMENT ON COLUMN "pessoa"."empresa"."codigo" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "pessoa"."empresa"."codigoentificacao" IS 'Identifica a empresa com um código fornecido pelo usuário';

COMMENT ON COLUMN "pessoa"."empresa"."empnome" IS 'Razão social da empresa.';

COMMENT ON COLUMN "pessoa"."empresa"."empendereco" IS 'Endereço da empresa.';

COMMENT ON COLUMN "pessoa"."empresa"."empcep" IS 'Código de endereçamento postal.';

COMMENT ON COLUMN "pessoa"."empresa"."empbairro" IS 'Bairro de localização do endereço.';

COMMENT ON COLUMN "pessoa"."empresa"."empcidade" IS 'Nome da Cidade.';

COMMENT ON COLUMN "pessoa"."empresa"."empuf" IS 'Sigla do Estado.';

COMMENT ON COLUMN "pessoa"."empresa"."empddd" IS 'Código de DDD.';

COMMENT ON COLUMN "pessoa"."empresa"."empfone01" IS 'Número do telefone';

COMMENT ON COLUMN "pessoa"."empresa"."empfone02" IS 'Número do telefone.';

COMMENT ON COLUMN "pessoa"."empresa"."empfax" IS 'Número do Fax.';

COMMENT ON COLUMN "pessoa"."empresa"."empemail" IS 'Endereço de correio eletrônico na Internet.';

COMMENT ON COLUMN "pessoa"."empresa"."empsite" IS 'Endereço de página na Internet.';

COMMENT ON COLUMN "pessoa"."empresa"."emplogo" IS 'Logotipo da empresa.';

COMMENT ON COLUMN "pessoa"."empresa"."empmoeda" IS 'Determina a moeda padrão utilizada.';

COMMENT ON COLUMN "pessoa"."empresa"."empdificms" IS 'Determina diferenciação no cálculo de ICMS para outros estados. Default igual a Sim.';

COMMENT ON COLUMN "pessoa"."empresa"."emptipocusto" IS 'Determina o tipo de custo utilizado para cálculo de preço de venda. Default Custo de Compra.';

COMMENT ON COLUMN "pessoa"."empresa"."empcorrigirpreco" IS 'Determina se as Tabelas de Preços serão corrigidas automaticamente. Default igual a Sim.';

COMMENT ON COLUMN "pessoa"."empresa"."empaltertab" IS 'Determina se o vendedor pode alterar a tabela padrão definida para o cliente.';

COMMENT ON COLUMN "pessoa"."empresa"."emptab01percent" IS 'Determina o percentual de correção para a Tabela 01.';

COMMENT ON COLUMN "pessoa"."empresa"."emptab02percent" IS 'Determina o percentual de correção para a Tabela 02.';

COMMENT ON COLUMN "pessoa"."empresa"."emptab03percent" IS 'Determina o percentual de correção para a Tabela 03.';

COMMENT ON COLUMN "pessoa"."empresa"."emppathfax" IS 'Determina o caminho do programa executável do Gerenciador de Fax utilizado.';

COMMENT ON COLUMN "pessoa"."empresa"."emppathcalc" IS 'Determina o caminho do programa executável da calculadora do Windows.';

COMMENT ON COLUMN "pessoa"."empresa"."emppathclock" IS 'Determina o caminho do programa executável do relógio do Windows.';

COMMENT ON COLUMN "pessoa"."empresa"."empimposto1" IS 'Determina o nome do imposto 01. Características de cálculo iguais ao ICMS.';

COMMENT ON COLUMN "pessoa"."empresa"."empimposto2" IS 'Determina o nome do imposto 02. Características de cálculo iguais ao IPI.';

COMMENT ON COLUMN "pessoa"."empresa"."empimposto3" IS 'Determina o nome do imposto 03. Características de cálculo iguais ao ISS.';

COMMENT ON COLUMN "pessoa"."empresa"."empnumvenda" IS 'Determina o número inicial para numeração de propostas e pedidos.';

COMMENT ON COLUMN "pessoa"."empresa"."empnumvendacpl" IS 'Determina o complemento aplicado ao número da proposta ou pedido.';

COMMENT ON COLUMN "pessoa"."empresa"."empvalidade" IS 'Determina o tempo de validade da proposta comercial.';

COMMENT ON COLUMN "pessoa"."empresa"."empprazoentrega" IS 'Determina o prazo default para entrega de produtos ou conclusão de serviços.';

COMMENT ON COLUMN "pessoa"."empresa"."empsomafrete" IS 'Determina se o valor correspondente ao frete deve ser somado ao total da venda.';

COMMENT ON COLUMN "pessoa"."empresa"."empvencfrete" IS 'Determina a quandidade de dias para vencimento do frete.';

COMMENT ON COLUMN "pessoa"."empresa"."empmargemlucro" IS 'Determina se o cálculo do preço base deve ser "Custo * (1+Margem)" ou "Custo / (1-Margem)".';

COMMENT ON COLUMN "pessoa"."empresa"."empdiasminimo" IS 'Determina a quandidade de dias necessários para cálculo de estoque mínimo.';

COMMENT ON COLUMN "pessoa"."empresa"."empdiasmedia" IS 'Determina a quantidade de dias necessários para cálculo do consumo médio.';

COMMENT ON COLUMN "pessoa"."empresa"."empvendaminima" IS 'Determina se existe um valor mínimo para realizar uma venda.';

COMMENT ON COLUMN "pessoa"."empresa"."empvendamenorvalor" IS 'Determina o valor mínimo para fechar uma venda.';

COMMENT ON COLUMN "pessoa"."empresa"."empnumcompra" IS 'Determina o número inicial para numeração de pedidos de compra.';

COMMENT ON COLUMN "pessoa"."empresa"."empnumcompracpl" IS 'Determina o complemento aplicado ao número do pedido de compra.';

COMMENT ON COLUMN "pessoa"."empresa"."empendentrega" IS 'Endereço da empresa para entrega.';

COMMENT ON COLUMN "pessoa"."empresa"."empcepentrega" IS 'Código de endereçamento postal de entrega.';

COMMENT ON COLUMN "pessoa"."empresa"."empcompleentrega" IS 'Complemento de Entrega.';

COMMENT ON COLUMN "pessoa"."empresa"."empbairroentrega" IS 'Bairro de localização do endereço  de entrega.';

COMMENT ON COLUMN "pessoa"."empresa"."empcidadeentrega" IS 'Nome da Cidade de entrega';

COMMENT ON COLUMN "pessoa"."empresa"."emppaisentrega" IS 'País Entrega';

COMMENT ON COLUMN "pessoa"."empresa"."empufentrega" IS 'Sigla do Estado de entrega.';

COMMENT ON COLUMN "pessoa"."empresa"."empendcobranca" IS 'Endereço da empresa para cobrança.';

COMMENT ON COLUMN "pessoa"."empresa"."empcepcobranca" IS 'Código de endereçamento postal para cobrança.';

COMMENT ON COLUMN "pessoa"."empresa"."empbairrocobranca" IS 'Bairro de localização do endereço para cobrança.';

COMMENT ON COLUMN "pessoa"."empresa"."empcidadecobranca" IS 'Nome da Cidade para cobrança.';

COMMENT ON COLUMN "pessoa"."empresa"."emppaiscobranca" IS 'País de Cobrança';

COMMENT ON COLUMN "pessoa"."empresa"."empcomplecobranca" IS 'Complemento de Cobrança';

COMMENT ON COLUMN "pessoa"."empresa"."empufcobranca" IS 'Sigla do Estado de cobrança.';

COMMENT ON COLUMN "pessoa"."empresa"."empcgc" IS 'Número do CGC ou do CPF.';

COMMENT ON COLUMN "pessoa"."empresa"."empinsestadual" IS 'Número da Inscrição Estadual.';

COMMENT ON COLUMN "pessoa"."empresa"."empinsminicipal" IS 'Número da Inscrição Municipal.';

COMMENT ON COLUMN "pessoa"."empresa"."empconsulprodserv" IS 'Determina se a pesquisa para venda será por código ou descrição de produtos ou serviços.';

COMMENT ON COLUMN "pessoa"."empresa"."emprateiofrete" IS 'Determina a forma de rateio utilizada para os valores de fete das NF de entrada.';

COMMENT ON COLUMN "pessoa"."empresa"."emprateioseguro" IS 'Determina a forma de rateio utilizada para os valores de seguro das NF de entrada.';

COMMENT ON COLUMN "pessoa"."empresa"."emprateiodiversos" IS 'Determina a forma de rateio utilizada para os valores de outras despesas das NF de entrada.';

COMMENT ON COLUMN "pessoa"."empresa"."empnumop" IS 'Determina o número inicial para numeração de OP.';

COMMENT ON COLUMN "pessoa"."empresa"."empfilial" IS 'Determina se a empresa é uma filial';

COMMENT ON COLUMN "pessoa"."empresa"."empdatamodofica" IS 'Determina a data da última modificação do registro';

COMMENT ON COLUMN "pessoa"."empresa"."empoperador" IS 'Determina o responsável pela última modificação';

COMMENT ON COLUMN "pessoa"."empresa"."empinitcontabilidade" IS 'Determina se a Contabilidade foi inicializada';

COMMENT ON COLUMN "pessoa"."empresa"."empinitestoque" IS 'Determina se o Estoque foi inicializado';

COMMENT ON COLUMN "pessoa"."empresa"."empmatriz" IS 'Identifica a Empresa Matriz';

COMMENT ON COLUMN "pessoa"."empresa"."empnfprod" IS 'Identifica o número máximo de itens ou linhas de produtos imprimíveis na nota fiscal';

COMMENT ON COLUMN "pessoa"."empresa"."empnfserv" IS 'Identifica o número máximo de itens ou linhas de serviços imprimíveis na nota fiscal';

COMMENT ON COLUMN "pessoa"."empresa"."empplanocontas" IS 'Visualizar o plano de contas como árvore ou lista';

COMMENT ON COLUMN "pessoa"."empresa"."empinicioatividades" IS 'Data início das atividades';

COMMENT ON COLUMN "pessoa"."empresa"."empnfaut" IS 'Impressão de Notas Fiscais Automática ou Manual';

COMMENT ON COLUMN "pessoa"."empresa"."empdupaut" IS 'Impressão de Duplicatas Automática';

COMMENT ON COLUMN "pessoa"."empresa"."empbolaut" IS 'Impressão de Boletos Automática';

COMMENT ON COLUMN "pessoa"."empresa"."empimpsimp" IS 'Permite adição do valor do IPI à base de cálculo do ICMS';

COMMENT ON COLUMN "pessoa"."empresa"."empviatransp" IS 'Identifica a via de transporte utilizada.';

COMMENT ON COLUMN "pessoa"."empresa"."empespvol" IS 'Identifica o tipo de volume no qual a mercadoria é embalada. (Caixas, Garrafas, Pacotes, Volumes, Etc.)';

COMMENT ON COLUMN "pessoa"."empresa"."empfreteconta" IS 'Identifica o tipo de frete na nota fiscal (1=Emitente;2=Destinatário)';

COMMENT ON COLUMN "pessoa"."empresa"."empnivelcont" IS 'Identifica o nível de lançamento na contabilidade.';

COMMENT ON COLUMN "pessoa"."empresa"."empnivelcc" IS 'Identifica o nível de lançamento nos centros de custos';

COMMENT ON COLUMN "pessoa"."empresa"."emprepassaipi" IS 'Identifica se a empresa repassa e/ou se credita o IPI ou se o considera um custo';

COMMENT ON COLUMN "pessoa"."empresa"."empobspadraoven" IS 'Observações padrão nos pedidos/propostas de venda';

COMMENT ON COLUMN "pessoa"."empresa"."empobspadraocomp" IS 'Observações padrão nos pedidos/ordens de compra';

COMMENT ON COLUMN "pessoa"."empresa"."empobspadraoop" IS 'Observações padrão nas OP';

-- CREATE INDEXES ...
ALTER TABLE "pessoa"."empresa" ADD CONSTRAINT "empresa_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "empresa_ID_idx" ON "pessoa"."empresa" ("id");

-- CREATE Relationships ...
ALTER TABLE "pessoa"."empresa" ADD CONSTRAINT "empresa_empmoeda_fk" FOREIGN KEY ("empmoeda") REFERENCES "compras"."moeda"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."empresa" ADD CONSTRAINT "empresa_empuf_fk" FOREIGN KEY ("empuf") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/empresa.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."fornecedor"
 (
	"Gen_forobs"			INTEGER,
	"codigo"			VARCHAR (32),
	"forjuridica"			BOOL NOT NULL,
	"id"			bigserial,
	"foreconomica"			VARCHAR (30),
	"forrsocial"			VARCHAR (160),
	"forfantasia"			VARCHAR (100),
	"forendereco"			VARCHAR (160),
	"forbairro"			VARCHAR (100),
	"forcidade"			VARCHAR (100),
	"foruf"			VARCHAR (4),
	"forcep"			VARCHAR (20),
	"forddd"			VARCHAR (12),
	"forfone01"			VARCHAR (22),
	"forfone02"			VARCHAR (22),
	"forfax"			VARCHAR (22),
	"foremail"			VARCHAR (100),
	"forobs"			TEXT,
	"forinsestadual"			VARCHAR (30),
	"forinsminicipal"			VARCHAR (30),
	"forativo"			BOOL NOT NULL,
	"forchkcgc"			BOOL NOT NULL,
	"fortxtcgc"			VARCHAR (80),
	"forprazoentrega"			INTEGER,
	"foroperador"			VARCHAR (30),
	"forsite"			VARCHAR (100),
	"fordatamod"			DATE,
	"forcondpagto"			VARCHAR (40),
	"fordesconto"			REAL,
	"fortransportadora"			INTEGER,
	"forpais"			VARCHAR (100),
	"forcontribuinte"			BOOL NOT NULL,
	"forcomplemento"			VARCHAR (100),
	"fornumero"			VARCHAR (20)
);

COMMENT ON COLUMN "pessoa"."fornecedor"."codigo" IS 'Número de CGC ou CPF.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forjuridica" IS 'Determina se Pessoa Jurídica ou Pessoa Física.';

COMMENT ON COLUMN "pessoa"."fornecedor"."foreconomica" IS 'Identifica o código de atividade econômica.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forrsocial" IS 'Razão Social.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forfantasia" IS 'Nome Fantasia.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forendereco" IS 'Endereço.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forbairro" IS 'Bairro.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forcidade" IS 'Cidade.';

COMMENT ON COLUMN "pessoa"."fornecedor"."foruf" IS 'Sigla do Estado.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forcep" IS 'Código de endereçamento postal.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forddd" IS 'Código de DDD.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forfone01" IS 'Número do telefone.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forfone02" IS 'Número de telefone.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forfax" IS 'Número de fax.';

COMMENT ON COLUMN "pessoa"."fornecedor"."foremail" IS 'Endereço de correio eletrônico na Internet.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forobs" IS 'Observações e ou cometários sobre o fornecedor.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forinsestadual" IS 'Número da inscrição estadual.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forinsminicipal" IS 'Número da inscrição municipal.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forativo" IS 'Determina se o fornecedor está ativo ou não.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forchkcgc" IS 'Identifica se o número do CGC é um número válido.';

COMMENT ON COLUMN "pessoa"."fornecedor"."fortxtcgc" IS 'Texto de avaliação de CGC ou CPF.';

COMMENT ON COLUMN "pessoa"."fornecedor"."forprazoentrega" IS 'Prazo médio de entrega dos produtos fornecidos.';

COMMENT ON COLUMN "pessoa"."fornecedor"."foroperador" IS 'Opeerador';

COMMENT ON COLUMN "pessoa"."fornecedor"."forsite" IS 'Endereço eletrônico na Internet';

COMMENT ON COLUMN "pessoa"."fornecedor"."fordatamod" IS 'Data da alteracação';

COMMENT ON COLUMN "pessoa"."fornecedor"."forcondpagto" IS 'Condição de Pagamento';

COMMENT ON COLUMN "pessoa"."fornecedor"."fordesconto" IS 'Desconto Padrão';

COMMENT ON COLUMN "pessoa"."fornecedor"."fortransportadora" IS 'Transportadora Padrão';

COMMENT ON COLUMN "pessoa"."fornecedor"."forpais" IS 'Pais do Fornecedor';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "fornecedor_CGC/CPF_idx" ON "pessoa"."fornecedor" ("codigo");

CREATE INDEX "fornecedor_Fantasia_idx" ON "pessoa"."fornecedor" ("forfantasia");

ALTER TABLE "pessoa"."fornecedor" ADD CONSTRAINT "fornecedor_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "fornecedor_ID_idx" ON "pessoa"."fornecedor" ("id");

-- CREATE Relationships ...
ALTER TABLE "pessoa"."fornecedor" ADD CONSTRAINT "fornecedor_foreconomica_fk" FOREIGN KEY ("foreconomica") REFERENCES "loja"."atividade_economica"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."fornecedor" ADD CONSTRAINT "fornecedor_foruf_fk" FOREIGN KEY ("foruf") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

ALTER TABLE "pessoa"."fornecedor" ADD CONSTRAINT "fornecedor_forcondpagto_fk" FOREIGN KEY ("forcondpagto") REFERENCES "telemarketing"."condpagto"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/fornecedor.sql
--sql script successful >>> /tmp/qbdados/2/funcionario.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Kardex se trata de um ficha, na qual o operador tem o auxilio de conhecer a disponibilidade do material em estoque, permitir a análise quando necessário, emitir um pedido de reposição, conhecer o valor monetário do estoque e o custo de cada item e indicar posteriores desvios ou perdas de material. A tela traz um histórico de toda movimentação de um determinado item no estoque, possibilitando encontrar possíveis divergências entre o saldo do inventario e o saldo físico do item.-- ----------------------------------------------------------
-- ----------------------------------------------------------
CREATE TABLE "deposito"."kardex"
 (
	"Gen_movmotivo"			INTEGER,
	"movempresa"			INTEGER,
	"movproduto"			VARCHAR (40),
	"movsequencia"			SERIAL,
	"movdata"			TIMESTAMP WITHOUT TIME ZONE,
	"movcodigo"			VARCHAR (60),
	"movquantidade"			DOUBLE PRECISION,
	"id"			bigserial,
	"movmotivo"			TEXT,
	"movoperador"			VARCHAR (30),
	"movcontrole"			INTEGER,
	"movcompra"			INTEGER,
	"movcustomedio"			DOUBLE PRECISION
);

COMMENT ON COLUMN "deposito"."kardex"."movempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "deposito"."kardex"."movproduto" IS 'Código do produto.';

COMMENT ON COLUMN "deposito"."kardex"."movsequencia" IS 'Sequência de movimentação.';

COMMENT ON COLUMN "deposito"."kardex"."movdata" IS 'Data da movimentação.';

COMMENT ON COLUMN "deposito"."kardex"."movcodigo" IS 'Tipo de Status de Estoque.';

COMMENT ON COLUMN "deposito"."kardex"."movquantidade" IS 'Quantidade movimentada';

COMMENT ON COLUMN "deposito"."kardex"."movmotivo" IS 'Justificatica do movimento.';

COMMENT ON COLUMN "deposito"."kardex"."movoperador" IS 'Operador';

COMMENT ON COLUMN "deposito"."kardex"."movcontrole" IS 'Numero da Venda, Compra,OP ou Movimentação (Identificador Interno)';

COMMENT ON COLUMN "deposito"."kardex"."movcompra" IS 'Identifica a operação de origem (-1=Compras;0=produção;1=Vendas;2=Ajuste de Estoque;3=Requisição)';

COMMENT ON COLUMN "deposito"."kardex"."movcustomedio" IS 'Custo médio da mercadoria';

-- CREATE INDEXES ...
CREATE INDEX "kardex_Código_idx" ON "deposito"."kardex" ("movproduto");

CREATE INDEX "kardex_movdata_idx" ON "deposito"."kardex" ("movdata");

CREATE UNIQUE INDEX "kardex_movsequencia_idx" ON "deposito"."kardex" ("movsequencia");

ALTER TABLE "deposito"."kardex" ADD CONSTRAINT "kardex_pkey" PRIMARY KEY ("movempresa", "movproduto", "movsequencia");

CREATE UNIQUE INDEX "kardex_prodempresa_idx" ON "deposito"."kardex" ("movempresa");

CREATE INDEX "kardex_ID_idx" ON "deposito"."kardex" ("id");

CREATE INDEX "kardex_codigo_idx" ON "deposito"."kardex" ("movcodigo");

-- CREATE Relationships ...
ALTER TABLE "deposito"."kardex" ADD CONSTRAINT "kardex_movempresa_fk" FOREIGN KEY ("movempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "deposito"."kardex" ADD CONSTRAINT "kardex_movproduto_fk" FOREIGN KEY ("movproduto") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "deposito"."kardex" ADD CONSTRAINT "kardex_movcodigo_fk" FOREIGN KEY ("movcodigo") REFERENCES "deposito"."estoque"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/kardex.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "compras"."moeda_cotacao"
 (
	"cotamoeda"			VARCHAR (20),
	"id"			bigserial,
	"cotadata"			DATE,
	"cotavalor"			DOUBLE PRECISION
);

COMMENT ON COLUMN "compras"."moeda_cotacao"."cotamoeda" IS 'Código de identificação da moeda.';

COMMENT ON COLUMN "compras"."moeda_cotacao"."cotadata" IS 'Data da cotação.';

COMMENT ON COLUMN "compras"."moeda_cotacao"."cotavalor" IS 'Valor da cotação.';

-- CREATE INDEXES ...
CREATE INDEX "moedascotacao_Código do Indexador_idx" ON "compras"."moeda_cotacao" ("cotamoeda");

CREATE INDEX "moedascotacao_Data da Cotação_idx" ON "compras"."moeda_cotacao" ("cotadata");

ALTER TABLE "compras"."moeda_cotacao" ADD CONSTRAINT "moedascotacao_pkey" PRIMARY KEY ("cotamoeda", "cotadata");

CREATE INDEX "moedascotacao_ID_idx" ON "compras"."moeda_cotacao" ("id");

-- CREATE Relationships ...
ALTER TABLE "compras"."moeda_cotacao" ADD CONSTRAINT "moedascotacao_cotamoeda_fk" FOREIGN KEY ("cotamoeda") REFERENCES "compras"."moeda"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/moedascotacao.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."natureza_operacao"
 (
	"codigo"			INTEGER,
	"natcodigo"			VARCHAR (16),
	"natnome"			VARCHAR (100),
	"nattexto"			VARCHAR (50),
	"natctareceber"			BOOL NOT NULL,
	"natsaiestq"			BOOL NOT NULL,
	"natimp1"			BOOL NOT NULL,
	"natimp2"			BOOL NOT NULL,
	"natimp3"			BOOL NOT NULL,
	"natconsig"			BOOL NOT NULL,
	"padrao"			BOOL NOT NULL,
	"natcomissão"			BOOL NOT NULL,
	"natvenda"			BOOL NOT NULL,
	"natamostra"			BOOL NOT NULL,
	"natinterestadual"			BOOL NOT NULL,
	"codigoantiga"			INTEGER,
	"id"			bigserial,
	"nattipo"			INTEGER,
	"natcod"			VARCHAR (8),
	"natmovcompra"			VARCHAR (100),
	"natmovvenda"			VARCHAR (100)
);

COMMENT ON COLUMN "contabil"."natureza_operacao"."codigo" IS 'Código interno da natureza';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natcodigo" IS 'Código da natureza da Operação';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natnome" IS 'Descrição da natureza';

COMMENT ON COLUMN "contabil"."natureza_operacao"."nattexto" IS 'Texto da Natureza da Operação';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natctareceber" IS 'Gera Cta. Receber?';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natsaiestq" IS 'Gera Saída de Estoque?';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natimp1" IS 'Gera Imposto 1? ICMS';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natimp2" IS 'Gera Imposto 2? IPI';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natimp3" IS 'Gera Impostos Faturamento?';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natconsig" IS 'Gera Movimntação de Estoque para Consignação?';

COMMENT ON COLUMN "contabil"."natureza_operacao"."padrao" IS 'Padrão do Sistema';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natcomissão" IS 'Gera comissão para o vendedor?';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natvenda" IS 'Venda(-1) / Compra (0)';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natamostra" IS 'É Amostra Grátis?';

COMMENT ON COLUMN "contabil"."natureza_operacao"."natinterestadual" IS 'É interestadual?';

COMMENT ON COLUMN "contabil"."natureza_operacao"."codigoantiga" IS 'Identificador anterior (somente utilizado para correções da NGA)';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "naturezaoperacao_codigo_idx" ON "contabil"."natureza_operacao" ("codigo");

ALTER TABLE "contabil"."natureza_operacao" ADD CONSTRAINT "naturezaoperacao_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "naturezaoperacao_ID_idx" ON "contabil"."natureza_operacao" ("id");

-- CREATE Relationships ...
ALTER TABLE "contabil"."natureza_operacao" ADD CONSTRAINT "naturezaoperacao_natcod_fk" FOREIGN KEY ("natcod") REFERENCES "contabil"."natureza_operacao_codigo"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/naturezaoperacao.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."nota_fiscal_correcao"
 (
	"codigo"			SERIAL,
	"id"			bigserial,
	"nfcvenda"			INTEGER,
	"nfcdata"			TIMESTAMP WITHOUT TIME ZONE,
	"nfcsn"			BOOL NOT NULL,
	"nfcserie"			VARCHAR (40),
	"nfcrecebimento"			TIMESTAMP WITHOUT TIME ZONE,
	"nfc1"			BOOL NOT NULL,
	"nfc2"			BOOL NOT NULL,
	"nfc3"			BOOL NOT NULL,
	"nfc4"			BOOL NOT NULL,
	"nfc5"			BOOL NOT NULL,
	"nfc6"			BOOL NOT NULL,
	"nfc7"			BOOL NOT NULL,
	"nfc8"			BOOL NOT NULL,
	"nfc9"			BOOL NOT NULL,
	"nfc10"			BOOL NOT NULL,
	"nfc11"			BOOL NOT NULL,
	"nfc12"			BOOL NOT NULL,
	"nfc13"			BOOL NOT NULL,
	"nfc14"			BOOL NOT NULL,
	"nfc15"			BOOL NOT NULL,
	"nfc16"			BOOL NOT NULL,
	"nfc17"			BOOL NOT NULL,
	"nfc18"			BOOL NOT NULL,
	"nfc19"			BOOL NOT NULL,
	"nfc20"			BOOL NOT NULL,
	"nfc21"			BOOL NOT NULL,
	"nfc22"			BOOL NOT NULL,
	"nfc23"			BOOL NOT NULL,
	"nfc24"			BOOL NOT NULL,
	"nfc25"			BOOL NOT NULL,
	"nfc26"			BOOL NOT NULL,
	"nfc27"			BOOL NOT NULL,
	"nfc28"			BOOL NOT NULL,
	"nfc29"			BOOL NOT NULL,
	"nfc30"			BOOL NOT NULL,
	"nfc31"			BOOL NOT NULL,
	"nfc32"			BOOL NOT NULL,
	"nfc33"			BOOL NOT NULL,
	"nfc34"			BOOL NOT NULL,
	"nfc35"			BOOL NOT NULL,
	"nfc36"			BOOL NOT NULL
);

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."codigo" IS 'Identificador da Nota de Correção';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfcvenda" IS 'Identificador da Venda/NF';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfcdata" IS 'Data da Carta de Correção';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfcsn" IS 'Sua NF(-1)/Nossa NF(0)';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfcserie" IS 'Série da NF';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfcrecebimento" IS 'Data do Recebimento da 1a via';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc1" IS 'Razão Social';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc2" IS 'Endereço';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc3" IS 'Municipio';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc4" IS 'Estado';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc5" IS 'No. de Inscrição no CGC/MF';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc6" IS 'No. de Inscrição Estadual';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc7" IS 'Natureza da Operação';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc8" IS 'Código Fiscal de Operação';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc9" IS 'Via de Transporte';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc10" IS 'Data de Emissão';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc11" IS 'Data de Saída';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc12" IS 'Unidade (produto)';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc13" IS 'Quantidade (produto)';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc14" IS 'Descrição dos Produtos';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc15" IS 'Preço Unitário';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc16" IS 'Valor do Produto';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc17" IS 'Classificação Fiscal';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc18" IS 'Alíquota do IPI';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc19" IS 'Valor do IPI';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc20" IS 'Base de Cálculo do IPI';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc21" IS 'Valor Total da Nota';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc22" IS 'Alíquota do ICMS';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc23" IS 'Valor do ICMS';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc24" IS 'Base de Cálculo do ICMS';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc25" IS 'Nome do Transportador';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc26" IS 'Endereço do Transportador';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc27" IS 'Termo de isenção do IPI';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc28" IS 'Termo de isenção do ICMS';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc29" IS 'Peso - Bruto/Líquido';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc30" IS 'Volumes-Marca/Num/Quant.';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc31" IS 'Rasuras';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc32" IS 'Vencimento';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc33" IS 'Valor Duplicata';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc34" IS 'No. Pedido';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc35" IS 'Valor Total dos Produtos';

COMMENT ON COLUMN "contabil"."nota_fiscal_correcao"."nfc36" IS 'Dados Adicionais';

-- CREATE INDEXES ...
CREATE INDEX "notasfiscaiscor_codigo_idx" ON "contabil"."nota_fiscal_correcao" ("codigo");

ALTER TABLE "contabil"."nota_fiscal_correcao" ADD CONSTRAINT "notasfiscaiscor_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "notasfiscaiscor_ID_idx" ON "contabil"."nota_fiscal_correcao" ("id");

-- CREATE Relationships ...
-- Relationship from "contabil"."nota_fiscal_correcao" ("nfcvenda") to "contabil"."nota_fiscal_formulario"("nfrvenda") does not enforce integrity.
--sql script successful >>> /tmp/qbdados/2/notasfiscaiscor.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."nota_fiscal_formulario"
 (
	"Gen_nfrcancelmotivo"			INTEGER,
	"Gen_nfrinfcomp"			INTEGER,
	"nfrvenda"			INTEGER,
	"nfrdatacontrol"			TIMESTAMP WITHOUT TIME ZONE,
	"nfrnumero"			DOUBLE PRECISION,
	"nfremissao"			TIMESTAMP WITHOUT TIME ZONE,
	"nfrempresa"			INTEGER,
	"nfrcfop"			VARCHAR (16),
	"nfrfatnumero"			DOUBLE PRECISION,
	"id"			bigserial,
	"nfrfatnumerocpl"			VARCHAR (100),
	"nfrcgc"			VARCHAR (32),
	"nfrcancel"			BOOL NOT NULL,
	"nfrcancelmotivo"			TEXT,
	"nfrfatura"			DOUBLE PRECISION,
	"nfrviatransp"			VARCHAR (40),
	"nfrnatoper"			VARCHAR (50),
	"nfrdatasaida"			DATE,
	"nfrhorasaida"			TIMESTAMP WITHOUT TIME ZONE,
	"nfrsaida"			BOOL NOT NULL,
	"nfrbaseicms"			DOUBLE PRECISION,
	"nfrvaloricms"			DOUBLE PRECISION,
	"nfrtotalprodutos"			DOUBLE PRECISION,
	"nfrtotalservicos"			DOUBLE PRECISION,
	"nfrfrete"			DOUBLE PRECISION,
	"nfrseguro"			DOUBLE PRECISION,
	"nfrdespesas"			DOUBLE PRECISION,
	"nfrvaloripi"			DOUBLE PRECISION,
	"nfrvaloriss"			DOUBLE PRECISION,
	"nfrvalornf"			DOUBLE PRECISION,
	"nfrnometrans"			VARCHAR (160),
	"nfrufveiculo"			VARCHAR (4),
	"nfrplaca"			VARCHAR (16),
	"nfrfreteconta"			VARCHAR (2),
	"nfrqtd"			DOUBLE PRECISION,
	"nfrmarca"			VARCHAR (100),
	"nfrespecie"			VARCHAR (100),
	"nfrbruto"			DOUBLE PRECISION,
	"nfrliquido"			DOUBLE PRECISION,
	"nfrinfcomp"			TEXT,
	"nfrreducaobase"			DOUBLE PRECISION,
	"nfriddev"			TIMESTAMP WITHOUT TIME ZONE,
	"nfrchavenfe"			VARCHAR (120),
	"nfrchavenferef"			VARCHAR (120)
);

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrvenda" IS 'numero realcionado com o registro da venda';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrdatacontrol" IS 'Identificador auxiliar da venda';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrnumero" IS 'Número do Formulário de Nota Fiscal Impresso';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfremissao" IS 'Data da Emissão da Nota Fiscal';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrempresa" IS 'Identificador da Empresa emitente';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrcfop" IS 'Código da Natureza da Operação';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrfatnumero" IS 'Número da Venda';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrfatnumerocpl" IS 'Adicional do Número da Venda';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrcgc" IS 'CGC/CPF do cliente';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrcancel" IS 'Flag de cancelamento da Nota Fiscal';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrcancelmotivo" IS 'Motivo do Cancelamento da Nota Fiscal';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrfatura" IS 'Número da Fatura';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrviatransp" IS 'Via de Transporte';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrnatoper" IS 'Descrição da Natureza da Operação';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrdatasaida" IS 'Data da saida da mercadoria';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrhorasaida" IS 'Hora da saida da mercadoria';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrsaida" IS 'Indica se a Nota é de Saída de Mercadoria (Sim) ou de Entrada (Não)';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrbaseicms" IS 'Base para cálculo do ICMS';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrvaloricms" IS 'Valor do ICMS';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrtotalprodutos" IS 'Valor dos Produtos faturados';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrtotalservicos" IS 'Valor dos Serviós Faturados';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrfrete" IS 'Valor do Frete';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrseguro" IS 'Valor do Seguro';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrdespesas" IS 'Valor das Despesas Accesórias';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrvaloripi" IS 'Valor do IPI';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrvaloriss" IS 'Valor do ISS';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrvalornf" IS 'Valor Total da Nota Fiscal';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrnometrans" IS 'Nome da Transportadora';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrufveiculo" IS 'UF do veiculo';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrplaca" IS 'Placa do Transporte';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrfreteconta" IS 'Cobrançado Frete';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrqtd" IS 'Quantidade de Volumes despachados';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrmarca" IS 'Marca dos Volumes';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrespecie" IS 'Especie dos Volumes';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrbruto" IS 'Peso Bruto da Carga';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrliquido" IS 'Peso Líquido da carga';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrinfcomp" IS 'Informações Complementares';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfrreducaobase" IS 'Indica o percentual de reducao da base de ICMS';

COMMENT ON COLUMN "contabil"."nota_fiscal_formulario"."nfriddev" IS 'Identificador da Devolução';

-- CREATE INDEXES ...
ALTER TABLE "contabil"."nota_fiscal_formulario" ADD CONSTRAINT "notasfiscaisform_pkey" PRIMARY KEY ("nfrvenda", "nfrnumero", "nfremissao", "nfrempresa");

CREATE INDEX "notasfiscaisform_ID_idx" ON "contabil"."nota_fiscal_formulario" ("id");

-- CREATE Relationships ...
-- Relationship from "contabil"."nota_fiscal_formulario" ("nfrvenda") to "telemarketing"."venda_faturada"("fatvenda") does not enforce integrity.
-- Relationship from "contabil"."nota_fiscal_formulario" ("nfrcfop") to "contabil"."natureza_operacao"("natcodigo") does not enforce integrity.
--sql script successful >>> /tmp/qbdados/2/notasfiscaisform.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."nota_fiscal"
 (
	"nfnumero"			DOUBLE PRECISION,
	"nfidvenda"			INTEGER,
	"nfemissao"			TIMESTAMP WITHOUT TIME ZONE,
	"id"			bigserial,
	"nfcontrole"			SERIAL,
	"nfempresa"			INTEGER,
	"nfdata"			TIMESTAMP WITHOUT TIME ZONE
);

COMMENT ON COLUMN "contabil"."nota_fiscal"."nfnumero" IS 'Número da Nota Fiscal.';

COMMENT ON COLUMN "contabil"."nota_fiscal"."nfidvenda" IS 'Número de controle interno da Venda.';

COMMENT ON COLUMN "contabil"."nota_fiscal"."nfemissao" IS 'Data da emissão da Nota Fiscal.';

COMMENT ON COLUMN "contabil"."nota_fiscal"."nfcontrole" IS 'controle interno para notas fiscais.';

COMMENT ON COLUMN "contabil"."nota_fiscal"."nfempresa" IS 'Identifica a empresa na emissão de Notas Fiscais';

-- CREATE INDEXES ...
CREATE INDEX "notasfiscais_nfcontrole1_idx" ON "contabil"."nota_fiscal" ("nfcontrole");

CREATE INDEX "notasfiscais_nfemissao_idx" ON "contabil"."nota_fiscal" ("nfemissao");

CREATE UNIQUE INDEX "notasfiscais_nfidvenda_idx" ON "contabil"."nota_fiscal" ("nfidvenda");

CREATE INDEX "notasfiscais_nfnumero_idx" ON "contabil"."nota_fiscal" ("nfnumero");

ALTER TABLE "contabil"."nota_fiscal" ADD CONSTRAINT "notasfiscais_pkey" PRIMARY KEY ("nfnumero", "nfidvenda", "nfemissao");

CREATE UNIQUE INDEX "notasfiscais_ID_idx" ON "contabil"."nota_fiscal" ("id");

-- CREATE Relationships ...
-- Relationship from "contabil"."nota_fiscal" ("nfnumero") to "contabil"."nota_fiscal_formulario"("nfrnumero") does not enforce integrity.
-- Relationship from "contabil"."nota_fiscal" ("nfidvenda") to "contabil"."nota_fiscal_formulario"("nfrvenda") does not enforce integrity.
-- Relationship from "contabil"."nota_fiscal" ("nfemissao") to "contabil"."nota_fiscal_formulario"("nfremissao") does not enforce integrity.
-- Relationship from "contabil"."nota_fiscal" ("nfempresa") to "pessoa"."empresa"("codigo") does not enforce integrity.
--sql script successful >>> /tmp/qbdados/2/notasfiscais.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "deposito"."produtosestoque"
 (
	"id"			bigserial,
	"estempresa"			INTEGER,
	"estid"			VARCHAR (40),
	"estcodigo"			VARCHAR (60),
	"estqtd"			DOUBLE PRECISION
);

COMMENT ON COLUMN "deposito"."produtosestoque"."estempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "deposito"."produtosestoque"."estid" IS 'Código de Identificação do produto.';

COMMENT ON COLUMN "deposito"."produtosestoque"."estcodigo" IS 'Indentificação do tipo de estoque.';

COMMENT ON COLUMN "deposito"."produtosestoque"."estqtd" IS 'Quantidade disponível em estoque.';

-- CREATE INDEXES ...
CREATE INDEX "produtosestoque_estcodigo_idx" ON "deposito"."produtosestoque" ("estcodigo");

ALTER TABLE "deposito"."produtosestoque" ADD CONSTRAINT "produtosestoque_pkey" PRIMARY KEY ("estempresa", "estid", "estcodigo");

CREATE UNIQUE INDEX "produtosestoque_prodempresa_idx" ON "deposito"."produtosestoque" ("estempresa");

CREATE INDEX "produtosestoque_prodid_idx" ON "deposito"."produtosestoque" ("estid");

CREATE INDEX "produtosestoque_ID_idx" ON "deposito"."produtosestoque" ("id");

-- CREATE Relationships ...
ALTER TABLE "deposito"."produtosestoque" ADD CONSTRAINT "produtosestoque_estempresa_fk" FOREIGN KEY ("estempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "deposito"."produtosestoque" ADD CONSTRAINT "produtosestoque_estid_fk" FOREIGN KEY ("estid") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/produtosestoque.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "deposito"."produtosfornecedor"
 (
	"prodforempresa"			INTEGER,
	"id"			bigserial,
	"prodforproduto"			VARCHAR (40),
	"prodfornecedor"			VARCHAR (32),
	"prodforcotacao"			DOUBLE PRECISION,
	"prodfordata"			DATE,
	"prodforcodigo"			VARCHAR (40),
	"prodformoeda"			VARCHAR (20)
);

COMMENT ON COLUMN "deposito"."produtosfornecedor"."prodforempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "deposito"."produtosfornecedor"."prodforproduto" IS 'Código do produto.';

COMMENT ON COLUMN "deposito"."produtosfornecedor"."prodfornecedor" IS 'Código do fornecedor do produto.';

COMMENT ON COLUMN "deposito"."produtosfornecedor"."prodforcotacao" IS 'Valor da última cotação de preços.';

COMMENT ON COLUMN "deposito"."produtosfornecedor"."prodfordata" IS 'Data da última cotação de preços.';

COMMENT ON COLUMN "deposito"."produtosfornecedor"."prodforcodigo" IS 'Código utilizado pelo fornecedor para identificar o produto.';

COMMENT ON COLUMN "deposito"."produtosfornecedor"."prodformoeda" IS 'Código da Moeda da Cotação';

-- CREATE INDEXES ...
CREATE INDEX "produtosfornecedor_Código_idx" ON "deposito"."produtosfornecedor" ("prodforproduto");

CREATE INDEX "produtosfornecedor_Código do Suprimento_idx" ON "deposito"."produtosfornecedor" ("prodfornecedor");

ALTER TABLE "deposito"."produtosfornecedor" ADD CONSTRAINT "produtosfornecedor_pkey" PRIMARY KEY ("prodforempresa", "prodforproduto", "prodfornecedor");

CREATE UNIQUE INDEX "produtosfornecedor_prodempresa_idx" ON "deposito"."produtosfornecedor" ("prodforempresa");

CREATE UNIQUE INDEX "produtosfornecedor_ID_idx" ON "deposito"."produtosfornecedor" ("id");

-- CREATE Relationships ...
ALTER TABLE "deposito"."produtosfornecedor" ADD CONSTRAINT "produtosfornecedor_prodfornecedor_fk" FOREIGN KEY ("prodfornecedor") REFERENCES "pessoa"."fornecedor"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "deposito"."produtosfornecedor" ADD CONSTRAINT "produtosfornecedor_prodforempresa_fk" FOREIGN KEY ("prodforempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "deposito"."produtosfornecedor" ADD CONSTRAINT "produtosfornecedor_prodforproduto_fk" FOREIGN KEY ("prodforproduto") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "deposito"."produtosfornecedor" ADD CONSTRAINT "produtosfornecedor_prodformoeda_fk" FOREIGN KEY ("prodformoeda") REFERENCES "compras"."moeda"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/produtosfornecedor.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "deposito"."produtoslinha"
 (
	"codigo"			VARCHAR (30),
	"plindecricao"			VARCHAR (480),
	"plincomissao"			DOUBLE PRECISION,
	"padrao"			BOOL NOT NULL,
	"plinccustovenda"			INTEGER,
	"plinccustocusto"			INTEGER,
	"plinweb"			BOOL NOT NULL,
	"pliempresa"			INTEGER,
	"plincomentario"			TEXT,
	"plinqtdnf"			BOOL NOT NULL,
	"plinresumida"			VARCHAR (100),
	"Gen_plincomentario"			INTEGER,
	"id"			bigserial
);

COMMENT ON COLUMN "deposito"."produtoslinha"."codigo" IS 'Código de identificação da linha de produto/serviço.';

COMMENT ON COLUMN "deposito"."produtoslinha"."plindecricao" IS 'Descrição completa da linha de produto/serviço.';

COMMENT ON COLUMN "deposito"."produtoslinha"."plincomissao" IS 'Taxa de comissão para a linha de produto/serviço.';

COMMENT ON COLUMN "deposito"."produtoslinha"."padrao" IS 'Registro Padrão';

COMMENT ON COLUMN "deposito"."produtoslinha"."plinccustovenda" IS 'Centro de custos de receita de vendas';

COMMENT ON COLUMN "deposito"."produtoslinha"."plinccustocusto" IS 'Centro de custo de custos de vendas';

COMMENT ON COLUMN "deposito"."produtoslinha"."plinweb" IS 'Identifica se a linha deve ser disponibilizada na Web';

COMMENT ON COLUMN "deposito"."produtoslinha"."pliempresa" IS 'Identifica a empresa';

COMMENT ON COLUMN "deposito"."produtoslinha"."plincomentario" IS 'Identifica o comentário padrão na nota fiscal';

COMMENT ON COLUMN "deposito"."produtoslinha"."plinqtdnf" IS 'Identifica se o sistema deve calcular o total de volumes na nota';

COMMENT ON COLUMN "deposito"."produtoslinha"."plinresumida" IS 'Identificar o nome da linha de produtos/serviços permitindo que diferentes empresas trabalhem com linhas de nomes idênticos';

-- CREATE INDEXES ...
CREATE INDEX "produtoslinha_codigo_idx" ON "deposito"."produtoslinha" ("codigo");

ALTER TABLE "deposito"."produtoslinha" ADD CONSTRAINT "produtoslinha_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "produtoslinha_ID_idx" ON "deposito"."produtoslinha" ("id");

-- CREATE Relationships ...
-- Relationship from "deposito"."produtoslinha" ("plinccustovenda") to "contabil"."tipo_centro_custo"("codigo") does not enforce integrity.
ALTER TABLE "deposito"."produtoslinha" ADD CONSTRAINT "produtoslinha_pliempresa_fk" FOREIGN KEY ("pliempresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/produtoslinha.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "deposito"."produtosprecocliente"
 (
	"id"			bigserial,
	"espprod"			VARCHAR (40),
	"espcli"			VARCHAR (32),
	"espempresa"			INTEGER,
	"esppreco"			DOUBLE PRECISION,
	"espfator"			VARCHAR (100),
	"espfator2"			DOUBLE PRECISION
);

COMMENT ON COLUMN "deposito"."produtosprecocliente"."espprod" IS 'Identifica o Produto';

COMMENT ON COLUMN "deposito"."produtosprecocliente"."espcli" IS 'Identifica o cliente';

COMMENT ON COLUMN "deposito"."produtosprecocliente"."espempresa" IS 'Identifica a empresa';

COMMENT ON COLUMN "deposito"."produtosprecocliente"."esppreco" IS 'Identifica o preço negociado.';

COMMENT ON COLUMN "deposito"."produtosprecocliente"."espfator" IS 'identifica um fator txt para uso posterior';

COMMENT ON COLUMN "deposito"."produtosprecocliente"."espfator2" IS 'identifica um fator numérico para uso posterior';

-- CREATE INDEXES ...
ALTER TABLE "deposito"."produtosprecocliente" ADD CONSTRAINT "produtosprecocliente_pkey" PRIMARY KEY ("espprod", "espcli", "espempresa");

CREATE UNIQUE INDEX "produtosprecocliente_ID_idx" ON "deposito"."produtosprecocliente" ("id");

-- CREATE Relationships ...
ALTER TABLE "deposito"."produtosprecocliente" ADD CONSTRAINT "produtosprecocliente_espempresa_fk" FOREIGN KEY ("espempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "deposito"."produtosprecocliente" ADD CONSTRAINT "produtosprecocliente_espprod_fk" FOREIGN KEY ("espprod") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "deposito"."produtosprecocliente" ADD CONSTRAINT "produtosprecocliente_espcli_fk" FOREIGN KEY ("espcli") REFERENCES "pessoa"."cliente"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/produtosprecocliente.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "deposito"."produto"
 (
	"Gen_TempField*0"			INTEGER,
	"Gen_TempField*1"			INTEGER,
	"prodid"			VARCHAR (40),
	"Gen_prodcompleta"			INTEGER,
	"prodempresa"			INTEGER,
	"Gen_prodfoto"			INTEGER,
	"prodlinha"			VARCHAR (60),
	"prodresumida"			VARCHAR (200),
	"prodcompleta"			TEXT,
	"produnidade"			VARCHAR (20),
	"id"			bigserial,
	"prodpeso"			DOUBLE PRECISION,
	"prodembalagem"			VARCHAR (30),
	"prodtamanho"			VARCHAR (30),
	"prodfoto2"			BYTEA,
	"prodfoto"			VARCHAR (200),
	"prodreservada"			DOUBLE PRECISION,
	"prodminimo"			DOUBLE PRECISION,
	"prodgarantia"			VARCHAR (70),
	"prodativo"			BOOL NOT NULL,
	"prodpreco01"			DOUBLE PRECISION,
	"prodpreco02"			DOUBLE PRECISION,
	"prodpreco03"			DOUBLE PRECISION,
	"prodpreco04"			DOUBLE PRECISION,
	"prodvigencia"			DATE,
	"prodipi"			DOUBLE PRECISION,
	"prodicms"			DOUBLE PRECISION,
	"prodcusto01"			DOUBLE PRECISION,
	"prodcusto02"			DOUBLE PRECISION,
	"prodimpincluso"			BOOL NOT NULL,
	"prodlucro"			DOUBLE PRECISION,
	"prodcfiscal"			VARCHAR (40),
	"prodctributacao"			VARCHAR (6),
	"prodpesoliq"			DOUBLE PRECISION,
	"produnidembal"			DOUBLE PRECISION,
	"prodfator"			DOUBLE PRECISION,
	"prodformato"			VARCHAR (20),
	"prodvenda"			BOOL NOT NULL,
	"prodcompra"			BOOL NOT NULL,
	"Prodoperador"			VARCHAR (30),
	"prodmoeda"			VARCHAR (20),
	"produnidcompra"			VARCHAR (20),
	"prodfatorcompra"			DOUBLE PRECISION,
	"prodcomponente"			BOOL NOT NULL,
	"prodlocalização"			VARCHAR (100),
	"prodproducao"			BOOL NOT NULL,
	"prodleadtime"			INTEGER,
	"prodloteconomico"			DOUBLE PRECISION,
	"prodqtdcritica"			DOUBLE PRECISION,
	"prodqtddesejada"			DOUBLE PRECISION,
	"proddatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"prodlivre1"			TEXT,
	"prodlivre2"			TEXT,
	"proddiasestoque"			INTEGER,
	"prodweb"			BOOL NOT NULL,
	"prodqtdvenmin"			DOUBLE PRECISION,
	"prodicmscompra"			DOUBLE PRECISION,
	"prodipicompra"			DOUBLE PRECISION,
	"prodinfopesounid"			VARCHAR (20),
	"prodinfoembunid"			VARCHAR (20),
	"prodsubstituicao"			BOOL NOT NULL,
	"prodaliqsub"			DOUBLE PRECISION,
	"prodbasesub"			VARCHAR (80),
	"prodvalorsub"			VARCHAR (80),
	"prodbasereducao"			VARCHAR (80),
	"prodvalorreducao"			VARCHAR (80),
	"prodreducao"			BOOL NOT NULL,
	"prodbarras"			VARCHAR (278),
	"prodbarras2"			VARCHAR (278),
	"prodcsosn"			VARCHAR (6)
);

COMMENT ON COLUMN "deposito"."produto"."prodid" IS 'Código de Identificação do produto.';

COMMENT ON COLUMN "deposito"."produto"."prodempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "deposito"."produto"."prodlinha" IS 'Código de identificação da linha';

COMMENT ON COLUMN "deposito"."produto"."prodresumida" IS 'Descrição resumida do produto.';

COMMENT ON COLUMN "deposito"."produto"."prodcompleta" IS 'Descrição detalhada do produto.';

COMMENT ON COLUMN "deposito"."produto"."produnidade" IS 'Código de do tipo de unidade.';

COMMENT ON COLUMN "deposito"."produto"."prodpeso" IS 'Pêso total em Kg.';

COMMENT ON COLUMN "deposito"."produto"."prodembalagem" IS 'Identificação do tipo de embalagem.';

COMMENT ON COLUMN "deposito"."produto"."prodtamanho" IS 'Dimensões do produto.';

COMMENT ON COLUMN "deposito"."produto"."prodfoto2" IS 'Fotografia ou diagrama do produto.';

COMMENT ON COLUMN "deposito"."produto"."prodreservada" IS 'Quantidade reservada em estoque.';

COMMENT ON COLUMN "deposito"."produto"."prodminimo" IS 'Quantidade de estoque mínimo.';

COMMENT ON COLUMN "deposito"."produto"."prodgarantia" IS 'Tempo de garantia.';

COMMENT ON COLUMN "deposito"."produto"."prodativo" IS 'Determina se o produto é ativo ou não.';

COMMENT ON COLUMN "deposito"."produto"."prodpreco01" IS 'Preço de Venda relativo à Tabela de Preços 01.';

COMMENT ON COLUMN "deposito"."produto"."prodpreco02" IS 'Preço de Venda relativo à Tabela de Preços 02.';

COMMENT ON COLUMN "deposito"."produto"."prodpreco03" IS 'Preço de Venda relativo à Tabela de Preços 03.';

COMMENT ON COLUMN "deposito"."produto"."prodpreco04" IS 'Preço de Venda sugerido em função do custo, impostos e lucro.';

COMMENT ON COLUMN "deposito"."produto"."prodvigencia" IS 'Data de limite de vigência para as Tabelas de Preços.';

COMMENT ON COLUMN "deposito"."produto"."prodipi" IS 'Percentual de IPI.';

COMMENT ON COLUMN "deposito"."produto"."prodicms" IS 'Percentual de ICMS.';

COMMENT ON COLUMN "deposito"."produto"."prodcusto01" IS 'Valor do custo por média ponderada.';

COMMENT ON COLUMN "deposito"."produto"."prodcusto02" IS 'Valor do custo pela última compra.';

COMMENT ON COLUMN "deposito"."produto"."prodimpincluso" IS 'Determina se o IPI está incluso ou não no preço de venda.';

COMMENT ON COLUMN "deposito"."produto"."prodlucro" IS 'Determina a margem de lucro desejada para o produto.';

COMMENT ON COLUMN "deposito"."produto"."prodcfiscal" IS 'Identifica o Código de Classificação Fiscal do produto.';

COMMENT ON COLUMN "deposito"."produto"."prodctributacao" IS 'Identifica o Código de Tributação do Produto.';

COMMENT ON COLUMN "deposito"."produto"."prodpesoliq" IS 'Identifica o peso da embalagem';

COMMENT ON COLUMN "deposito"."produto"."produnidembal" IS 'Identifica o número de unidades em uma embalagem.';

COMMENT ON COLUMN "deposito"."produto"."prodfator" IS 'Identifica o fator de unidades do produto.';

COMMENT ON COLUMN "deposito"."produto"."prodformato" IS 'Identifica diferentes formatos nos produtos';

COMMENT ON COLUMN "deposito"."produto"."prodvenda" IS 'Produto de Venda';

COMMENT ON COLUMN "deposito"."produto"."prodcompra" IS 'Produto de Compra';

COMMENT ON COLUMN "deposito"."produto"."Prodoperador" IS 'Operador';

COMMENT ON COLUMN "deposito"."produto"."prodmoeda" IS 'Moeda da Tabela de Preços';

COMMENT ON COLUMN "deposito"."produto"."produnidcompra" IS 'Unidade de Compra do Produto';

COMMENT ON COLUMN "deposito"."produto"."prodfatorcompra" IS 'Fator de Conversão para unidade de venda';

COMMENT ON COLUMN "deposito"."produto"."prodcomponente" IS 'Identifica de o produto é componente de produção';

COMMENT ON COLUMN "deposito"."produto"."prodlocalização" IS 'Identifica o local de estoque onde o produto se encontra';

COMMENT ON COLUMN "deposito"."produto"."prodproducao" IS 'Identifica se o produto aparece na OP';

COMMENT ON COLUMN "deposito"."produto"."prodleadtime" IS 'Identifica o número de dias de entrega.';

COMMENT ON COLUMN "deposito"."produto"."prodloteconomico" IS 'Identifica o número de Lote Económico de Compras';

COMMENT ON COLUMN "deposito"."produto"."prodqtdcritica" IS 'Identifica a quantidade de estoque crítica';

COMMENT ON COLUMN "deposito"."produto"."prodqtddesejada" IS 'Identifica a quantidade de estoque desejada';

COMMENT ON COLUMN "deposito"."produto"."proddatamod" IS 'Data da última modoficação';

COMMENT ON COLUMN "deposito"."produto"."prodlivre1" IS 'livre1';

COMMENT ON COLUMN "deposito"."produto"."prodlivre2" IS 'livre2';

COMMENT ON COLUMN "deposito"."produto"."proddiasestoque" IS 'Identifica a quantidade de dias de estoque desejadas';

COMMENT ON COLUMN "deposito"."produto"."prodweb" IS 'Identifica se o Produto deve ser disponibilizado na Web';

COMMENT ON COLUMN "deposito"."produto"."prodqtdvenmin" IS 'Identifica a quantidade mínima a ser vendida do produto (=0 não controlada;<>0 controlada)';

COMMENT ON COLUMN "deposito"."produto"."prodicmscompra" IS 'Identifica a alíquota de icms na compra';

COMMENT ON COLUMN "deposito"."produto"."prodipicompra" IS 'Identifica a alíquota de ipi na compra';

COMMENT ON COLUMN "deposito"."produto"."prodinfopesounid" IS 'Unidade do peso';

COMMENT ON COLUMN "deposito"."produto"."prodinfoembunid" IS 'Unidade da embalagem';

-- CREATE INDEXES ...
CREATE INDEX "produtos_Descrição Resumida_idx" ON "deposito"."produto" ("prodresumida");

CREATE INDEX "produtos_Linha de Produto_idx" ON "deposito"."produto" ("prodlinha");

ALTER TABLE "deposito"."produto" ADD CONSTRAINT "produtos_pkey" PRIMARY KEY ("prodempresa", "prodid");

CREATE INDEX "produtos_prodempresa_idx" ON "deposito"."produto" ("prodempresa");

CREATE INDEX "produtos_prodid_idx" ON "deposito"."produto" ("prodid");

CREATE INDEX "produtos_ID_idx" ON "deposito"."produto" ("id");

-- CREATE Relationships ...
ALTER TABLE "deposito"."produto" ADD CONSTRAINT "produtos_prodlinha_fk" FOREIGN KEY ("prodlinha") REFERENCES "deposito"."produtoslinha"("codigo") ON UPDATE CASCADE;

ALTER TABLE "deposito"."produto" ADD CONSTRAINT "produtos_prodempresa_fk" FOREIGN KEY ("prodempresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "deposito"."produto" ADD CONSTRAINT "produtos_prodcfiscal_fk" FOREIGN KEY ("prodcfiscal") REFERENCES "loja"."classificacao_fiscal"("codigo") ON UPDATE CASCADE;

ALTER TABLE "deposito"."produto" ADD CONSTRAINT "produtos_produnidade_fk" FOREIGN KEY ("produnidade") REFERENCES "servicos"."undmedida"("codigo") ON UPDATE CASCADE;

ALTER TABLE "deposito"."produto" ADD CONSTRAINT "produtos_prodctributacao_fk" FOREIGN KEY ("prodctributacao") REFERENCES "contabil"."codtributorigem"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/produtos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."produto_promocao"
 (
	"id"			bigserial,
	"pmppromocao"			bigint,
	"pmpempresa"			bigint,
	"pmpproduto"			bigint,
	"pmpdesconto"			DOUBLE PRECISION
);

COMMENT ON COLUMN "telemarketing"."produto_promocao"."pmppromocao" IS 'Código de identificação da promoção.';

COMMENT ON COLUMN "telemarketing"."produto_promocao"."pmpempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."produto_promocao"."pmpproduto" IS 'Código de identificação do produto.';

COMMENT ON COLUMN "telemarketing"."produto_promocao"."pmpdesconto" IS 'Percentual de desconto.';

-- CREATE INDEXES ...
CREATE INDEX "promocaoprodutos_Código_idx" ON "telemarketing"."produto_promocao" ("pmpproduto");

CREATE INDEX "promocaoprodutos_Código da Promoção_idx" ON "telemarketing"."produto_promocao" ("pmppromocao");

ALTER TABLE "telemarketing"."produto_promocao" ADD CONSTRAINT "promocaoprodutos_pkey" PRIMARY KEY ("id");

CREATE INDEX "promocaoprodutos_prodempresa_idx" ON "telemarketing"."produto_promocao" ("pmpempresa");

CREATE INDEX "promocaoprodutos_composta_idx" ON "telemarketing"."produto_promocao" ("pmppromocao", "pmpempresa", "pmpproduto");

-- CREATE Relationships ...
ALTER TABLE "telemarketing"."produto_promocao" ADD CONSTRAINT "promocaoprodutos_promocao_fk" FOREIGN KEY ("pmppromocao") REFERENCES "telemarketing"."promocao"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "telemarketing"."produto_promocao" ADD CONSTRAINT "promocaoprodutos_empresa_fk" FOREIGN KEY ("pmpempresa") REFERENCES "pessoa"."empresa"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "telemarketing"."produto_promocao" ADD CONSTRAINT "promocaoprodutos_produto_fk" FOREIGN KEY ("pmpproduto") REFERENCES "deposito"."produto"("id") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/promocaoprodutos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."promocao"
 (
	"Gen_promdescricao"			INTEGER,
	"id"			bigserial,
	"promempresa"			INTEGER,
	"promid"			VARCHAR (30),
	"promdescricao"			TEXT,
	"promveiculo"			VARCHAR (100),
	"prominicio"			DATE,
	"promfim"			DATE,
	"promweb"			BOOL NOT NULL
);

COMMENT ON COLUMN "telemarketing"."promocao"."promempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."promocao"."promid" IS 'Código de identificação da promoção.';

COMMENT ON COLUMN "telemarketing"."promocao"."promdescricao" IS 'Descrição detalhada da promoção.';

COMMENT ON COLUMN "telemarketing"."promocao"."promveiculo" IS 'Tipo de veiculo utilizado para divulgação.';

COMMENT ON COLUMN "telemarketing"."promocao"."prominicio" IS 'Data de início da promoção.';

COMMENT ON COLUMN "telemarketing"."promocao"."promfim" IS 'Data de término da promoção.';

COMMENT ON COLUMN "telemarketing"."promocao"."promweb" IS 'Identifica se a promoção deve ser diponibilizada na Web';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "promocao_pmpempresa_idx" ON "telemarketing"."promocao" ("promempresa");

ALTER TABLE "telemarketing"."promocao" ADD CONSTRAINT "promocao_pkey" PRIMARY KEY ("promempresa", "promid");

CREATE UNIQUE INDEX "promocao_promid_idx" ON "telemarketing"."promocao" ("promid");

CREATE UNIQUE INDEX "promocao_ID_idx" ON "telemarketing"."promocao" ("id");

-- CREATE Relationships ...
ALTER TABLE "telemarketing"."promocao" ADD CONSTRAINT "promocao_promempresa_fk" FOREIGN KEY ("promempresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/promocao.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."proposta_parametrizada"
 (
	"id"			bigserial,
	"empresa_id"			INTEGER,
	"propapresentacao"			TEXT,
	"propescopo"			TEXT,
	"Moeda"			TEXT,
	"propobservacao"			TEXT,
	"propconversao"			TEXT,
	"propvalidade"			TEXT,
	"propgarantia"			TEXT,
	"Gen_Moeda"			INTEGER,
	"Gen_propapresentacao"			INTEGER,
	"Gen_propconversao"			INTEGER,
	"Gen_propescopo"			INTEGER,
	"Gen_propgarantia"			INTEGER,
	"Gen_propobservacao"			INTEGER,
	"Gen_propvalidade"			INTEGER
);
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."empresa_id" IS 'Código de Identificação da Empresa';
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."propapresentacao" IS 'Campo de Apresentação da Proposta';
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."propescopo" IS 'Campo de Escopo da Proposta';
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."Moeda" IS 'Moeda da Proposta';
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."propobservacao" IS 'Observação da Proposta';
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."propconversao" IS 'Conversão da Proposta';
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."propvalidade" IS 'Validade da Proposta';
COMMENT ON COLUMN "telemarketing"."proposta_parametrizada"."propgarantia" IS 'Garantia da Proposta';
-- CREATE INDEXES ...
ALTER TABLE "telemarketing"."proposta_parametrizada" ADD CONSTRAINT "propostaparametrizada_pkey" PRIMARY KEY ("id");
CREATE INDEX "propostaparametrizada_ID_idx" ON "telemarketing"."proposta_parametrizada" ("empresa_id");
-- CREATE Relationships ...
ALTER TABLE "telemarketing"."proposta_parametrizada" ADD CONSTRAINT "propostaparametrizada_empresa_fk" FOREIGN KEY ("empresa_id") REFERENCES "pessoa"."empresa"("id") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/propostaparametrizada.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."receberpagar"
 (
	"ctrpempresa"			INTEGER NOT NULL,
	"ctrptipo"			INTEGER,
	"ctrpvencimento"			DATE,
	"id"			bigserial,
	"ctrpdatacontrol"			TIMESTAMP WITHOUT TIME ZONE,
	"ctrpccustos"			INTEGER,
	"ctrpcontrapartida"			INTEGER,
	"ctrptipocontra"			INTEGER,
	"ctrpccustoscontra"			INTEGER,
	"codigoentifica"			VARCHAR (32),
	"ctrpparcela"			INTEGER,
	"ctrpcontrole"			INTEGER,
	"ctrpdocumento"			VARCHAR (40),
	"ctrpdocorigem"			DOUBLE PRECISION,
	"ctrpdocorigemcpl"			VARCHAR (100),
	"ctrpvalor"			DOUBLE PRECISION,
	"ctrpsaldo"			DOUBLE PRECISION,
	"ctrpcredito"			DOUBLE PRECISION,
	"ctrpsaldoconta"			DOUBLE PRECISION,
	"ctrphistorico"			VARCHAR (510),
	"ctrpquitado"			BOOL NOT NULL,
	"ctrpflagcontrole"			BOOL NOT NULL,
	"ctrppago"			BOOL NOT NULL,
	"ctrprecpag"			BOOL NOT NULL,
	"ctrpatvpas"			BOOL NOT NULL,
	"ctrpreceberpagar"			BOOL NOT NULL,
	"ctrpconsolidado"			BOOL NOT NULL,
	"ctrpdatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"ctrpoperador"			VARCHAR (30),
	"ctrpmoeda"			VARCHAR (20),
	"codigo"			SERIAL,
	"ctrpdata"			TIMESTAMP WITHOUT TIME ZONE,
	"ctrpparcial"			BOOL NOT NULL,
	"ctrpparcialrecpag"			BOOL NOT NULL,
	"ctrpnn"			VARCHAR (100),
	"ctrpbanco"			INTEGER,
	"ctrpcarteira"			VARCHAR (6)
);

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrptipo" IS 'Descrição do tipo de Receita ou Despesa.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpvencimento" IS 'Data de vencimento da receita ou despesa.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpdatacontrol" IS 'Data e Hora de controle do faturamento.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpccustos" IS 'número de identificação do centro de custos';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpcontrapartida" IS 'número da contrapartida';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrptipocontra" IS 'Conta da contrapartida';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpccustoscontra" IS 'Centro de Custos da Contrapartida';

COMMENT ON COLUMN "telemarketing"."receberpagar"."codigoentifica" IS 'Código de identificação do Credor/Devedor.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpparcela" IS 'Número de identificação da parcela da receita ou despesa.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpcontrole" IS 'Número interno de controle da venda ou compra.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpdocumento" IS 'Tipo de documento referente a receita ou despesa.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpdocorigem" IS 'Número de identificação do documento de origem.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpdocorigemcpl" IS 'Complemento do documento de origem.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpvalor" IS 'Valor correspondente a parcela de receita ou despesa.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpsaldo" IS 'Valor correspondente ao saldo pendente da parcela.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpcredito" IS 'Valor de creedor na conta';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpsaldoconta" IS 'Saldo atual da conta contábil';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrphistorico" IS 'Histórico do provisionamento de Receitas e ou Despesas.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpquitado" IS 'Flag de controle de quitação de pagamento.';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpflagcontrole" IS 'Determina se a parcela a receber/pagar pode ser alterada ou excluida (correspondentes aos valores gerados por Compras e Vendas).';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrppago" IS 'Duplicata = Sim ; Outros = Não';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrprecpag" IS 'Flag de controle de receita ou despesa.(Sim = Receber/Ativo - Não = Pagar/Passivo)';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpatvpas" IS 'Flag de Controle de Ativo/Passivo ou Receita/Despesa (Sim=Ativo/Passivo - Não=Receita/Despesa)';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpreceberpagar" IS 'Identifica se é um lançamento de contas a pagar/receber (Sim=Receber/Pagar ; Não=Outros)';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpconsolidado" IS 'Conciliado?';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpdatamod" IS 'Data da última modificação';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpoperador" IS 'Operador';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpmoeda" IS 'Moeda do Lançamento';

COMMENT ON COLUMN "telemarketing"."receberpagar"."codigo" IS 'Controle interno';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpdata" IS 'Data do lançamento';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpnn" IS 'Nosso Número';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpbanco" IS 'Numero';

COMMENT ON COLUMN "telemarketing"."receberpagar"."ctrpcarteira" IS 'Carteira';

-- CREATE INDEXES ...
CREATE INDEX "receberpagar_ctrpcontrapartida_idx" ON "telemarketing"."receberpagar" ("ctrpcontrapartida");

CREATE INDEX "receberpagar_ctrpcontrole_idx" ON "telemarketing"."receberpagar" ("ctrpcontrole");

CREATE INDEX "receberpagar_ctrpdocorigem_idx" ON "telemarketing"."receberpagar" ("ctrpdocorigem");

CREATE INDEX "receberpagar_ctrpempresa_idx" ON "telemarketing"."receberpagar" ("ctrpempresa");

CREATE INDEX "receberpagar_ctrpempresactrptipoctrpvencimentoctrpdatacontrol_idx" ON "telemarketing"."receberpagar" ("ctrpempresa", "ctrptipo", "ctrpvencimento", "ctrpdatacontrol");

CREATE INDEX "receberpagar_codigo_idx" ON "telemarketing"."receberpagar" ("codigo");

CREATE INDEX "receberpagar_codigoentifica_idx" ON "telemarketing"."receberpagar" ("codigoentifica");

CREATE INDEX "receberpagar_ctrpquitado_idx" ON "telemarketing"."receberpagar" ("ctrpquitado");

CREATE INDEX "receberpagar_ctrprecpag_idx" ON "telemarketing"."receberpagar" ("ctrprecpag");

CREATE INDEX "receberpagar_ctrptipo_idx" ON "telemarketing"."receberpagar" ("ctrptipo");

CREATE INDEX "receberpagar_ctrptipocontra_idx" ON "telemarketing"."receberpagar" ("ctrptipocontra");

CREATE INDEX "receberpagar_ctrpvencimento_idx" ON "telemarketing"."receberpagar" ("ctrpvencimento");

CREATE INDEX "receberpagar_fatdatacontrol_idx" ON "telemarketing"."receberpagar" ("ctrpdatacontrol");

ALTER TABLE "telemarketing"."receberpagar" ADD CONSTRAINT "receberpagar_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "receberpagar_ID_idx" ON "telemarketing"."receberpagar" ("id");

-- CREATE Relationships ...
-- Relationship from "telemarketing"."receberpagar" ("ctrpcontrole") to "telemarketing"."venda_faturada"("fatvenda") does not enforce integrity.
-- Relationship from "telemarketing"."receberpagar" ("ctrpdatacontrol") to "telemarketing"."venda_faturada"("fatdatacontrol") does not enforce integrity.
ALTER TABLE "telemarketing"."receberpagar" ADD CONSTRAINT "receberpagar_ctrpempresa_fk" FOREIGN KEY ("ctrpempresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "telemarketing"."receberpagar" ADD CONSTRAINT "receberpagar_ctrpccustos_fk" FOREIGN KEY ("ctrpccustos") REFERENCES "contabil"."tipo_centro_custo"("codigo") ON UPDATE CASCADE;
ALTER TABLE "telemarketing"."receberpagar" ADD CONSTRAINT "receberpagar_ctrptipo_fk" FOREIGN KEY ("ctrptipo") REFERENCES "telemarketing"."tiporecdesp"("codigo") ON UPDATE CASCADE;
-- Relationship from "telemarketing"."receberpagar" ("codigoentifica") to "pessoa"."cliente"("codigo") does not enforce integrity.
--sql script successful >>> /tmp/qbdados/2/receberpagar.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."cliente_empresa"
 (
	"id"			bigserial,
	"empresa_id"			VARCHAR (32),
	"cliente_id"			INTEGER
);
COMMENT ON COLUMN "pessoa"."cliente_empresa"."empresa_id" IS 'Número do CGC ou do CPF.';
COMMENT ON COLUMN "pessoa"."cliente_empresa"."cliente_id" IS 'Código de identificação da empresa.';
-- CREATE INDEXES ...
ALTER TABLE "pessoa"."cliente_empresa" ADD CONSTRAINT "relcliempresa_pkey" PRIMARY KEY ("id");
CREATE UNIQUE INDEX "relcliempresa_empresa_idx" ON "pessoa"."cliente_empresa" ("relcodigo");
CREATE UNIQUE INDEX "relcliempresa_cliente_idx" ON "pessoa"."cliente_empresa" ("relcodigo");
CREATE UNIQUE INDEX "relcliempresa_ID_idx" ON "pessoa"."cliente_empresa" ("id");
-- CREATE Relationships ...
ALTER TABLE "loja"."empresa_id" ADD CONSTRAINT "relcliempresa_empresa_fk" FOREIGN KEY ("empresa_id") REFERENCES "pessoa"."empresa"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "loja"."cliente_id" ADD CONSTRAINT "relcliempresa_cliente_fk" FOREIGN KEY ("cliente_id") REFERENCES "pessoa"."cliente"("id") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/relcliempresa.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."fornecedor_empresa"
 (
	"id"			bigserial,
	"fornecedor_id"			VARCHAR (32),
	"empresa_id"			INTEGER
);
COMMENT ON COLUMN "pessoa"."fornecedor_empresa"."fornecedor_id" IS 'Número do CGC ou do CPF.';
COMMENT ON COLUMN "pessoa"."fornecedor_empresa"."empresa_id" IS 'Código de identificação da empresa.';
-- CREATE INDEXES ...
ALTER TABLE "pessoa"."fornecedor_empresa" ADD CONSTRAINT "relforempresa_pkey" PRIMARY KEY ("id");
CREATE UNIQUE INDEX "relforempresa_fornecedor_idx" ON "pessoa"."fornecedor_empresa" ("fornecedor_id");
CREATE UNIQUE INDEX "relforempresa_empresa_idx" ON "pessoa"."fornecedor_empresa" ("empresa_id");
CREATE INDEX "relforempresa_ID_idx" ON "pessoa"."fornecedor_empresa" ("id");
-- CREATE Relationships ...
ALTER TABLE "loja"."fornecedor_id" ADD CONSTRAINT "relforempresa_fornecedor_fk" FOREIGN KEY ("fornecedor_id") REFERENCES "pessoa"."fornecedor"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "loja"."empresa_id" ADD CONSTRAINT "relforempresa_empresa_fk" FOREIGN KEY ("empresa_id") REFERENCES "pessoa"."empresa"("id") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/relforempresa.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."funcionario_empresa"
 (
	"id"			bigserial,
	"funcionario_id"	bigint,
	"empresa_id"		bigint
);
COMMENT ON COLUMN "pessoa"."funcionario_empresa"."funcionario_id" IS 'Código do funcionário';
COMMENT ON COLUMN "pessoa"."funcionario_empresa"."empresa_id" IS 'Código de identificação da empresa.';
-- CREATE INDEXES ...
ALTER TABLE "pessoa"."funcionario_empresa" ADD CONSTRAINT "relfuncempresa_pkey" PRIMARY KEY ("id");
CREATE INDEX "relfuncempresa_funcionario_idx" ON "pessoa"."funcionario_empresa" ("funcionario_id");
CREATE INDEX "relfuncempresa_empresa_idx" ON "pessoa"."funcionario_empresa" ("empresa_id");
CREATE UNIQUE INDEX "relfuncempresa_composta_idx" ON "pessoa"."funcionario_empresa" ("funcionario_id", "empresa_id");
-- CREATE Relationships ...
ALTER TABLE "pessoa"."funcionario_empresa" ADD CONSTRAINT "relfuncempresa_funcionario_fk" FOREIGN KEY ("funcionario_id") REFERENCES "pessoa"."funcionario"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "pessoa"."funcionario_empresa" ADD CONSTRAINT "relfuncempresa_empresa_fk" FOREIGN KEY ("empresa_id") REFERENCES "pessoa"."empresa"("id") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/relfuncempresa.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "servicos"."servico"
 (
	"id"			bigserial,
	"Gen_srvcompleta"			INTEGER,
	"empresa"			INTEGER,
	"id"			VARCHAR (40),
	"linha"			VARCHAR (60),
	"resumida"			VARCHAR (200),
	"completa"			TEXT,
	"ativo"			BOOL NOT NULL,
	"preco01"			DOUBLE PRECISION,
	"preco02"			DOUBLE PRECISION,
	"preco03"			DOUBLE PRECISION,
	"preco04"			DOUBLE PRECISION,
	"vigencia"			DATE,
	"iss"			DOUBLE PRECISION,
	"custo01"			DOUBLE PRECISION,
	"custo02"			DOUBLE PRECISION,
	"impincluso"			BOOL NOT NULL,
	"lucro"			DOUBLE PRECISION,
	"unidade"			VARCHAR (20),
	"operador"			VARCHAR (30),
	"Moeda"			VARCHAR (20),
	"datamod"			TIMESTAMP WITHOUT TIME ZONE,
	"cfiscal"			VARCHAR (40),
	"ctributacao"			VARCHAR (6),
	"listserv"			VARCHAR (8),
	"sittrib"			INTEGER
);

COMMENT ON COLUMN "servicos"."servico"."vempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "servicos"."servico"."vid" IS 'Código de Identificação do serviço.';

COMMENT ON COLUMN "servicos"."servico"."vlinha" IS 'Código de identificação da linha';

COMMENT ON COLUMN "servicos"."servico"."vresumida" IS 'Descrição resumida do serviço.';

COMMENT ON COLUMN "servicos"."servico"."vcompleta" IS 'Descrição detalhada do serviço.';

COMMENT ON COLUMN "servicos"."servico"."vativo" IS 'Determina se o serviço é ativo ou não.';

COMMENT ON COLUMN "servicos"."servico"."vpreco01" IS 'Preço do Serviço relativo à Tabela de Preços 01.';

COMMENT ON COLUMN "servicos"."servico"."vpreco02" IS 'Preço do Serviço relativo à Tabela de Preços 02.';

COMMENT ON COLUMN "servicos"."servico"."vpreco03" IS 'Preço do Serviço relativo à Tabela de Preços 03.';

COMMENT ON COLUMN "servicos"."servico"."vpreco04" IS 'Preço do Serviço sugerido em função do custo, impostos e lucro.';

COMMENT ON COLUMN "servicos"."servico"."vvigencia" IS 'Data de limite de vigência para as Tabelas de Preços.';

COMMENT ON COLUMN "servicos"."servico"."viss" IS 'Percentual de ISS.';

COMMENT ON COLUMN "servicos"."servico"."vcusto01" IS 'Custo da Mão de Obra.';

COMMENT ON COLUMN "servicos"."servico"."vcusto02" IS 'Custo da Mão de Obra.';

COMMENT ON COLUMN "servicos"."servico"."vimpincluso" IS 'Determina se o ISS está incluso ou não no preço do serviço.';

COMMENT ON COLUMN "servicos"."servico"."vlucro" IS 'Determina a margem de lucro desejada para o serviço.';

COMMENT ON COLUMN "servicos"."servico"."vunidade" IS 'Código do tipo de unidade.';

COMMENT ON COLUMN "servicos"."servico"."operador" IS 'Operador';

COMMENT ON COLUMN "servicos"."servico"."Moeda" IS 'Moeda da Tabela de Preços';

COMMENT ON COLUMN "servicos"."servico"."datamod" IS 'Data da última modificação';

-- CREATE INDEXES ...
CREATE INDEX "servicos_Descrição Resumida_idx" ON "servicos"."servico" ("resumida");

CREATE INDEX "servicos_codigo_idx" ON "servicos"."servico" ("empresa");

ALTER TABLE "servicos"."servico" ADD CONSTRAINT "servicos_pkey" PRIMARY KEY ("id");

CREATE UNIQUE INDEX "servicos_prodid_idx" ON "servicos"."servico" ("id");

CREATE UNIQUE INDEX "servicos_prodlinha_idx" ON "servicos"."servico" ("linha");

CREATE INDEX "servicos_ID_idx" ON "servicos"."servico" ("id");

-- CREATE Relationships ...
ALTER TABLE "servicos"."servico" ADD CONSTRAINT "servicos_srvempresa_fk" FOREIGN KEY ("empresa") REFERENCES "pessoa"."empresa"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "servicos"."servico" ADD CONSTRAINT "servicos_srvlinha_fk" FOREIGN KEY ("linha") REFERENCES "deposito"."produtoslinha"("codigo") ON UPDATE CASCADE;

ALTER TABLE "servicos"."servico" ADD CONSTRAINT "servicos_srvunidade_fk" FOREIGN KEY ("unidade") REFERENCES "servicos"."undmedida"("id") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/servicos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."tempnfentradapagto"
 (
	"id"			bigserial,
	"nfpid"			INTEGER,
	"nfpempresa"		INTEGER,
	"nfpparcela"		INTEGER,
	"nfpvencimento"		DATE,
	"nfpvalor"		DOUBLE PRECISION,
	"nfpmoeda"		VARCHAR (20)
);

COMMENT ON COLUMN "contabil"."tempnfentradapagto"."nfpid" IS 'Controle interno';

COMMENT ON COLUMN "contabil"."tempnfentradapagto"."nfpempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "contabil"."tempnfentradapagto"."nfpparcela" IS 'Número de identificação da parcela da receita ou despesa.';

COMMENT ON COLUMN "contabil"."tempnfentradapagto"."nfpvencimento" IS 'Data de vencimento da receita ou despesa.';

COMMENT ON COLUMN "contabil"."tempnfentradapagto"."nfpvalor" IS 'Valor correspondente a parcela de receita ou despesa.';

COMMENT ON COLUMN "contabil"."tempnfentradapagto"."nfpmoeda" IS 'Moeda';

-- CREATE INDEXES ...
CREATE INDEX "tempnfentradapagto_ctrpvencimento_idx" ON "contabil"."tempnfentradapagto" ("nfpvencimento");

CREATE INDEX "tempnfentradapagto_nfpempresa_idx" ON "contabil"."tempnfentradapagto" ("nfpempresa");

CREATE INDEX "tempnfentradapagto_nfpid_idx" ON "contabil"."tempnfentradapagto" ("nfpid");

CREATE INDEX "tempnfentradapagto_nfpparcela_idx" ON "contabil"."tempnfentradapagto" ("nfpparcela");

ALTER TABLE "contabil"."tempnfentradapagto" ADD CONSTRAINT "tempnfentradapagto_pkey" PRIMARY KEY ("nfpid", "nfpempresa", "nfpparcela");

CREATE UNIQUE INDEX "tempnfentradapagto_ID_idx" ON "contabil"."tempnfentradapagto" ("id");

-- CREATE Relationships ...
ALTER TABLE "contabil"."tempnfentradapagto" ADD CONSTRAINT "tempnfentradapagto_nfpid_fk" FOREIGN KEY ("nfpid") REFERENCES "contabil"."tempnfentrada"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/tempnfentradapagto.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."tempnfentradaparciais"
 (
	"id"			bigserial,
	"nfcpid"			INTEGER NOT NULL,
	"nfcpped"			INTEGER NOT NULL,
	"nfcpprod"			VARCHAR (40) NOT NULL,
	"nfcpemp"			INTEGER,
	"nfcpqtd"			DOUBLE PRECISION
);

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tempnfentradaparciais_nfcpid_idx" ON "contabil"."tempnfentradaparciais" ("nfcpid");

-- CREATE Relationships ...
ALTER TABLE "contabil"."tempnfentradaparciais" ADD CONSTRAINT "tempnfentradaparciais_nfcpid_fk" FOREIGN KEY ("nfcpid") REFERENCES "contabil"."tempnfentrada"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/tempnfentradaparciais.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."tempnfentradaprod"
 (
	"id"			bigserial,
	"nfcpdnota"		INTEGER,
	"nfcpdcodigo"		VARCHAR (40),
	"nfcpdempresa"		INTEGER,
	"nfcpdqtd"		DOUBLE PRECISION,
	"nfcpdvalorunit"	DOUBLE PRECISION,
	"nfcpdicms"		DOUBLE PRECISION,
	"nfcpdipi"		DOUBLE PRECISION,
	"nfcpdvaloripi"		DOUBLE PRECISION,
	"nfcpdvalorcusto"	DOUBLE PRECISION,
	"nfcpdqtddevol"		DOUBLE PRECISION,
	"nfcpdqtdadevol"	DOUBLE PRECISION,
	"nfcpdvaloricms"	DOUBLE PRECISION,
	"nfcpddesconto"		REAL,
	"nfcpdrateio"		DOUBLE PRECISION,
	"nfcpdfrete"		DOUBLE PRECISION,
	"nfcpdseguro"		DOUBLE PRECISION,
	"nfcpddiversos"		DOUBLE PRECISION
);

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdnota" IS 'Controle interno da Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdcodigo" IS 'Código de Identificação do produto.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdqtd" IS 'Quantidade comprada do produto.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdvalorunit" IS 'Valor unitário do produto.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdicms" IS 'Alíquota de ICMS.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdipi" IS 'Alíquota de IPI.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdvaloripi" IS 'Valor do IPI na Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdvalorcusto" IS 'Valor do custo do produto';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdqtddevol" IS 'Quantidade devolvida do produto.';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdqtdadevol" IS 'Quantidade a devolver do produto';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdvaloricms" IS 'Valor do ICMS na Nota Fiscal';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpddesconto" IS 'Desconto';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdrateio" IS 'rateio valores adicionais na devolução';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdfrete" IS 'rateio valores do frete na devolução';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpdseguro" IS 'rateio valores do frete na devolução';

COMMENT ON COLUMN "contabil"."tempnfentradaprod"."nfcpddiversos" IS 'rateio valores do frete na devolução';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tempnfentradaprod_nfcempresa_idx" ON "contabil"."tempnfentradaprod" ("nfcpdempresa");

CREATE UNIQUE INDEX "tempnfentradaprod_nfcpdnota_idx" ON "contabil"."tempnfentradaprod" ("nfcpdnota");

ALTER TABLE "contabil"."tempnfentradaprod" ADD CONSTRAINT "tempnfentradaprod_pkey" PRIMARY KEY ("nfcpdnota", "nfcpdcodigo");

CREATE INDEX "tempnfentradaprod_prodid_idx" ON "contabil"."tempnfentradaprod" ("nfcpdcodigo");

CREATE INDEX "tempnfentradaprod_ID_idx" ON "contabil"."tempnfentradaprod" ("id");

-- CREATE Relationships ...
ALTER TABLE "contabil"."tempnfentradaprod" ADD CONSTRAINT "tempnfentradaprod_nfcpdnota_fk" FOREIGN KEY ("nfcpdnota") REFERENCES "contabil"."tempnfentrada"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/tempnfentradaprod.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."tempnfentrada"
 (
	"id"			bigserial,
	"Gen_nfcmotivo"			INTEGER,
	"codigo"			INTEGER,
	"nfcempresa"			INTEGER,
	"nfcfuncionario"			VARCHAR (30),
	"nfcnumero"			DOUBLE PRECISION,
	"nfcfornecedor"			VARCHAR (32),
	"nfcdataemissao"			DATE,
	"nfcdatarecebimento"			DATE,
	"nfcbaseicms"			DOUBLE PRECISION,
	"nfcvaloricms"			DOUBLE PRECISION,
	"nfcvaloripi"			DOUBLE PRECISION,
	"nfcvaloriss"			DOUBLE PRECISION,
	"nfcvalorfrete"			DOUBLE PRECISION,
	"nfcvalorseguro"			DOUBLE PRECISION,
	"nfcvalordiversos"			DOUBLE PRECISION,
	"nfctotalprodutos"			DOUBLE PRECISION,
	"nfctotalservicos"			DOUBLE PRECISION,
	"nfctotalnota"			DOUBLE PRECISION,
	"nfcflagpedcompra"			BOOL NOT NULL,
	"nfcnumpedcompra"			INTEGER,
	"nfccancel"			BOOL NOT NULL,
	"nfcmotivo"			TEXT,
	"nfctipo"			INTEGER,
	"nfccodigo"			VARCHAR (40),
	"nfctipodespesa"			VARCHAR (60),
	"nfcoperador"			VARCHAR (30),
	"nfccondpagto"			VARCHAR (40),
	"nfcmoeda"			VARCHAR (20),
	"nfccomputador"			VARCHAR (60),
	"nfcop"			INTEGER,
	"nfcimp"			BOOL NOT NULL,
	"nfcdesconto"			REAL,
	"nfctipoicms"			VARCHAR (16),
	"nfcfobcif"			BOOL NOT NULL,
	"nfctransportadora"			INTEGER,
	"nfccontato"			VARCHAR (160)
);

COMMENT ON COLUMN "contabil"."tempnfentrada"."codigo" IS 'Controle interno de Nota Fiscal de Entrada.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcfuncionario" IS 'Código de identificação do funcionário.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcnumero" IS 'Número de Identificação da Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcfornecedor" IS 'Número de CGC ou CPF.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcdataemissao" IS 'Data de emissão da Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcdatarecebimento" IS 'Data de recebimento da Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcbaseicms" IS 'Valor correspondente a base de cálculo de ICMS.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcvaloricms" IS 'Valor do ICMS da Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcvaloripi" IS 'Valor total do IPI.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcvaloriss" IS 'Valor total de ISS.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcvalorfrete" IS 'Valor do frete cobrado na Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcvalorseguro" IS 'Valor do seguro cobrado na Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcvalordiversos" IS 'Valor de outras despesas cobradas na Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfctotalprodutos" IS 'Valor total de produtos na Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfctotalservicos" IS 'Valor total de serviços na Nota Fiscal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfctotalnota" IS 'Valor total da Nota Fiascal.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcflagpedcompra" IS 'Flag de controle de emissão de pedido de compra.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcnumpedcompra" IS 'Número de controle interno do pedido de compra.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfccancel" IS 'Flag de cancelamento de Nota Fiscal de entrada.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcmotivo" IS 'Observações sobre os motivos do cancelamento.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfctipo" IS 'Determina se a Nota Fiscal é de Produtos, Serviços ou Ambos.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfccodigo" IS 'Tipo de Status de Estoque.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfctipodespesa" IS 'Descrição do tipo de Receita ou Despesa.';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcoperador" IS 'Operador';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfccondpagto" IS 'Condição de Pagamento';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcmoeda" IS 'Moeda';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfccomputador" IS 'Computador de origem do registro';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcop" IS 'Código da Natureza da Operação';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcimp" IS 'Identifica se é importação ou não';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcdesconto" IS 'Desconto';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfctipoicms" IS 'Tipo de cálculo do ICMS na Nota Fiscal';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfcfobcif" IS 'FOB/CIF (0=FOB;-1=CIF)';

COMMENT ON COLUMN "contabil"."tempnfentrada"."nfctransportadora" IS 'Transportadora';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tempnfentrada_empresa_idx" ON "contabil"."tempnfentrada" ("nfcempresa");

CREATE UNIQUE INDEX "tempnfentrada_fornecedor_idx" ON "contabil"."tempnfentrada" ("nfcfornecedor");
CREATE INDEX "tempnfentrada_nfcdataemissao_idx" ON "contabil"."tempnfentrada" ("nfcdataemissao");

CREATE INDEX "tempnfentrada_nfcdatarecebimento_idx" ON "contabil"."tempnfentrada" ("nfcdatarecebimento");

CREATE INDEX "tempnfentrada_nfcfuncionario_idx" ON "contabil"."tempnfentrada" ("nfcfuncionario");

CREATE UNIQUE INDEX "tempnfentrada_codigo_idx" ON "contabil"."tempnfentrada" ("codigo");
CREATE UNIQUE INDEX "tempnfentrada_nfcnumero_idx" ON "contabil"."tempnfentrada" ("nfcnumero");

CREATE INDEX "tempnfentrada_nfctipodespesa_idx" ON "contabil"."tempnfentrada" ("nfctipodespesa");

ALTER TABLE "contabil"."tempnfentrada" ADD CONSTRAINT "tempnfentrada_pkey" PRIMARY KEY ("id");

CREATE INDEX "tempnfentrada_ID_idx" ON "contabil"."tempnfentrada" ("id");

-- CREATE Relationships ...
ALTER TABLE "contabil"."tempnfentrada" ADD CONSTRAINT "tempnfentrada_nfccondpagto_fk" FOREIGN KEY ("nfccondpagto") REFERENCES "telemarketing"."condpagto"("codigo") ON UPDATE CASCADE;

ALTER TABLE "contabil"."tempnfentrada" ADD CONSTRAINT "tempnfentrada_nfcmoeda_fk" FOREIGN KEY ("nfcmoeda") REFERENCES "compras"."moeda"("codigo") ON UPDATE CASCADE;

ALTER TABLE "contabil"."tempnfentrada" ADD CONSTRAINT "tempnfentrada_nfctransportadora_fk" FOREIGN KEY ("nfctransportadora") REFERENCES "servicos"."transportadora"("codigo") ON UPDATE CASCADE;
--sql script successful >>> /tmp/qbdados/2/tempnfentrada.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."tipo_centro_custo"
 (
	"codigo"			SERIAL,
	empresa"			INTEGER,
	centro"			VARCHAR (60),
	tipo"			VARCHAR (100),
	filiacao"			VARCHAR (60),
	"padrao"			BOOL NOT NULL,
	titulo"			TEXT,
	lancamento"			BOOL NOT NULL,
	"Gen_TempField*0"			INTEGER,
	"id"			bigserial
);

COMMENT ON COLUMN "contabil"."tipo_centro_custo"."empresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "contabil"."tipo_centro_custo"."centro" IS 'Código de Identificação do Centro de Custos.';

COMMENT ON COLUMN "contabil"."tipo_centro_custo"."tipo" IS 'Descrição do centro de custos.';

COMMENT ON COLUMN "contabil"."tipo_centro_custo"."filiacao" IS 'Filiação do centro';

COMMENT ON COLUMN "contabil"."tipo_centro_custo"."padrao" IS 'Padrão do Sistema';

-- CREATE INDEXES ...
CREATE INDEX "tipocentrocustos_codigo_idx" ON "contabil"."tipo_centro_custo" (empresa");

ALTER TABLE "contabil"."tipo_centro_custo" ADD CONSTRAINT "tipocentrocustos_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "tipocentrocustos_rdtipo_idx" ON "contabil"."tipo_centro_custo" (tipo");

CREATE UNIQUE INDEX "tipocentrocustos_ID_idx" ON "contabil"."tipo_centro_custo" ("id");

-- CREATE Relationships ...
ALTER TABLE "contabil"."tipo_centro_custo" ADD CONSTRAINT "tipocentrocustos_ccempresa_fk" FOREIGN KEY (empresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/tipocentrocustos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "contabil"."tipo_participacao"
 (
	"id"			bigserial,
	"conta_contabil_id"			SERIAL,
	"centro_custo_id"			INTEGER NOT NULL,
	"codigo"			INTEGER NOT NULL,
	percentual"			DOUBLE PRECISION NOT NULL
);
COMMENT ON COLUMN "contabil"."tipo_participacao"."conta_contabil_id" IS 'identificador da conta contabil';
COMMENT ON COLUMN "contabil"."tipo_participacao"."centro_custo_id" IS 'identificador do centro de custos';
COMMENT ON COLUMN "contabil"."tipo_participacao".percentual" IS 'percentual de participação';
-- CREATE INDEXES ...
ALTER TABLE "contabil"."tipo_participacao" ADD CONSTRAINT "tipoparticipacao_pkey" PRIMARY KEY ("id");
CREATE INDEX "tipoparticipacao_conta_contabil_idx" ON "contabil"."tipo_participacao" ("conta_contabil_id");
CREATE INDEX "tipoparticipacao_centro_custo_idx" ON "contabil"."tipo_participacao" ("centro_custo_id");
CREATE INDEX "tipoparticipacao_codigo_idx" ON "contabil"."tipo_participacao" ("codigo");
CREATE INDEX "tipoparticipacao_ID_idx" ON "contabil"."tipo_participacao" ("id");
-- CREATE Relationships ...
ALTER TABLE "contabil"."tipo_participacao" ADD CONSTRAINT "tipoparticipacao_tipocentrocustos_fk" FOREIGN KEY ("codigo") REFERENCES "contabil"."tipo_centro_custo"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "contabil"."tipo_participacao" ADD CONSTRAINT "tipoparticipacao_tiporecdesp_fk" FOREIGN KEY ("codigo") REFERENCES "telemarketing"."tiporecdesp"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/tipoparticipacao.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."tiporecdesp"
 (
	"Gen_TempField*0"			INTEGER,
	"codigo"			SERIAL,
	"rdempresa"			INTEGER NOT NULL,
	"rdtipo"			VARCHAR (120) NOT NULL,
	"rdgrupo"			INTEGER,
	"id"			bigserial,
	"rdconta"			VARCHAR (510),
	"rdfiliacao"			VARCHAR (510),
	"rddemonstrativo"			BOOL NOT NULL,
	"padrao"			BOOL NOT NULL,
	"rdespecie"			REAL NOT NULL,
	"rdlancamento"			BOOL NOT NULL,
	"rdtitulo"			TEXT,
	"rdsaldoinicial"			DOUBLE PRECISION,
	"rdinicializa"			BOOL NOT NULL,
	"rddatainicial"			DATE,
	"rddctacorrentecaixa"			VARCHAR (30),
	"rddlimite"			INTEGER,
	"rddtipoctacorrente"			VARCHAR (30),
	"ctcbanco"			INTEGER,
	"ctcagencia"			VARCHAR (20),
	"rdsaldoatual"			DOUBLE PRECISION,
	"rdfilhos"			BOOL NOT NULL,
	"rdautomatico"			VARCHAR (100),
	"rddebcred"			BOOL NOT NULL
);

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."codigo" IS 'Identificador Interno da conta';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdtipo" IS 'Descrição do tipo de Receita ou Despesa.';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdgrupo" IS 'Identificação para Grupo de Receita e Despesa.';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdconta" IS 'Código de Identificação da Conta';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdfiliacao" IS 'Filiação da Conta';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rddemonstrativo" IS 'Indica se os valores com esta classificação serão inclusos na apuração de resultados.';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."padrao" IS 'Padrão do Sistema';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdespecie" IS 'Especie da conta 1=Caixa 2=Banco 3=Outras';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdlancamento" IS 'Lançamento';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdtitulo" IS 'Descrição indentada da conta';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdsaldoinicial" IS 'Saldo inicial da conta';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdinicializa" IS 'Determina se a conta foi inicializada';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rddatainicial" IS 'Determina a data da inicialização';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rddctacorrentecaixa" IS 'Número da Conta Corrente/Caixa no banco/empresa';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rddlimite" IS 'Limite de Crédito da Conta Corrente';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rddtipoctacorrente" IS 'Tipo da Conta corrente/caixa';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."ctcbanco" IS 'Código do banco.';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."ctcagencia" IS 'Código da agência.';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdsaldoatual" IS 'Saldo atual da conta';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdfilhos" IS 'A conta pode ter filhos';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rdautomatico" IS 'Identificador Utilizado para lançamentos automáticos';

COMMENT ON COLUMN "telemarketing"."tiporecdesp"."rddebcred" IS 'Identifica se a conta de debedora ou credora';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "tiporecdesp_ctcagencia_idx" ON "telemarketing"."tiporecdesp" ("ctcagencia");

CREATE INDEX "tiporecdesp_ctcbanco_idx" ON "telemarketing"."tiporecdesp" ("ctcbanco");

CREATE UNIQUE INDEX "tiporecdesp_codigo_idx" ON "telemarketing"."tiporecdesp" ("rdempresa");

ALTER TABLE "telemarketing"."tiporecdesp" ADD CONSTRAINT "tiporecdesp_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "tiporecdesp_rdconta_idx" ON "telemarketing"."tiporecdesp" ("rdconta");

CREATE INDEX "tiporecdesp_rdfiliacao_idx" ON "telemarketing"."tiporecdesp" ("rdfiliacao");

CREATE INDEX "tiporecdesp_rdgrupo_idx" ON "telemarketing"."tiporecdesp" ("rdgrupo");

CREATE INDEX "tiporecdesp_rdtipo_idx" ON "telemarketing"."tiporecdesp" ("rdtipo");

CREATE INDEX "tiporecdesp_ID_idx" ON "telemarketing"."tiporecdesp" ("id");

-- CREATE Relationships ...
ALTER TABLE "telemarketing"."tiporecdesp" ADD CONSTRAINT "tiporecdesp_rdempresa_fk" FOREIGN KEY ("rdempresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/tiporecdesp.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "servicos"."transportadora"
 (
	"Gen_trpobs"			INTEGER,
	"codigo"			SERIAL,
	"id"			bigserial,
	"trprsocial"			VARCHAR (160),
	"trpendereco"			VARCHAR (160),
	"trpnumero"			VARCHAR (8),
	"trpcomplemento"			VARCHAR (60),
	"trpbairro"			VARCHAR (100),
	"trpcidade"			VARCHAR (100),
	"trpuf"			VARCHAR (4),
	"trpcep"			VARCHAR (20),
	"trpddd"			VARCHAR (12),
	"trpfone01"			VARCHAR (22),
	"trpfone02"			VARCHAR (22),
	"trpfax"			VARCHAR (22),
	"trpemail"			VARCHAR (100),
	"trpobs"			TEXT,
	"trpcgc"			VARCHAR (32),
	"trpinscrestadual"			VARCHAR (54),
	"trpoperador"			VARCHAR (30),
	"padrao"			BOOL NOT NULL,
	"trpsite"			VARCHAR (100),
	"trpdatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"trppais"			VARCHAR (6)
);

COMMENT ON COLUMN "servicos"."transportadora"."codigo" IS 'Controle interno para transportadoa';

COMMENT ON COLUMN "servicos"."transportadora"."trprsocial" IS 'Razão Social.';

COMMENT ON COLUMN "servicos"."transportadora"."trpendereco" IS 'Endereço.';

COMMENT ON COLUMN "servicos"."transportadora"."trpbairro" IS 'Bairro.';

COMMENT ON COLUMN "servicos"."transportadora"."trpcidade" IS 'Cidade.';

COMMENT ON COLUMN "servicos"."transportadora"."trpuf" IS 'Sigla do Estado.';

COMMENT ON COLUMN "servicos"."transportadora"."trpcep" IS 'Código de endereçamento postal.';

COMMENT ON COLUMN "servicos"."transportadora"."trpddd" IS 'Código de DDD.';

COMMENT ON COLUMN "servicos"."transportadora"."trpfone01" IS 'Número do telefone.';

COMMENT ON COLUMN "servicos"."transportadora"."trpfone02" IS 'Número de telefone.';

COMMENT ON COLUMN "servicos"."transportadora"."trpfax" IS 'Número de fax.';

COMMENT ON COLUMN "servicos"."transportadora"."trpemail" IS 'Endereço de correio eletrônico na Internet.';

COMMENT ON COLUMN "servicos"."transportadora"."trpobs" IS 'Observações e ou cometários sobre a transportadora.';

COMMENT ON COLUMN "servicos"."transportadora"."trpcgc" IS 'CGC da transportadora';

COMMENT ON COLUMN "servicos"."transportadora"."trpinscrestadual" IS 'Inscrição Estadual da Transportadora';

COMMENT ON COLUMN "servicos"."transportadora"."trpoperador" IS 'Operador';

COMMENT ON COLUMN "servicos"."transportadora"."padrao" IS 'Padrão do Sistema';

COMMENT ON COLUMN "servicos"."transportadora"."trpsite" IS 'Endereço eletrônico na Internet';

COMMENT ON COLUMN "servicos"."transportadora"."trpdatamod" IS 'Data modificação';

-- CREATE INDEXES ...
CREATE INDEX "transportadora_forendereco_idx" ON "servicos"."transportadora" ("trpendereco");

ALTER TABLE "servicos"."transportadora" ADD CONSTRAINT "transportadora_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "transportadora_Razão Social_idx" ON "servicos"."transportadora" ("trprsocial");

CREATE UNIQUE INDEX "transportadora_ID_idx" ON "servicos"."transportadora" ("id");

CREATE UNIQUE INDEX "transportadora_codigo_idx" ON "servicos"."transportadora" ("codigo");

-- CREATE Relationships ...
ALTER TABLE "servicos"."transportadora" ADD CONSTRAINT "transportadora_trpuf_fk" FOREIGN KEY ("trpuf") REFERENCES "contabil"."aliquota"("codigo") ON UPDATE CASCADE;

ALTER TABLE "servicos"."transportadora" ADD CONSTRAINT "transportadora_trpoperador_fk" FOREIGN KEY ("trpoperador") REFERENCES "pessoa"."funcionario"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/transportadora.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."usuario"
 (
	"codigo"			VARCHAR (30),
	"useracesso"			VARCHAR (20),
	"useracessochk"			VARCHAR (18),
	"id"			bigserial
);

COMMENT ON COLUMN "pessoa"."usuario"."codigo" IS 'Código de identificação do funcionário.';

COMMENT ON COLUMN "pessoa"."usuario"."useracesso" IS 'Senha de identificação e acesso ao sistema.';

COMMENT ON COLUMN "pessoa"."usuario"."useracessochk" IS 'Confirmação da senha de identificação e acesso.';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "user_codigo_idx" ON "pessoa"."usuario" ("codigo");

ALTER TABLE "pessoa"."usuario" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("codigo");

CREATE UNIQUE INDEX "user_ID_idx" ON "pessoa"."usuario" ("id");

-- CREATE Relationships ...
ALTER TABLE "pessoa"."usuario" ADD CONSTRAINT "user_codigo_fk" FOREIGN KEY ("codigo") REFERENCES "pessoa"."funcionario"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

--sql script successful >>> /tmp/qbdados/2/user.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."venda_faturada_produto"
 (
	"id"			bigserial,
	"ftpnumero"			INTEGER,
	"ftpdatacontrol"		TIMESTAMP WITHOUT TIME ZONE,
	"ftpproduto"			bigint,
	"ftpempresa"			INTEGER,
	"ftppreco"			DOUBLE PRECISION,
	"ftpqtd"			DOUBLE PRECISION,
	"ftpfator"			DOUBLE PRECISION,
	"ftpcomissao"			DOUBLE PRECISION,
	"ftpicms"			DOUBLE PRECISION,
	"ftpvaloricms"			DOUBLE PRECISION,
	"ftpipi"			DOUBLE PRECISION,
	"ftpvaloripi"			DOUBLE PRECISION,
	"ftpdesconto"			DOUBLE PRECISION,
	"ftpcusto"			DOUBLE PRECISION,
	"ftpreducao"			BOOL NOT NULL,
	"ftpbase"			DOUBLE PRECISION,
	"ftpmargem"			DOUBLE PRECISION,
	"ftpsubstituicao"		BOOL NOT NULL,
	"ftpvalorsubstituicao"		DOUBLE PRECISION,
	"ftpbasesubstituicao"		DOUBLE PRECISION,
	"ftpcfop"			INTEGER
);

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpnumero" IS 'Número da Venda Faturada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpdatacontrol" IS 'Data e Hora de controle do faturamento.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpproduto" IS 'Código de identificação do produto.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftppreco" IS 'Valor unitário do produto.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpqtd" IS 'Quantidade do produto solicitada pelo cliente.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpfator" IS 'Fator de conversão de cálculo de ICMS para outros estados.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpcomissao" IS 'Percentual de comissão paga ao vendedor.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpicms" IS 'Percentual de ICMS aplicado sobre a venda.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpvaloricms" IS 'Valor do ICMS correspondente a venda faturada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpipi" IS 'Percentual de IPI aplicado sobre a venda.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpvaloripi" IS 'Valor do IPI correspondente a venda faturada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpdesconto" IS 'Percentual de desconto aplicado sobre o item.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpcusto" IS 'Custo médio do produto.';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpreducao" IS 'Produto com Redução de Base de ICMS';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpbase" IS 'Base de cálculo de ICMS';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpmargem" IS 'Margem de Contribuição';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpsubstituicao" IS 'se teve subsituicao ou não';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpvalorsubstituicao" IS 'valor da substituicao';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpbasesubstituicao" IS 'base de substituicao';

COMMENT ON COLUMN "telemarketing"."venda_faturada_produto"."ftpcfop" IS 'Natureza Opercao do Produto';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "vendasfatprod_Código_idx" ON "telemarketing"."venda_faturada_produto" ("ftpproduto");

CREATE UNIQUE INDEX "vendasfatprod_ftpdatacontrol_idx" ON "telemarketing"."venda_faturada_produto" ("ftpdatacontrol");

ALTER TABLE "telemarketing"."venda_faturada_produto" ADD CONSTRAINT "vendasfatprod_pkey" PRIMARY KEY ("ftpnumero", "ftpdatacontrol", "ftpproduto");

CREATE INDEX "vendasfatprod_ID_idx" ON "telemarketing"."venda_faturada_produto" ("id");

CREATE INDEX "vendasfatprod_venempresa_idx" ON "telemarketing"."venda_faturada_produto" ("ftpempresa");

CREATE INDEX "vendasfatprod_vennúmero_idx" ON "telemarketing"."venda_faturada_produto" ("ftpnumero");

-- CREATE Relationships ...
--ALTER TABLE "telemarketing"."venda_faturada_produto" ADD CONSTRAINT "vendasfatprod_ftpempresa_fk" FOREIGN KEY ("ftpempresa") REFERENCES "deposito"."produto"("id") ON UPDATE CASCADE;
ALTER TABLE "telemarketing"."venda_faturada_produto" ADD CONSTRAINT "vendasfatprod_produto_fk" FOREIGN KEY ("ftpproduto") REFERENCES "deposito"."produto"("id") ON UPDATE CASCADE;
--sql script successful >>> /tmp/qbdados/2/vendasfatprod.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."venda_faturada"
 (
	"fatvenda"			INTEGER,
	"fatdatacontrol"			TIMESTAMP WITHOUT TIME ZONE,
	"fatempresa"			INTEGER,
	"fatnumero"			DOUBLE PRECISION,
	"fatnumerocpl"			VARCHAR (100),
	"fatnotafiscal"			VARCHAR (100),
	"fatfuncionario"			VARCHAR (30),
	"fatcgc"			VARCHAR (32),
	"fatcontato"			VARCHAR (160),
	"fattransporte"			INTEGER,
	"fatobs"			TEXT,
	"fatfobcif"			BOOL NOT NULL,
	"fatfrete"			DOUBLE PRECISION,
	"fatpromocao"			VARCHAR (30),
	"fatcondpagto"			VARCHAR (40),
	"fatdataorca"			DATE,
	"fatcancel"			BOOL NOT NULL,
	"fatdatacancel"			DATE,
	"fatcancelmotivo"			TEXT,
	"fatfechado"			BOOL NOT NULL,
	"fatdatafechado"			DATE,
	"fatdatafaturado"			DATE,
	"fattipoicms"			VARCHAR (50),
	"fatdesconto"			DOUBLE PRECISION,
	"fatprazoentrega"			TIMESTAMP WITHOUT TIME ZONE,
	"fattabela"			VARCHAR (20),
	"fattotal"			DOUBLE PRECISION,
	"fattotalipi"			DOUBLE PRECISION,
	"fattotalicms"			DOUBLE PRECISION,
	"fattotaliss"			DOUBLE PRECISION,
	"fatmktpassivo"			BOOL NOT NULL,
	"fatfretesomado"			BOOL NOT NULL,
	"fatcontador"			SERIAL,
	"fatnotafiscalass"			BOOL NOT NULL,
	"fatnotaimpressa"			BOOL NOT NULL,
	"fatKOK"			BOOL NOT NULL,
	"fatnotacancelada"			BOOL NOT NULL,
	"fatcomissao"			REAL,
	"fatoperador"			VARCHAR (30),
	"fatpago"			BOOL NOT NULL,
	"fatnatoper"			INTEGER,
	"fatfornecedor"			VARCHAR (40),
	"fatdatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"fatconsig"			INTEGER,
	"fatdespesasacc"			DOUBLE PRECISION,
	"fatseguro"			DOUBLE PRECISION,
	"fatpedidocli"			VARCHAR (30),
	"Gen_fatcancelmotivo"			INTEGER,
	"Gen_fatobs"			INTEGER,
	"id"			bigserial,
	"fatnfe"			INTEGER,
	"fatdespesas"			DOUBLE PRECISION,
	"fattpnf"			INTEGER,
	"fatcofins"			DOUBLE PRECISION,
	"fatII"			DOUBLE PRECISION,
	"fatpis"			DOUBLE PRECISION,
	"fatsiscomex"			DOUBLE PRECISION,
	"faticmsimp"			DOUBLE PRECISION
);

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatvenda" IS 'Código de identificação interno do pedido';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdatacontrol" IS 'Data e Hora de controle do faturamento.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatnumero" IS 'Número do Pedido.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatnumerocpl" IS 'Complemento do Número do Pedido.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatnotafiscal" IS 'Número da Nota Fiscal ou documento correspondente ao faturamento.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatfuncionario" IS 'Código de identificação do vendedor.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatcgc" IS 'Número de CGC ou CPF do cliente.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatcontato" IS 'Nome do contato para negociação da venda.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fattransporte" IS 'Identificação da transportadora.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatobs" IS 'Observações gerais sobre a negociação.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatfobcif" IS 'Determina se o preço final é FOB (sim) ou CIF (não).';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatfrete" IS 'Valor do frete para transporte.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatpromocao" IS 'Código da promoção aplicada à venda.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatcondpagto" IS 'Código da condição de pagamento negociada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdataorca" IS 'Data da confecção da proposta.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatcancel" IS 'Determina o cancelamento da Venda Faturada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdatacancel" IS 'Data de cancelamento da Venda Faturada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatcancelmotivo" IS 'Justificativa para o cancelamento.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatfechado" IS 'Determina se a venda foi confirmada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdatafechado" IS 'Data em que o pedido foi gerado.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdatafaturado" IS 'Data de faturamento do pedido.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fattipoicms" IS 'Indica se a venda é para consumidor final ou revenda.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdesconto" IS 'Indica o percentual de desconto concedido.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatprazoentrega" IS 'Especifica o prazo de entrega.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fattabela" IS 'Indica a tabela de preços utilizada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fattotal" IS 'Valor total da Proposta/Pedido.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fattotalipi" IS 'Valor total de IPI.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fattotalicms" IS 'Valor total de ICMS.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fattotaliss" IS 'Valor total de ISS.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatmktpassivo" IS 'Determina se a venda foi espontânea ou não.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatfretesomado" IS 'Determina se o valor do frete foi somado ao total da venda.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatcontador" IS 'Contador interno de Pedidos Faturados';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatnotafiscalass" IS 'Indica se foi asignada uma nota fiscal a esta venda';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatnotaimpressa" IS 'Indica se a nota assignada foi impressa.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatKOK" IS 'Indica se a venda deve aparecer na lista de notas';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatnotacancelada" IS 'Indica se a nota impressa foi cancelada.';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatcomissao" IS 'Comissão Geral do Vendedor';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatoperador" IS 'Operador';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatpago" IS 'Duplicata=Sim ; Outros=Não';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatnatoper" IS 'Identificação da Natureza da Operação';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatfornecedor" IS 'Identificador do fornecedor para representações';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdatamod" IS 'última modificação';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatconsig" IS 'Identifica o número do pedido de consignação';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatdespesasacc" IS 'Valor das despesas acessórias';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatseguro" IS 'Valor do Seguro';

COMMENT ON COLUMN "telemarketing"."venda_faturada"."fatpedidocli" IS 'Identifica o Número de Pedido do Cliente';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "vendasfaturadas_codigo_idx" ON "telemarketing"."venda_faturada" ("fatempresa");

CREATE UNIQUE INDEX "vendasfaturadas_fatcondpagto_idx" ON "telemarketing"."venda_faturada" ("fatcondpagto");

CREATE UNIQUE INDEX "vendasfaturadas_fatcontador_idx" ON "telemarketing"."venda_faturada" ("fatcontador");

CREATE UNIQUE INDEX "vendasfaturadas_fatdatacontrol_idx" ON "telemarketing"."venda_faturada" ("fatdatacontrol");

CREATE UNIQUE INDEX "vendasfaturadas_fatnotafiscal_idx" ON "telemarketing"."venda_faturada" ("fatnotafiscal");

CREATE UNIQUE INDEX "vendasfaturadas_fatvenda_idx" ON "telemarketing"."venda_faturada" ("fatvenda");

ALTER TABLE "telemarketing"."venda_faturada" ADD CONSTRAINT "vendasfaturadas_pkey" PRIMARY KEY ("fatvenda", "fatdatacontrol");

CREATE UNIQUE INDEX "vendasfaturadas_ID_idx" ON "telemarketing"."venda_faturada" ("id");

CREATE UNIQUE INDEX "vendasfaturadas_vencgc_idx" ON "telemarketing"."venda_faturada" ("fatcgc");

CREATE UNIQUE INDEX "vendasfaturadas_vendataorca_idx" ON "telemarketing"."venda_faturada" ("fatdataorca");

CREATE UNIQUE INDEX "vendasfaturadas_Vendedor_idx" ON "telemarketing"."venda_faturada" ("fatfuncionario");

CREATE INDEX "vendasfaturadas_vennúmero_idx" ON "telemarketing"."venda_faturada" ("fatnumero");

-- CREATE Relationships ...
-- Relationship from "telemarketing"."venda_faturada" ("fatvenda") to "telemarketing"."venda"("codigo") does not enforce integrity.
-- Relationship from "telemarketing"."venda_faturada" ("fattransporte") to "servicos"."transportadora"("codigo") does not enforce integrity.
-- Relationship from "telemarketing"."venda_faturada" ("fatcondpagto") to "telemarketing"."condicao_pagamento"("dspgcondicao") does not enforce integrity.
--sql script successful >>> /tmp/qbdados/2/vendasfaturadas.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."venda_produto"
 (
	"id"			bigserial,
	"vnpnumero"			bigint,
	"vnpproduto"			VARCHAR (40),
	"vnpempresa"			INTEGER,
	"vnppreco"			DOUBLE PRECISION,
	"vnpqtd"			DOUBLE PRECISION,
	"vnpfator"			DOUBLE PRECISION,
	"vnpcomissao"			DOUBLE PRECISION,
	"vnpreservada"			DOUBLE PRECISION,
	"vnpfaturada"			DOUBLE PRECISION,
	"vnpicms"			DOUBLE PRECISION,
	"vnpvaloricms"			DOUBLE PRECISION,
	"vnpipi"			DOUBLE PRECISION,
	"vnpvaloripi"			DOUBLE PRECISION,
	"vnpdesconto"			DOUBLE PRECISION,
	"vnpreducao"			BOOL NOT NULL,
	"vnpbase"			DOUBLE PRECISION,
	"vnpsubstituicao"			BOOL NOT NULL,
	"vnpvalorsubstituicao"			DOUBLE PRECISION,
	"vnpbasesubstituicao"			DOUBLE PRECISION,
	"vnpcfop"			INTEGER
);

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpnumero" IS 'Número do Orçamento/Pedido.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpproduto" IS 'Código de identificação do produto.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnppreco" IS 'Valor unitário do produto.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpqtd" IS 'Quantidade do produto solicitada pelo cliente.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpfator" IS 'Fator de conversão de cálculo de ICMS para outros estados.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpcomissao" IS 'Percentual de comissão paga ao vendedor.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpreservada" IS 'Qtd auxiliar para controle de reserva de estoque.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpfaturada" IS 'Qtd auxiliar para controle de faturamento parcial.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpicms" IS 'Percentual de ICMS aplicado sobre a venda.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpvaloricms" IS 'Valor do ICMS correspondente a venda.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpipi" IS 'Percentual de IPI aplicado sobre a venda.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpvaloripi" IS 'Valor do IPI correspondente a venda.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpdesconto" IS 'Percentual de desconto aplicado sobre o item.';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpreducao" IS 'Produto com Redução de Base de ICMS';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpbase" IS 'Base de Cálculo de ICMS';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpsubstituicao" IS 'produto com substituicao de icms';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpvalorsubstituicao" IS 'Valor da substituiçao do item';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpbasesubstituicao" IS 'Base de substituicao';

COMMENT ON COLUMN "telemarketing"."venda_produto"."vnpcfop" IS 'Natureza Opercao do Produto';

-- CREATE INDEXES ...
CREATE INDEX "vendasprodutos_Código_idx" ON "telemarketing"."venda_produto" ("vnpproduto");

ALTER TABLE "telemarketing"."venda_produto" ADD CONSTRAINT "vendasprodutos_pkey" PRIMARY KEY ("vnpnumero", "vnpproduto");

CREATE UNIQUE INDEX "vendasprodutos_ID_idx" ON "telemarketing"."venda_produto" ("id");

CREATE UNIQUE INDEX "vendasprodutos_venempresa_idx" ON "telemarketing"."venda_produto" ("vnpempresa");

CREATE UNIQUE INDEX "vendasprodutos_vennúmero_idx" ON "telemarketing"."venda_produto" ("vnpnumero");

-- CREATE Relationships ...
ALTER TABLE "telemarketing"."venda_produto" ADD CONSTRAINT "vendasprodutos_vnpempresa_fk" FOREIGN KEY ("vnpempresa") REFERENCES "deposito"."produto"("prodempresa") ON UPDATE CASCADE;
ALTER TABLE "telemarketing"."venda_produto" ADD CONSTRAINT "vendasprodutos_vnpproduto_fk" FOREIGN KEY ("vnpproduto") REFERENCES "deposito"."produto"("prodid") ON UPDATE CASCADE;
ALTER TABLE "telemarketing"."venda_produto" ADD CONSTRAINT "vendasprodutos_vnpnumero_fk" FOREIGN KEY ("vnpnumero") REFERENCES "telemarketing"."venda"("id") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/vendasprodutos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."venda_servico"
 (
	"id"			bigserial,
	"vnsid"			bigint,
	"vnsservico"		VARCHAR (40),
	"vnsempresa"		INTEGER,
	"vnspreco"		DOUBLE PRECISION,
	"vnsqtd"		DOUBLE PRECISION,
	"vnscomissao"		DOUBLE PRECISION,
	"vnsiss"		DOUBLE PRECISION,
	"vnsvaloriss"		DOUBLE PRECISION,
	"vnsdesconto"		DOUBLE PRECISION,
	"vnsfaturada"		DOUBLE PRECISION,
	"vnscfop"		INTEGER
);

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsid" IS 'Contador de Orçamentos e Pedidos.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsservico" IS 'Código de identificação do serviço.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnspreco" IS 'Valor unitário do serviço.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsqtd" IS 'Quantidade do serviço solicitada pelo cliente.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnscomissao" IS 'Percentual de comissão paga ao vendedor.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsiss" IS 'Percentual de ISS aplicado sobre a venda.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsvaloriss" IS 'Valor do ISS correspondente a venda.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsdesconto" IS 'Percentual de desconto aplicado sobre o item.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnsfaturada" IS 'Quantidade do serviço faturada.';

COMMENT ON COLUMN "telemarketing"."venda_servico"."vnscfop" IS 'Natureza Opercao do Produto';

-- CREATE INDEXES ...
CREATE INDEX "vendasservicos_Código_idx" ON "telemarketing"."venda_servico" ("vnsservico");

ALTER TABLE "telemarketing"."venda_servico" ADD CONSTRAINT "vendasservicos_pkey" PRIMARY KEY ("vnsid", "vnsservico");

CREATE INDEX "vendasservicos_ID_idx" ON "telemarketing"."venda_servico" ("id");

CREATE INDEX "vendasservicos_codigo_idx" ON "telemarketing"."venda_servico" ("vnsid");

CREATE INDEX "vendasservicos_vnpempresa_idx" ON "telemarketing"."venda_servico" ("vnsempresa");

-- CREATE Relationships ...
ALTER TABLE "telemarketing"."venda_servico" ADD CONSTRAINT "vendasservicos_srvempresa_fk" FOREIGN KEY ("vnsempresa") REFERENCES "servicos"."servico"("empresa") ON UPDATE CASCADE;
ALTER TABLE "telemarketing"."venda_servico" ADD CONSTRAINT "vendasservicos_servicos_fk" FOREIGN KEY ("vnsservico") REFERENCES "servicos"."servico"("id") ON UPDATE CASCADE;
ALTER TABLE "telemarketing"."venda_servico" ADD CONSTRAINT "vendasservicos_vnsid_fk" FOREIGN KEY ("vnsid") REFERENCES "telemarketing"."venda"("id") ON UPDATE CASCADE ON DELETE CASCADE;
--sql script successful >>> /tmp/qbdados/2/vendasservicos.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "telemarketing"."venda"
 (
	"codigo"			SERIAL,
	"venempresa"			INTEGER,
	"vennumero"			DOUBLE PRECISION,
	"vennumerocpl"			VARCHAR (100),
	"venfuncionario"			VARCHAR (30),
	"vencgc"			VARCHAR (32),
	"vencontato"			VARCHAR (160),
	"ventransporte"			INTEGER,
	"venobs"			TEXT,
	"venfobcif"			BOOL NOT NULL,
	"venfrete"			DOUBLE PRECISION,
	"venfretefaturado"			DOUBLE PRECISION,
	"venpromocao"			VARCHAR (30),
	"vencondpagto"			VARCHAR (40),
	"vendataorca"			DATE,
	"vencancel"			BOOL NOT NULL,
	"vendatacancel"			DATE,
	"vencancelmotivo"			TEXT,
	"venfechado"			BOOL NOT NULL,
	"vendatafechado"			DATE,
	"venfaturado"			BOOL NOT NULL,
	"vendatafaturado"			DATE,
	"ventipoicms"			VARCHAR (50),
	"vendesconto"			DOUBLE PRECISION,
	"venprazoentrega"			TIMESTAMP WITHOUT TIME ZONE,
	"ventabela"			VARCHAR (20),
	"ventotal"			DOUBLE PRECISION,
	"ventotalipi"			DOUBLE PRECISION,
	"ventotalicms"			DOUBLE PRECISION,
	"ventotaliss"			DOUBLE PRECISION,
	"venmktpassivo"			BOOL NOT NULL,
	"venfatotal"			BOOL NOT NULL,
	"vencomissaovendedor"			REAL,
	"venoperador"			VARCHAR (30),
	"venmoeda"			VARCHAR (20),
	"venpago"			BOOL NOT NULL,
	"vennatoper"			INTEGER,
	"venagenda"			BOOL NOT NULL,
	"vendiaagendamento"			INTEGER,
	"venagendafinal"			TIMESTAMP WITHOUT TIME ZONE,
	"venfornecedor"			VARCHAR (40),
	"vendatamod"			TIMESTAMP WITHOUT TIME ZONE,
	"venconsig"			INTEGER,
	"vendespesasacc"			DOUBLE PRECISION,
	"venseguro"			DOUBLE PRECISION,
	"venpedidocli"			VARCHAR (30),
	"Gen_vencancelmotivo"			INTEGER,
	"Gen_venobs"			INTEGER,
	"id"			bigserial,
	"vendespesas"			DOUBLE PRECISION,
	"ventpnf"			INTEGER,
	"vencofins"			DOUBLE PRECISION,
	"venII"			DOUBLE PRECISION,
	"venpis"			DOUBLE PRECISION,
	"vensiscomex"			DOUBLE PRECISION,
	"venicmsimp"			DOUBLE PRECISION
);

COMMENT ON COLUMN "telemarketing"."venda"."codigo" IS 'Contador de Propostas e Pedidos.';

COMMENT ON COLUMN "telemarketing"."venda"."venempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "telemarketing"."venda"."vennumero" IS 'Número do Proposta/Pedido.';

COMMENT ON COLUMN "telemarketing"."venda"."vennumerocpl" IS 'Complemento do Número da Proposta/Pedido.';

COMMENT ON COLUMN "telemarketing"."venda"."venfuncionario" IS 'Código de identificação do vendedor.';

COMMENT ON COLUMN "telemarketing"."venda"."vencgc" IS 'Número de CGC ou CPF do cliente.';

COMMENT ON COLUMN "telemarketing"."venda"."vencontato" IS 'Nome do contato para negociação da venda.';

COMMENT ON COLUMN "telemarketing"."venda"."ventransporte" IS 'Identificação da transportadora.';

COMMENT ON COLUMN "telemarketing"."venda"."venobs" IS 'Observações gerais sobre a negociação.';

COMMENT ON COLUMN "telemarketing"."venda"."venfobcif" IS 'Determina se o preço final é FOB (sim) ou CIF (não).';

COMMENT ON COLUMN "telemarketing"."venda"."venfrete" IS 'Valor do frete para transporte.';

COMMENT ON COLUMN "telemarketing"."venda"."venfretefaturado" IS 'Valor do frete faturado para transporte.';

COMMENT ON COLUMN "telemarketing"."venda"."venpromocao" IS 'Código da promoção aplicada à venda.';

COMMENT ON COLUMN "telemarketing"."venda"."vencondpagto" IS 'Código da condição de pagamento negociada.';

COMMENT ON COLUMN "telemarketing"."venda"."vendataorca" IS 'Data da confecção da proposta.';

COMMENT ON COLUMN "telemarketing"."venda"."vencancel" IS 'Determina o cancelamento da Proposta/Pedido.';

COMMENT ON COLUMN "telemarketing"."venda"."vendatacancel" IS 'Data de cancelamento do pedido.';

COMMENT ON COLUMN "telemarketing"."venda"."vencancelmotivo" IS 'Justificativa para o cancelamento.';

COMMENT ON COLUMN "telemarketing"."venda"."venfechado" IS 'Determina se a venda foi confirmada.';

COMMENT ON COLUMN "telemarketing"."venda"."vendatafechado" IS 'Data em que o pedido foi gerado.';

COMMENT ON COLUMN "telemarketing"."venda"."venfaturado" IS 'Determina se o pedido foi faturado.';

COMMENT ON COLUMN "telemarketing"."venda"."vendatafaturado" IS 'Data de faturamento do pedido.';

COMMENT ON COLUMN "telemarketing"."venda"."ventipoicms" IS 'Indica se a venda é para consumidor final ou revenda.';

COMMENT ON COLUMN "telemarketing"."venda"."vendesconto" IS 'Indica o percentual de desconto concedido.';

COMMENT ON COLUMN "telemarketing"."venda"."venprazoentrega" IS 'Especifica o prazo de entrega.';

COMMENT ON COLUMN "telemarketing"."venda"."ventabela" IS 'Indica a tabela de preços utilizada.';

COMMENT ON COLUMN "telemarketing"."venda"."ventotal" IS 'Valor total da Proposta/Pedido.';

COMMENT ON COLUMN "telemarketing"."venda"."ventotalipi" IS 'Valor total de IPI.';

COMMENT ON COLUMN "telemarketing"."venda"."ventotalicms" IS 'Valor total de ICMS.';

COMMENT ON COLUMN "telemarketing"."venda"."ventotaliss" IS 'Valor total de ISS.';

COMMENT ON COLUMN "telemarketing"."venda"."venmktpassivo" IS 'Determina se a venda foi espontânea ou não.';

COMMENT ON COLUMN "telemarketing"."venda"."venfatotal" IS 'Determina se o pedido foi faturado integralmente.';

COMMENT ON COLUMN "telemarketing"."venda"."vencomissaovendedor" IS 'Comisao geral do Vendedor';

COMMENT ON COLUMN "telemarketing"."venda"."venoperador" IS 'Operador';

COMMENT ON COLUMN "telemarketing"."venda"."venmoeda" IS 'Moeda';

COMMENT ON COLUMN "telemarketing"."venda"."venpago" IS 'Duplicata=Sim ; Outros=Não';

COMMENT ON COLUMN "telemarketing"."venda"."vennatoper" IS 'Identificação da Natureza da Operação';

COMMENT ON COLUMN "telemarketing"."venda"."venagenda" IS 'Imagem de agendamento';

COMMENT ON COLUMN "telemarketing"."venda"."vendiaagendamento" IS 'Dia do mes para geração';

COMMENT ON COLUMN "telemarketing"."venda"."venagendafinal" IS 'Data final do agendamento';

COMMENT ON COLUMN "telemarketing"."venda"."venfornecedor" IS 'Identificador do fornecedor para representações';

COMMENT ON COLUMN "telemarketing"."venda"."vendatamod" IS 'última modificação';

COMMENT ON COLUMN "telemarketing"."venda"."venconsig" IS 'Identifica o número do pedido de consignação';

COMMENT ON COLUMN "telemarketing"."venda"."vendespesasacc" IS 'Valor das despesas acessórias na venda';

COMMENT ON COLUMN "telemarketing"."venda"."venseguro" IS 'Valor do Seguro na venda';

COMMENT ON COLUMN "telemarketing"."venda"."venpedidocli" IS 'Identifica o Número do Pedido do Cliente';

-- CREATE INDEXES ...
CREATE INDEX "vendas_Data do Orçamento_idx" ON "telemarketing"."venda" ("vendataorca");

CREATE INDEX "vendas_codigo_idx" ON "telemarketing"."venda" ("venempresa");

ALTER TABLE "telemarketing"."venda" ADD CONSTRAINT "vendas_pkey" PRIMARY KEY ("codigo");

CREATE INDEX "vendas_ID_idx" ON "telemarketing"."venda" ("id");

CREATE INDEX "vendas_vencgc_idx" ON "telemarketing"."venda" ("vencgc");

CREATE INDEX "vendas_vencontato_idx" ON "telemarketing"."venda" ("vencontato", "vencgc");

CREATE INDEX "vendas_vendatacancel_idx" ON "telemarketing"."venda" ("vendatacancel");

CREATE INDEX "vendas_vendatafaturado_idx" ON "telemarketing"."venda" ("vendatafaturado");

CREATE INDEX "vendas_vendatafechado_idx" ON "telemarketing"."venda" ("vendatafechado");

CREATE INDEX "vendas_Vendedor_idx" ON "telemarketing"."venda" ("venfuncionario");

CREATE INDEX "vendas_cod_idx" ON "telemarketing"."venda" ("codigo");
CREATE INDEX "vendas_vennúmero_idx" ON "telemarketing"."venda" ("vennumero");

-- CREATE Relationships ...
ALTER TABLE "telemarketing"."venda" ADD CONSTRAINT "vendas_venfuncionario_fk" FOREIGN KEY ("venfuncionario") REFERENCES "pessoa"."funcionario"("codigo") ON UPDATE CASCADE;

ALTER TABLE "telemarketing"."venda" ADD CONSTRAINT "vendas_venempresa_fk" FOREIGN KEY ("venempresa") REFERENCES "pessoa"."empresa"("codigo") ON UPDATE CASCADE ON DELETE CASCADE;

-- Relationship from "telemarketing"."venda" ("vencontato") to "pessoa"."contato"("ctclinome") does not enforce integrity.
-- Relationship from "telemarketing"."venda" ("vencgc") to "pessoa"."contato"("ctcodigo") does not enforce integrity.
-- Relationship from "telemarketing"."venda" ("ventransporte") to "servicos"."transportadora"("codigo") does not enforce integrity.
-- Relationship from "telemarketing"."venda" ("vencondpagto") to "telemarketing"."condicao_pagamento"("dspgcondicao") does not enforce integrity.
ALTER TABLE "telemarketing"."venda" ADD CONSTRAINT "vendas_vencondpagto_fk" FOREIGN KEY ("vencondpagto") REFERENCES "telemarketing"."condpagto"("codigo") ON UPDATE CASCADE;

ALTER TABLE "telemarketing"."venda" ADD CONSTRAINT "vendas_vencgc_fk" FOREIGN KEY ("vencgc") REFERENCES "pessoa"."cliente"("codigo") ON UPDATE CASCADE;

ALTER TABLE "telemarketing"."venda" ADD CONSTRAINT "vendas_vennatoper_fk" FOREIGN KEY ("vennatoper") REFERENCES "contabil"."natureza_operacao"("codigo") ON UPDATE CASCADE;

--sql script successful >>> /tmp/qbdados/2/vendas.sql
-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------
-- SET client_encoding = 'UTF-8';
-- SET
CREATE TABLE "pessoa"."vendedor"
 (
	"codigo"			VARCHAR (30),
	"id"			bigserial,
	"funcempresa"			INTEGER,
	"funccategoria"			VARCHAR (60),
	"funcdesconto"			DOUBLE PRECISION,
	"funcdescontoitem"			DOUBLE PRECISION,
	"funccomissao"			DOUBLE PRECISION,
	"funcregiao"			VARCHAR (30),
	"funcmeta"			DOUBLE PRECISION,
	"funcgratificacao"			DOUBLE PRECISION,
	"funcoperador"			VARCHAR (30),
	"funcdatamod"			TIMESTAMP WITHOUT TIME ZONE
);

COMMENT ON COLUMN "pessoa"."vendedor"."codigo" IS 'Código de identificação do funcionário.';

COMMENT ON COLUMN "pessoa"."vendedor"."funcempresa" IS 'Código de identificação da empresa.';

COMMENT ON COLUMN "pessoa"."vendedor"."funccategoria" IS 'Tipo de categoria do vendedor.';

COMMENT ON COLUMN "pessoa"."vendedor"."funcdesconto" IS 'Desconto máximo permitido aplicado à venda de modo geral.';

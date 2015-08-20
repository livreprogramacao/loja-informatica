sed -i "s/\"loja\".\"vendedor\"/\"pessoa\".\"vendedor\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"cliente\"/\"pessoa\".\"cliente\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"relcliempresa\"/\"pessoa\".\"cliente_empresa\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"clientecontatos\"/\"pessoa\".\"contato\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"fornecedor\"/\"pessoa\".\"fornecedor\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"relforempresa\"/\"pessoa\".\"fornecedor_empresa\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"empresa\"/\"pessoa\".\"empresa\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"relfuncempresa\"/\"pessoa\".\"funcionario_empresa\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"funcionario\"/\"pessoa\".\"funcionario\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"funcionariocargos\"/\"pessoa\".\"funcionario_cargo\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"user\"/\"pessoa\".\"usuario\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"atveconomica\"/\"pessoa\".\"atveconomica\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"pais\"/\"pessoa\".\"pais\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"cidade\"/\"pessoa\".\"cidade\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"regiao\"/\"pessoa\".\"regiao\"/g" sql/postgresql-create-tables.sql





sed -i "s/\"loja\".\"codtributorigem\"/\"contabil\".\"codtributorigem\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"classfiscal\"/\"contabil\".\"classfiscal\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"classfiscal_substituicao\"/\"contabil\".\"classfiscal_substituicao\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"aliquota\"/\"contabil\".\"aliquota\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"naturezaoperacaocodigos\"/\"contabil\".\"natureza_operacao_codigo\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"naturezaoperacao\"/\"contabil\".\"natureza_operacao\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"notasfiscaiscor\"/\"contabil\".\"nota_fiscal_correcao\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"notasfiscaisform\"/\"contabil\".\"nota_fiscal_formulario\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"notasfiscais\"/\"contabil\".\"nota_fiscal\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"tempnfentrada\"/\"contabil\".\"tempnfentrada\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"tempnfentradapagto\"/\"contabil\".\"tempnfentradapagto\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"tempnfentradaparciais\"/\"contabil\".\"tempnfentradaparciais\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"tempnfentradaprod\"/\"contabil\".\"tempnfentradaprod\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"tipocentrocustos\"/\"contabil\".\"tipo_centro_custo\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"tipoparticipacao\"/\"contabil\".\"tipo_participacao\"/g" sql/postgresql-create-tables.sql


sed -i "s/\"loja\".\"estoque\"/\"deposito\".\"estoque\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"kardex\"/\"deposito\".\"kardex\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"produto\"/\"deposito\".\"produto\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"produtosestoque\"/\"deposito\".\"produtosestoque\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"produtosfornecedor\"/\"deposito\".\"produtosfornecedor\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"produtoslinha\"/\"deposito\".\"produtoslinha\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"produtosprecocliente\"/\"deposito\".\"produtosprecocliente\"/g" sql/postgresql-create-tables.sql


sed -i "s/\"loja\".\"undmedida\"/\"serviços\".\"undmedida\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"servicos\"/\"serviços\".\"servico\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"transportadora\"/\"serviços\".\"transportadora\"/g" sql/postgresql-create-tables.sql

sed -i "s/\"loja\".\"propostaparametrizada\"/\"telemarketing\".\"proposta_parametrizada\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"vendasfatprod\"/\"telemarketing\".\"venda_faturada_produto\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"vendasfaturadas\"/\"telemarketing\".\"venda_faturada\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"vendas\"/\"telemarketing\".\"venda\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"vendasprodutos\"/\"telemarketing\".\"venda_produto\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"vendasservicos\"/\"telemarketing\".\"venda_servico\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"promocaoprodutos\"/\"telemarketing\".\"produto_promocao\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"promocao\"/\"telemarketing\".\"promocao\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"condpagto\"/\"telemarketing\".\"condpagto\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"receberpagar\"/\"telemarketing\".\"receberpagar\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"tiporecdesp\"/\"telemarketing\".\"tiporecdesp\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"condpagtodias\"/\"telemarketing\".\"condicao_pagamento\"/g" sql/postgresql-create-tables.sql

sed -i "s/\"loja\".\"compras\"/\"compras\".\"compra\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"comprasprodutos\"/\"compras\".\"compra_produto\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"compranota\"/\"compras\".\"compranota\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"compranotaparciais\"/\"compras\".\"compra_nota_parcial\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"compranotaprod\"/\"compras\".\"compranotaprod\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"comprasdevolucoes\"/\"compras\".\"compra_devolucao\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"moedascotacao\"/\"compras\".\"moeda_cotacao\"/g" sql/postgresql-create-tables.sql
sed -i "s/\"loja\".\"moedas\"/\"compras\".\"moeda\"/g" sql/postgresql-create-tables.sql


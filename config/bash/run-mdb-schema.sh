#!/bin/bash -x


DESTINO=/tmp/qbdados/mdb-schema
MSACCESS=/home/tux/Downloads/Dropbox/projeto/waretech.com.br/QBDados.mdb

mkdir -p $DESTINO/primario


mdb-schema --no-indexes -N loja --table tblreceberpagar $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/receberpagar.sql
mdb-schema --no-indexes -N loja --table tblcliente $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/cliente.sql
mdb-schema --no-indexes -N loja --table tblkardex $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/kardex.sql
mdb-schema --no-indexes -N loja --table tblprodutos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/produtos.sql
mdb-schema --no-indexes -N loja --table tblvendasfatprod $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/vendasfatprod.sql
mdb-schema --no-indexes -N loja --table tblprodutosestoque $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/produtosestoque.sql
mdb-schema --no-indexes -N loja --table tblnotasfiscaisform $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/notasfiscaisform.sql
mdb-schema --no-indexes -N loja --table tblcompranotaprod $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/compranotaprod.sql
mdb-schema --no-indexes -N loja --table tblcomprasprodutos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/comprasprodutos.sql
mdb-schema --no-indexes -N loja --table tblcompranota $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/compranota.sql
mdb-schema --no-indexes -N loja --table tblcompras $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/compras.sql
mdb-schema --no-indexes -N loja --table tblprodutosfornecedor $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/produtosfornecedor.sql
mdb-schema --no-indexes -N loja --table tblrelcliempresa $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/relcliempresa.sql
mdb-schema --no-indexes -N loja --table tbltempnfentradaprod $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tempnfentradaprod.sql
mdb-schema --no-indexes -N loja --table tblnotasfiscais $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/notasfiscais.sql
mdb-schema --no-indexes -N loja --table tblvendas $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/vendas.sql
mdb-schema --no-indexes -N loja --table tblcompranotaparciais $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/compranotaparciais.sql
mdb-schema --no-indexes -N loja --table tblvendasprodutos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/vendasprodutos.sql
mdb-schema --no-indexes -N loja --table tbltiporecdesp $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tiporecdesp.sql
mdb-schema --no-indexes -N loja --table tblcidade $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/cidade.sql
mdb-schema --no-indexes -N loja --table tbltempnfentrada $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tempnfentrada.sql
mdb-schema --no-indexes -N loja --table tblfornecedor $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/fornecedor.sql
mdb-schema --no-indexes -N loja --table tblmenusuario $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/menusuario.sql
mdb-schema --no-indexes -N loja --table tblservicos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/servicos.sql
mdb-schema --no-indexes -N loja --table tbltempnfentradaparciais $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tempnfentradaparciais.sql
mdb-schema --no-indexes -N loja --table tbltempnfentradapagto $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tempnfentradapagto.sql
mdb-schema --no-indexes -N loja --table tbltipoparticipacao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tipoparticipacao.sql
mdb-schema --no-indexes -N loja --table tblrptcontrole $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/rptcontrole.sql
mdb-schema --no-indexes -N loja --table tblrelforempresa $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/relforempresa.sql
mdb-schema --no-indexes -N loja --table tblusysmaq $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/usysmaq.sql
mdb-schema --no-indexes -N loja --table tblvendasfaturadas $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/vendasfaturadas.sql
mdb-schema --no-indexes -N loja --table tblcondpagtodias $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/condpagtodias.sql
mdb-schema --no-indexes -N loja --table tbltransportadora $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/transportadora.sql
mdb-schema --no-indexes -N loja --table tblnotasfiscaiscor $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/notasfiscaiscor.sql
mdb-schema --no-indexes -N loja --table tblcondpagto $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/condpagto.sql
mdb-schema --no-indexes -N loja --table tblclassfiscal $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/classfiscal.sql
mdb-schema --no-indexes -N loja --table tblmenu $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/menu.sql
mdb-schema --no-indexes -N loja --table tblfuncionario $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/funcionario.sql
mdb-schema --no-indexes -N loja --table tblpais $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/pais.sql
mdb-schema --no-indexes -N loja --table tblcomprasdevolucoes $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/comprasdevolucoes.sql
mdb-schema --no-indexes -N loja --table tbla_spl $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/a_spl.sql
mdb-schema --no-indexes -N loja --table tblvendasservicos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/vendasservicos.sql
mdb-schema --no-indexes -N loja --table tblvendedor $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/vendedor.sql
mdb-schema --no-indexes -N loja --table tblnaturezaoperacao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/naturezaoperacao.sql
mdb-schema --no-indexes -N loja --table tblnotasfiscaiscorsub $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/notasfiscaiscorsub.sql
mdb-schema --no-indexes -N loja --table tblbancos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/bancos.sql
mdb-schema --no-indexes -N loja --table tblempresa $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/empresa.sql
mdb-schema --no-indexes -N loja --table tblcodtributorigem $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/codtributorigem.sql
mdb-schema --no-indexes -N loja --table tblrelfuncempresa $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/relfuncempresa.sql
mdb-schema --no-indexes -N loja --table tblaliquota $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/aliquota.sql
mdb-schema --no-indexes -N loja --table tblprodutoslinha $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/produtoslinha.sql
mdb-schema --no-indexes -N loja --table tblcomprasprodutos_di $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/comprasprodutos_di.sql
mdb-schema --no-indexes -N loja --table tbltipocentrocustos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tipocentrocustos.sql
mdb-schema --no-indexes -N loja --table tbluser $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/user.sql
mdb-schema --no-indexes -N loja --table tblnaturezaoperacaocodigos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/naturezaoperacaocodigos.sql
mdb-schema --no-indexes -N loja --table tbltipodocumento $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/tipodocumento.sql
mdb-schema --no-indexes -N loja --table tblreducaoicms $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/reducaoicms.sql
mdb-schema --no-indexes -N loja --table tblagencia $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/agencia.sql
mdb-schema --no-indexes -N loja --table tblclientecontatos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/clientecontatos.sql
mdb-schema --no-indexes -N loja --table tbldizeresfiscais $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/dizeresfiscais.sql
mdb-schema --no-indexes -N loja --table tblatveconomica $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/atveconomica.sql
mdb-schema --no-indexes -N loja --table tblstatus $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/status.sql
mdb-schema --no-indexes -N loja --table tblfuncionariocargos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/funcionariocargos.sql
mdb-schema --no-indexes -N loja --table tblundmedida $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/undmedida.sql
mdb-schema --no-indexes -N loja --table tblclassfiscal_substituicao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/classfiscal_substituicao.sql
mdb-schema --no-indexes -N loja --table tblordemproducaomotivo $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/ordemproducaomotivo.sql
mdb-schema --no-indexes -N loja --table tblnaturezaoperacaodefault $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/naturezaoperacaodefault.sql
mdb-schema --no-indexes -N loja --table tblauxiliar1 $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/auxiliar1.sql
mdb-schema --no-indexes -N loja --table tblprodutosprecocliente $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/produtosprecocliente.sql
mdb-schema --no-indexes -N loja --table tblpropostaparametrizada $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/propostaparametrizada.sql
mdb-schema --no-indexes -N loja --table tblmoedascotacao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/moedascotacao.sql
mdb-schema --no-indexes -N loja --table tblaidentifica $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/aidentifica.sql
mdb-schema --no-indexes -N loja --table tblagendaclassificacao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/agendaclassificacao.sql
mdb-schema --no-indexes -N loja --table tblpromocao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/promocao.sql
mdb-schema --no-indexes -N loja --table tblsubstituicao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/substituicao.sql
mdb-schema --no-indexes -N loja --table tblmoedas $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/moedas.sql
mdb-schema --no-indexes -N loja --table tblagendaassunto $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/agendaassunto.sql
mdb-schema --no-indexes -N loja --table tblusysnet $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/usysnet.sql
mdb-schema --no-indexes -N loja --table tblpromocaoprodutos $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/promocaoprodutos.sql
mdb-schema --no-indexes -N loja --table tblcomprasprodutos_di_ad $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/comprasprodutos_di_ad.sql
mdb-schema --no-indexes -N loja --table tblregiao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/regiao.sql
mdb-schema --no-indexes -N loja --table tbla_nd $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/a_nd.sql
mdb-schema --no-indexes -N loja --table tblaversao $MSACCESS postgres | grep -F -v "s_GUID" | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $DESTINO/aversao.sql


sed -i "s/"tbl/"/g" $DESTINO/*.sql
sed -i "s/UUID/bigserial/g" $DESTINO/*.sql
#sed -i "s/s_GUID/ID/g" $DESTINO/*.sql

sed -i "s/"Cidid"/"id"/g" $DESTINO/*.sql
sed -i "s/"aluf"/"id"/g" $DESTINO/*.sql
sed -i "s/"assid"/"id"/g" $DESTINO/*.sql
sed -i "s/"atvid"/"id"/g" $DESTINO/*.sql
sed -i "s/"bcoid"/"id"/g" $DESTINO/*.sql
sed -i "s/"carid"/"id"/g" $DESTINO/*.sql
sed -i "s/"ccidentifica"/"id"/g" $DESTINO/*.sql
sed -i "s/"cfnbm"/"id"/g" $DESTINO/*.sql
sed -i "s/"classid"/"id"/g" $DESTINO/*.sql
sed -i "s/"clicgc"/"id"/g" $DESTINO/*.sql
sed -i "s/"cmpaidadicao"/"id"/g" $DESTINO/*.sql
sed -i "s/"codnatid"/"id"/g" $DESTINO/*.sql
sed -i "s/"comid"/"id"/g" $DESTINO/*.sql
sed -i "s/"cpgid"/"id"/g" $DESTINO/*.sql
sed -i "s/"cpnid"/"id"/g" $DESTINO/*.sql
sed -i "s/"ctbid"/"id"/g" $DESTINO/*.sql
sed -i "s/"ctrpid"/"id"/g" $DESTINO/*.sql
sed -i "s/"doctipo"/"id"/g" $DESTINO/*.sql
sed -i "s/"empid"/"id"/g" $DESTINO/*.sql
sed -i "s/"forcgc"/"id"/g" $DESTINO/*.sql
sed -i "s/"funcid"/"id"/g" $DESTINO/*.sql
sed -i "s/"menuid"/"id"/g" $DESTINO/*.sql
sed -i "s/"moedaid"/"id"/g" $DESTINO/*.sql
sed -i "s/"motid"/"id"/g" $DESTINO/*.sql
sed -i "s/"natid"/"id"/g" $DESTINO/*.sql
sed -i "s/"nfcid"/"id"/g" $DESTINO/*.sql
sed -i "s/"nfdid"/"id"/g" $DESTINO/*.sql
sed -i "s/"paissigla"/"id"/g" $DESTINO/*.sql
sed -i "s/"plinid"/"id"/g" $DESTINO/*.sql
sed -i "s/"rdidentifica"/"id"/g" $DESTINO/*.sql
sed -i "s/"rdregiao"/"id"/g" $DESTINO/*.sql
sed -i "s/"regid"/"id"/g" $DESTINO/*.sql
sed -i "s/"rptid"/"id"/g" $DESTINO/*.sql
sed -i "s/"status"/"id"/g" $DESTINO/*.sql
sed -i "s/"trpid"/"id"/g" $DESTINO/*.sql
sed -i "s/"undid"/"id"/g" $DESTINO/*.sql
sed -i "s/"userid"/"id"/g" $DESTINO/*.sql
sed -i "s/"venid"/"id"/g" $DESTINO/*.sql


#	"s_Generation"			INTEGER,
#	"s_Lineage"			BYTEA,
fgrep -F -i "PRIMARY KEY" $DESTINO/*.sql > /tmp/qbdados/alter-table-primary-key.sql
fgrep -F -i "ADD CONSTRAINT" $DESTINO/*.sql > /tmp/qbdados/alter-table-add-constraint.sql


#	-- CREATE Relationships ...
MYFILES=$(find $DESTINO/*.sql -type f)
for FILE in ${MYFILES}
do
	VALOR="$(cat $FILE | tail -1)"
	[ "$VALOR" = "-- CREATE Relationships ..." ] && mv $FILE $DESTINO/primario
done

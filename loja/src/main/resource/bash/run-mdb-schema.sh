#!/bin/bash

# ATENÇÃO APONTAR PARA UM LOCAL TEMPORÁRIO, LOGO ABAIXO ESTA PASTA SERÁ EXCLUIDA!!!!
BASE=/tmp/qbdados

rm -fr $BASE


PRIMARIO=$BASE/1
SECUNDARIO=$BASE/2
SCHEMA=$BASE/schema
MSACCESS=/home/tux/Downloads/Dropbox/projeto/waretech.com.br/QBDados.mdb


mkdir -p $BASE
mkdir -p $PRIMARIO
mkdir -p $SECUNDARIO
mkdir -p $SCHEMA


mdb-schema  -N loja --table tblreceberpagar $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/receberpagar.sql
mdb-schema  -N loja --table tblcliente $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/cliente.sql
mdb-schema  -N loja --table tblkardex $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/kardex.sql
mdb-schema  -N loja --table tblprodutos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/produtos.sql
mdb-schema  -N loja --table tblvendasfatprod $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/vendasfatprod.sql
mdb-schema  -N loja --table tblprodutosestoque $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/produtosestoque.sql
mdb-schema  -N loja --table tblnotasfiscaisform $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/notasfiscaisform.sql
mdb-schema  -N loja --table tblcompranotaprod $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/compranotaprod.sql
mdb-schema  -N loja --table tblcomprasprodutos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/comprasprodutos.sql
mdb-schema  -N loja --table tblcompranota $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/compranota.sql
mdb-schema  -N loja --table tblcompras $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/compras.sql
mdb-schema  -N loja --table tblprodutosfornecedor $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/produtosfornecedor.sql
mdb-schema  -N loja --table tblrelcliempresa $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/relcliempresa.sql
mdb-schema  -N loja --table tbltempnfentradaprod $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tempnfentradaprod.sql
mdb-schema  -N loja --table tblnotasfiscais $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/notasfiscais.sql
mdb-schema  -N loja --table tblvendas $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/vendas.sql
mdb-schema  -N loja --table tblcompranotaparciais $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/compranotaparciais.sql
mdb-schema  -N loja --table tblvendasprodutos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/vendasprodutos.sql
mdb-schema  -N loja --table tbltiporecdesp $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tiporecdesp.sql
mdb-schema  -N loja --table tblcidade $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/cidade.sql
mdb-schema  -N loja --table tbltempnfentrada $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tempnfentrada.sql
mdb-schema  -N loja --table tblfornecedor $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/fornecedor.sql
mdb-schema  -N loja --table tblmenusuario $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/menusuario.sql
mdb-schema  -N loja --table tblservicos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/servicos.sql
mdb-schema  -N loja --table tbltempnfentradaparciais $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tempnfentradaparciais.sql
mdb-schema  -N loja --table tbltempnfentradapagto $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tempnfentradapagto.sql
mdb-schema  -N loja --table tbltipoparticipacao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tipoparticipacao.sql
mdb-schema  -N loja --table tblrptcontrole $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/rptcontrole.sql
mdb-schema  -N loja --table tblrelforempresa $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/relforempresa.sql
mdb-schema  -N loja --table tblusysmaq $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/usysmaq.sql
mdb-schema  -N loja --table tblvendasfaturadas $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/vendasfaturadas.sql
mdb-schema  -N loja --table tblcondpagtodias $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/condpagtodias.sql
mdb-schema  -N loja --table tbltransportadora $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/transportadora.sql
mdb-schema  -N loja --table tblnotasfiscaiscor $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/notasfiscaiscor.sql
mdb-schema  -N loja --table tblcondpagto $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/condpagto.sql
mdb-schema  -N loja --table tblclassfiscal $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/classfiscal.sql
mdb-schema  -N loja --table tblmenu $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/menu.sql
mdb-schema  -N loja --table tblfuncionario $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/funcionario.sql
mdb-schema  -N loja --table tblpais $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/pais.sql
mdb-schema  -N loja --table tblcomprasdevolucoes $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/comprasdevolucoes.sql
mdb-schema  -N loja --table tbla_spl $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/a_spl.sql
mdb-schema  -N loja --table tblvendasservicos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/vendasservicos.sql
mdb-schema  -N loja --table tblvendedor $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/vendedor.sql
mdb-schema  -N loja --table tblnaturezaoperacao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/naturezaoperacao.sql
mdb-schema  -N loja --table tblnotasfiscaiscorsub $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/notasfiscaiscorsub.sql
mdb-schema  -N loja --table tblbancos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/bancos.sql
mdb-schema  -N loja --table tblempresa $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/empresa.sql
mdb-schema  -N loja --table tblcodtributorigem $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/codtributorigem.sql
mdb-schema  -N loja --table tblrelfuncempresa $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/relfuncempresa.sql
mdb-schema  -N loja --table tblaliquota $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/aliquota.sql
mdb-schema  -N loja --table tblprodutoslinha $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/produtoslinha.sql
mdb-schema  -N loja --table tblcomprasprodutos_di $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/comprasprodutos_di.sql
mdb-schema  -N loja --table tbltipocentrocustos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tipocentrocustos.sql
mdb-schema  -N loja --table tbluser $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/user.sql
mdb-schema  -N loja --table tblnaturezaoperacaocodigos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/naturezaoperacaocodigos.sql
mdb-schema  -N loja --table tbltipodocumento $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/tipodocumento.sql
mdb-schema  -N loja --table tblreducaoicms $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/reducaoicms.sql
mdb-schema  -N loja --table tblagencia $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/agencia.sql
mdb-schema  -N loja --table tblclientecontatos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/clientecontatos.sql
mdb-schema  -N loja --table tbldizeresfiscais $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/dizeresfiscais.sql
mdb-schema  -N loja --table tblatveconomica $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/atveconomica.sql
mdb-schema  -N loja --table tblstatus $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/status.sql
mdb-schema  -N loja --table tblfuncionariocargos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/funcionariocargos.sql
mdb-schema  -N loja --table tblundmedida $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/undmedida.sql
mdb-schema  -N loja --table tblclassfiscal_substituicao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/classfiscal_substituicao.sql
mdb-schema  -N loja --table tblordemproducaomotivo $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/ordemproducaomotivo.sql
mdb-schema  -N loja --table tblnaturezaoperacaodefault $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/naturezaoperacaodefault.sql
mdb-schema  -N loja --table tblauxiliar1 $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/auxiliar1.sql
mdb-schema  -N loja --table tblprodutosprecocliente $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/produtosprecocliente.sql
mdb-schema  -N loja --table tblpropostaparametrizada $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/propostaparametrizada.sql
mdb-schema  -N loja --table tblmoedascotacao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/moedascotacao.sql
mdb-schema  -N loja --table tblaidentifica $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/aidentifica.sql
mdb-schema  -N loja --table tblagendaclassificacao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/agendaclassificacao.sql
mdb-schema  -N loja --table tblpromocao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/promocao.sql
mdb-schema  -N loja --table tblsubstituicao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/substituicao.sql
mdb-schema  -N loja --table tblmoedas $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/moedas.sql
mdb-schema  -N loja --table tblagendaassunto $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/agendaassunto.sql
mdb-schema  -N loja --table tblusysnet $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/usysnet.sql
mdb-schema  -N loja --table tblpromocaoprodutos $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/promocaoprodutos.sql
mdb-schema  -N loja --table tblcomprasprodutos_di_ad $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/comprasprodutos_di_ad.sql
mdb-schema  -N loja --table tblregiao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/regiao.sql
mdb-schema  -N loja --table tbla_nd $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/a_nd.sql
mdb-schema  -N loja --table tblaversao $MSACCESS postgres | grep -F -v "s_Lineage" | grep -F -v "s_Generation" > $SCHEMA/aversao.sql

fgrep -F -i "PRIMARY KEY"    $SCHEMA/*.sql > $BASE/_alter-table-primary-key.sql
fgrep -F -i "ADD CONSTRAINT" $SCHEMA/*.sql > $BASE/_alter-table-add-constraint.sql

# localiza tabelas com chaves primárias múltiplas

# renomeia as tabelas
sed -i "s/"tbl/"/g" $SCHEMA/*.sql

# corrige comandos SQL
sed -i "s/CONSTRAINT \"loja\".\"/CONSTRAINT \"/g" $SCHEMA/*.sql
#sed -i "s/REFERENCES \"loja\".\"/REFERENCES \"/g" $SCHEMA/*.sql
#sed -i "s/ON \"loja\".\"/ON \"/g" $SCHEMA/*.sql
sed -i "s/KEY (\"loja\".\"/KEY (\"/g" $SCHEMA/*.sql
sed -i "s/(\"loja\".\"/(\"/g" $SCHEMA/*.sql
sed -i "s/INDEX \"loja\".\"/INDEX \"/g" $SCHEMA/*.sql

# renomeia campos
sed -i "s/UUID/bigserial/g" $SCHEMA/*.sql
sed -i "s/s_GUID/ID/g" $SCHEMA/*.sql
sed -i "s/"Cidid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"aluf"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"assid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"atvid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"bcoid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"carid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"ccidentifica"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"cfnbm"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"classid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"clicgc"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"cmpaidadicao"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"codnatid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"comid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"cpgid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"cpnid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"ctbid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"ctrpid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"doctipo"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"empid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"forcgc"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"funcid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"menuid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"moedaid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"motid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"natid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"nfcid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"nfdid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"paissigla"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"plinid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"rdidentifica"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"rdregiao"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"regid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"rptid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"status"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"trpid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"undid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"userid"/"codigo"/g" $SCHEMA/*.sql
sed -i "s/"venid"/"codigo"/g" $SCHEMA/*.sql


# separa as tabelas entre primarias (sem dependencias) e secundárias (com dependencia)
MYFILES=$(find $SCHEMA/*.sql -type f)
for FILE in ${MYFILES}
do
	VALOR="$(cat $FILE | tail -1)"
	[ "$VALOR"  = "-- CREATE Relationships ..." ] && mv $FILE $PRIMARIO
	[ "$VALOR" != "-- CREATE Relationships ..." ] && mv $FILE $SECUNDARIO
done


cd ~/j/workspace/NetBeansProjects/waretech.com.br/loja/src/main/resource \
&& psql -U postgres -f sql/postgresql-create-database.sql \
&& psql -U postgres -d loja -f sql/postgresql-create-schema.sql \
&& bash/run-psql-execute.sh $PRIMARIO > ~/j/workspace/NetBeansProjects/waretech.com.br/loja/src/main/resource/sql/qbdados.sql \
&& echo "-- tabelas secundarias - Tabelas com relacionamento... amoroso com outras tabelas ==> loves in the air." >> ~/j/workspace/NetBeansProjects/waretech.com.br/loja/src/main/resource/sql/qbdados.sql \
&& bash/run-psql-execute.sh $SECUNDARIO >> ~/j/workspace/NetBeansProjects/waretech.com.br/loja/src/main/resource/sql/qbdados.sql
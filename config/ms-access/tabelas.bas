Attribute VB_Name = "tabelas"
Option Compare Database

Sub Main()

	rowcount = DCount("*", "atbl_nd")
	rowcount = DCount("*", "atbl_spl")
	rowcount = DCount("*", "MSysCompactError")
	rowcount = DCount("*", "atblidentifica")
	rowcount = DCount("*", "atblprocessa")
	rowcount = DCount("*", "atbltipoparticipacao")
	rowcount = DCount("*", "tbl_bancos")
	rowcount = DCount("*", "tbl_carteiras")
	rowcount = DCount("*", "tbl_Devolve")
	rowcount = DCount("*", "tbl_msg")
	rowcount = DCount("*", "tblagencia")
	rowcount = DCount("*", "tblagenciacontatos")
	rowcount = DCount("*", "tblagenda")
	rowcount = DCount("*", "tblagendaclassificacao")
	rowcount = DCount("*", "tblaliquota")
	rowcount = DCount("*", "tblatveconomica")
	rowcount = DCount("*", "tblautorizacao")
	rowcount = DCount("*", "tblauxiliar1")
	rowcount = DCount("*", "tblbancos")
	rowcount = DCount("*", "tblcidade")
	rowcount = DCount("*", "tblclassfiscal")
	rowcount = DCount("*", "tblclassfiscal_substituicao")
	rowcount = DCount("*", "tblcliente")
	rowcount = DCount("*", "tblclientecontatos")
	rowcount = DCount("*", "tblcodtributorigem")
	rowcount = DCount("*", "tblcompranota")
	rowcount = DCount("*", "tblcompranotacons")
	rowcount = DCount("*", "tblcompranotaparciais")
	rowcount = DCount("*", "tblcompranotaprod")
	rowcount = DCount("*", "tblcompranotaserv")
	rowcount = DCount("*", "tblcompras")
	rowcount = DCount("*", "tblcomprasconsig")
	rowcount = DCount("*", "tblcomprasdevolucoes")
	rowcount = DCount("*", "tblcomprasprodutos")
	rowcount = DCount("*", "tblcomprasprodutos_di_ad")
	rowcount = DCount("*", "tblcondpagto")
	rowcount = DCount("*", "tblcondpagtodias")
	rowcount = DCount("*", "tblcontrole")
	rowcount = DCount("*", "tbldevolucaoprodutos")
	rowcount = DCount("*", "tbldizeresfiscais")
	rowcount = DCount("*", "tblempresa")
	rowcount = DCount("*", "tblfornecedor")
	rowcount = DCount("*", "tblfornecedoranking")
	rowcount = DCount("*", "tblfornecedorcontatos")
	rowcount = DCount("*", "tblfuncionario")
	rowcount = DCount("*", "tblfuncionariocargos")
	rowcount = DCount("*", "tblkardex")
	rowcount = DCount("*", "tbllancamentosregistros")
	rowcount = DCount("*", "tblmenu")
	rowcount = DCount("*", "tblmenusuario")
	rowcount = DCount("*", "tblmoedas")
	rowcount = DCount("*", "tblmoedascotacao")
	rowcount = DCount("*", "tblnatureza")
	rowcount = DCount("*", "tblnaturezaoperacao")
	rowcount = DCount("*", "tblnaturezaoperacaocodigos")
	rowcount = DCount("*", "tblnaturezaoperacaodefault")
	rowcount = DCount("*", "tblnotasfiscaiscor")
	rowcount = DCount("*", "tblnotasfiscaiscorsub")
	rowcount = DCount("*", "tblnotasfiscaisform")
	rowcount = DCount("*", "tblnotasfiscaisnumeros")
	rowcount = DCount("*", "tblnumcompradel")
	rowcount = DCount("*", "tblnumvendadel")
	rowcount = DCount("*", "tblordemproducao")
	rowcount = DCount("*", "tblordemproducaocomponentes")
	rowcount = DCount("*", "tblordemproducaoexcecoes")
	rowcount = DCount("*", "tblordemproducaomotivo")
	rowcount = DCount("*", "tblpais")
	rowcount = DCount("*", "tblprodutos")
	rowcount = DCount("*", "tblprodutosassociados")
	rowcount = DCount("*", "tblprodutosconsignados")
	rowcount = DCount("*", "tblprodutosconsignadosfornecedor")
	rowcount = DCount("*", "tblprodutosdevolvidos")
	rowcount = DCount("*", "tblprodutosestoque")
	rowcount = DCount("*", "tblprodutoslinha")
	rowcount = DCount("*", "tblprodutoslinhacliente")
	rowcount = DCount("*", "tblprodutosprecocliente")
	rowcount = DCount("*", "tblprodutosreceita")
	rowcount = DCount("*", "tblpromocao")
	rowcount = DCount("*", "tblpromocaoprodutos")
	rowcount = DCount("*", "tblpropostaparametrizada")
	rowcount = DCount("*", "tblreducaoicms")
	rowcount = DCount("*", "tblregiao")
	rowcount = DCount("*", "tblrelcliempresa")
	rowcount = DCount("*", "tblrelforempresa")
	rowcount = DCount("*", "tblrelfuncempresa")
	rowcount = DCount("*", "tblremessa")
	rowcount = DCount("*", "tblrptcontrole")
	rowcount = DCount("*", "tblservicos")
	rowcount = DCount("*", "tblstatus")
	rowcount = DCount("*", "tblsubstituicao")
	rowcount = DCount("*", "tbltempbalancete")
	rowcount = DCount("*", "tbltempdemonstrativo")
	rowcount = DCount("*", "tbltempdemonstrativocontaspai")
	rowcount = DCount("*", "tbltempdemonstrativocruzada")
	rowcount = DCount("*", "tbltempfaturamento")
	rowcount = DCount("*", "tbltempjuros")
	rowcount = DCount("*", "tbltemplancamento")
	rowcount = DCount("*", "tbltemplancamentosdiversos")
	rowcount = DCount("*", "tbltemplancreg")
	rowcount = DCount("*", "tbltempnfentrada")
	rowcount = DCount("*", "tbltempnfentradaerro")
	rowcount = DCount("*", "tbltempnfentradaparciais")
	rowcount = DCount("*", "tbltempnfentradaprod")
	rowcount = DCount("*", "tbltempnfentradarelacaoconsig")
	rowcount = DCount("*", "tbltempnfentradaserv")
	rowcount = DCount("*", "tbltempordemproducaoexcecoes")
	rowcount = DCount("*", "tbltempprodutos")
	rowcount = DCount("*", "tbltempreceberpagarprog")
	rowcount = DCount("*", "tbltempservicos")
	rowcount = DCount("*", "tbltemptotalbalancete")
	rowcount = DCount("*", "tbltipocentrocustos")
	rowcount = DCount("*", "tbltipodocumento")
	rowcount = DCount("*", "tbltipodocumentocarteiras")
	rowcount = DCount("*", "tbltipoparticipacao")
	rowcount = DCount("*", "tbltiporecdesp")
	rowcount = DCount("*", "tbltransportadora")
	rowcount = DCount("*", "tbltransportadoracoleta")
	rowcount = DCount("*", "tbltransportadoracontatos")
	rowcount = DCount("*", "tblundmedida")
	rowcount = DCount("*", "tbluser")
	rowcount = DCount("*", "tblvendas")
	rowcount = DCount("*", "tblvendasconsig")
	rowcount = DCount("*", "tblvendasdevolvidas")
	rowcount = DCount("*", "tblvendasfatmateriais")
	rowcount = DCount("*", "tblvendasfatprod")
	rowcount = DCount("*", "tblvendasfatserv")
	rowcount = DCount("*", "tblvendasfaturadas")
	rowcount = DCount("*", "tblvendaspdv")
	rowcount = DCount("*", "tblvendasprodutos")
	rowcount = DCount("*", "tblvendasservicos")
	rowcount = DCount("*", "tblvendedor")
	rowcount = DCount("*", "tblweb")
	rowcount = DCount("*", "tempreceberprodserv")
	rowcount = DCount("*", "usyscontrol")
	rowcount = DCount("*", "usyscontrolador")
	rowcount = DCount("*", "usysmaq")
	rowcount = DCount("*", "usysnet")
	rowcount = DCount("*", "aversao")
	rowcount = DCount("*", "tblagendaassunto")
	rowcount = DCount("*", "tblcompranotaerro")
	rowcount = DCount("*", "tblcomprasprodutos_di")
	rowcount = DCount("*", "tblempresaimpostos")
	rowcount = DCount("*", "tbllancamentosregistrossecundaria")
	rowcount = DCount("*", "tblnotasfiscais")
	rowcount = DCount("*", "tblnumopdel")
	rowcount = DCount("*", "tblparametro")
	rowcount = DCount("*", "tblprodutosfornecedor")
	rowcount = DCount("*", "tblreceberpagar")
	rowcount = DCount("*", "tblremessaprodutos")
	rowcount = DCount("*", "tbltempdevolucaoprodutos")
	rowcount = DCount("*", "tbltempnfentradapagto")
	rowcount = DCount("*", "tbltemprecpag")
	rowcount = DCount("*", "tbltipoparticipacaohistorico")
	rowcount = DCount("*", "tblvendasdatas")

	rowcount = DCount("*", "tblvendas")
	MsgBox ("tblvendas - rowcount: " & rowcount)

	rowcount = DCount("*", "tblprodutos")
	MsgBox ("tblvendas - rowcount: " & rowcount)

End Sub

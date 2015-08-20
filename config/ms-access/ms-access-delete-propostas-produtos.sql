DELETE tblcompranotacons.* FROM tblprodutos INNER JOIN tblcompranotacons ON (tblprodutos.prodid = tblcompranotacons.cpconsproduto) AND (tblprodutos.prodempresa = tblcompranotacons.cpconsempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblcompranotaparciais.* FROM tblprodutos INNER JOIN tblcompranotaparciais ON (tblprodutos.prodid = tblcompranotaparciais.cpnpprod) AND (tblprodutos.prodempresa = tblcompranotaparciais.cpnpemp) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblcompranotaprod.* FROM tblprodutos INNER JOIN tblcompranotaprod ON (tblprodutos.prodid = tblcompranotaprod.cpmpdcodigo) AND (tblprodutos.prodempresa = tblcompranotaprod.cpmpdempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblcomprasdevolucoes.* FROM tblprodutos INNER JOIN tblcomprasdevolucoes ON (tblprodutos.prodid = tblcomprasdevolucoes.nfcpdcodigo) AND (tblprodutos.prodempresa = tblcomprasdevolucoes.nfcpdempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblcomprasprodutos.* FROM tblprodutos INNER JOIN tblcomprasprodutos ON (tblprodutos.prodid = tblcomprasprodutos.cmpproduto) AND (tblprodutos.prodempresa = tblcomprasprodutos.cmpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tbldevolucaoprodutos.* FROM tblprodutos INNER JOIN tbldevolucaoprodutos ON (tblprodutos.prodid = tbldevolucaoprodutos.dvpproduto) AND (tblprodutos.prodempresa = tbldevolucaoprodutos.dvpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblkardex.* FROM tblprodutos INNER JOIN tblkardex ON (tblprodutos.prodid = tblkardex.movproduto) AND (tblprodutos.prodempresa = tblkardex.movempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblordemproducaocomponentes.* FROM tblprodutos INNER JOIN tblordemproducaocomponentes ON (tblprodutos.prodid = tblordemproducaocomponentes.opcntcomponente) AND (tblprodutos.prodempresa = tblordemproducaocomponentes.opcntempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblordemproducaoexcecoes.* FROM tblprodutos INNER JOIN tblordemproducaoexcecoes ON (tblprodutos.prodempresa = tblordemproducaoexcecoes.opexempresa) AND (tblprodutos.prodid = tblordemproducaoexcecoes.opexcomponente) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutosprecocliente.* FROM tblprodutos INNER JOIN tblprodutosprecocliente ON (tblprodutos.prodid = tblprodutosprecocliente.espprod) AND (tblprodutos.prodempresa = tblprodutosprecocliente.espempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutosassociados.* FROM tblprodutos INNER JOIN tblprodutosassociados ON (tblprodutos.prodid = tblprodutosassociados.assproduto) AND (tblprodutos.prodempresa = tblprodutosassociados.assempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutosconsignados.* FROM tblprodutos INNER JOIN tblprodutosconsignados ON (tblprodutos.prodid = tblprodutosconsignados.conid) AND (tblprodutos.prodempresa = tblprodutosconsignados.conempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutosconsignadosfornecedor.* FROM tblprodutos INNER JOIN tblprodutosconsignadosfornecedor ON (tblprodutos.prodid = tblprodutosconsignadosfornecedor.conid) AND (tblprodutos.prodempresa = tblprodutosconsignadosfornecedor.conempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutosdevolvidos.* FROM tblprodutos INNER JOIN tblprodutosdevolvidos ON (tblprodutos.prodid = tblprodutosdevolvidos.dvpproduto) AND (tblprodutos.prodempresa = tblprodutosdevolvidos.dvpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutosestoque.* FROM tblprodutos INNER JOIN tblprodutosestoque ON (tblprodutos.prodid = tblprodutosestoque.estid) AND (tblprodutos.prodempresa = tblprodutosestoque.estempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#))
DELETE tblprodutosfornecedor.* FROM tblprodutos INNER JOIN tblprodutosfornecedor ON (tblprodutos.prodid = tblprodutosfornecedor.prodforproduto) AND (tblprodutos.prodempresa = tblprodutosfornecedor.prodforempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutoslinhacliente.* FROM tblprodutos INNER JOIN tblprodutoslinhacliente ON tblprodutos.prodformato = tblprodutoslinhacliente.lincliformato WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblprodutosreceita.* FROM tblprodutos INNER JOIN tblprodutosreceita ON (tblprodutos.prodid = tblprodutosreceita.pdcid) AND (tblprodutos.prodempresa = tblprodutosreceita.pdcempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblpromocaoprodutos.* FROM tblprodutos INNER JOIN tblpromocaoprodutos ON (tblprodutos.prodid = tblpromocaoprodutos.pmpproduto) AND (tblprodutos.prodempresa = tblpromocaoprodutos.pmpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblremessaprodutos.* FROM tblprodutos INNER JOIN tblremessaprodutos ON (tblprodutos.prodid = tblremessaprodutos.rprprod) AND (tblprodutos.prodempresa = tblremessaprodutos.rpremp) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblvendasfatmateriais.* FROM tblprodutos INNER JOIN tblvendasfatmateriais ON (tblprodutos.prodid = tblvendasfatmateriais.vencompcomp) AND (tblprodutos.prodempresa = tblvendasfatmateriais.vencompcompemp) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblvendasfatprod.* FROM tblprodutos INNER JOIN tblvendasfatprod ON (tblprodutos.prodid = tblvendasfatprod.ftpproduto) AND (tblprodutos.prodempresa = tblvendasfatprod.ftpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE tblvendasprodutos.* FROM tblprodutos INNER JOIN tblvendasprodutos ON (tblprodutos.prodid = tblvendasprodutos.vnpproduto) AND (tblprodutos.prodempresa = tblvendasprodutos.vnpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));
DELETE * FROM tblprodutos WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));



DELETE tblautorizacao.* FROM tblvendas INNER JOIN tblautorizacao ON tblvendas.venid = tblautorizacao.autvendaid WHERE (((tblvendas.vendataorca)<#1/1/2014#));
DELETE tblvendasdatas.* FROM tblvendas INNER JOIN tblvendasdatas ON tblvendas.venid = tblvendasdatas.agvenvendaid WHERE (((tblvendas.vendataorca)<#1/1/2014#));
DELETE tblvendasfaturadas.* FROM tblvendas INNER JOIN tblvendasfaturadas ON tblvendas.venid = tblvendasfaturadas.fatvenda WHERE (((tblvendas.vendataorca)<#1/1/2014#));
DELETE tblvendasprodutos.* FROM tblvendas INNER JOIN tblvendasprodutos ON tblvendas.venid = tblvendasprodutos.vnpnumero WHERE (((tblvendas.vendataorca)<#1/1/2014#));
DELETE tblvendasservicos.* FROM tblvendas INNER JOIN tblvendasservicos ON tblvendas.venid = tblvendasservicos.vnsid WHERE (((tblvendas.vendataorca)<#1/1/2014#));
DELETE * FROM tblvendas WHERE (((tblvendas.vendataorca)<#1/1/2014#));
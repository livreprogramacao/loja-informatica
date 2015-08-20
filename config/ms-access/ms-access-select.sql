SELECT tblprodutos.prodid, tblprodutos.prodvigencia, tblclassfiscal.*
FROM tblclassfiscal INNER JOIN tblprodutos ON tblclassfiscal.cfnbm = tblprodutos.prodcfiscal
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#))
order by tblprodutos.prodvigencia;


-- count produtos com prodvigencia < #1/1/2014#
SELECT count( tblprodutos.prodvigencia )
FROM (((tblprodutos INNER JOIN tblprodutosestoque ON (tblprodutos.prodid = tblprodutosestoque.estid) AND (tblprodutos.prodempresa = tblprodutosestoque.estempresa)) INNER JOIN tblvendasprodutos ON (tblprodutos.prodid = tblvendasprodutos.vnpproduto) AND (tblprodutos.prodempresa = tblvendasprodutos.vnpempresa)) INNER JOIN tblvendasfatprod ON (tblprodutos.prodid = tblvendasfatprod.ftpproduto) AND (tblprodutos.prodempresa = tblvendasfatprod.ftpempresa)) INNER JOIN tblcomprasprodutos ON (tblprodutos.prodid = tblcomprasprodutos.cmpproduto) AND (tblprodutos.prodempresa = tblcomprasprodutos.cmpempresa)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));


SELECT tblvendas.vendataorca
FROM (((tblprodutos INNER JOIN ((tblcliente INNER JOIN tblvendas ON tblcliente.clicgc = tblvendas.vencgc) 
INNER JOIN tblvendasprodutos ON tblvendas.venid = tblvendasprodutos.vnpnumero) ON (tblprodutos.prodid = tblvendasprodutos.vnpproduto) AND (tblprodutos.prodempresa = tblvendasprodutos.vnpempresa)) 
INNER JOIN tblreceberpagar ON tblcliente.clicgc = tblreceberpagar.ctrpidentifica) 
INNER JOIN tblkardex ON (tblprodutos.prodid = tblkardex.movproduto) AND (tblprodutos.prodempresa = tblkardex.movempresa)) 
INNER JOIN tblvendasfatprod ON (tblprodutos.prodid = tblvendasfatprod.ftpproduto) AND (tblprodutos.prodempresa = tblvendasfatprod.ftpempresa)
WHERE (((tblvendas.vendataorca) < #1/1/2014#));



SELECT tblcomprasprodutos.cmpproduto
FROM tblcomprasprodutos
WHERE (((tblcomprasprodutos.cmpproduto)="ZT-84GEM2M-HSB"));


SELECT tblvendas.[venid], tblvendas.vendataorca
FROM tblvendas
WHERE (((tblvendas.vendataorca) > #1/1/2014#));

SELECT tblprodutos.proddatamod
FROM tblprodutos
WHERE (((tblprodutos.proddatamod)<#1/1/2014#));

SELECT tblvendas.venid, tblvendas.vendataorca, tblcliente.clifantasia
FROM tblcliente 
INNER JOIN tblvendas ON tblcliente.clicgc = tblvendas.vencgc
WHERE (((tblvendas.vendataorca)>#5/10/2014#));

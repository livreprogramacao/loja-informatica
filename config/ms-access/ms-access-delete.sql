DELETE tblcompranotacons.*
FROM tblprodutos INNER JOIN tblcompranotacons ON (tblprodutos.prodid = tblcompranotacons.cpconsproduto) AND (tblprodutos.prodempresa = tblcompranotacons.cpconsempresa);

DELETE tblprodutoslinhacliente.*
FROM tblprodutos INNER JOIN tblprodutoslinhacliente ON tblprodutos.prodformato = tblprodutoslinhacliente.lincliformato
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));

DELETE tblremessaprodutos.*
FROM tblprodutos INNER JOIN tblremessaprodutos ON (tblprodutos.prodid = tblremessaprodutos.rprprod) AND (tblprodutos.prodempresa = tblremessaprodutos.rpremp)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));

DELETE tblprodutosdevolvidos.*
FROM tblprodutos INNER JOIN tblprodutosdevolvidos ON (tblprodutos.prodid = tblprodutosdevolvidos.dvpproduto) AND (tblprodutos.prodempresa = tblprodutosdevolvidos.dvpempresa)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));

DELETE tbldevolucaoprodutos.*
FROM tblprodutos INNER JOIN tbldevolucaoprodutos ON (tblprodutos.prodid = tbldevolucaoprodutos.dvpproduto) AND (tblprodutos.prodempresa = tbldevolucaoprodutos.dvpempresa)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));

DELETE tblvendasprodutos.*
FROM tblprodutos INNER JOIN tblvendasprodutos ON (tblprodutos.prodid = tblvendasprodutos.vnpproduto) AND (tblprodutos.prodempresa = tblvendasprodutos.vnpempresa)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));

DELETE tblvendasfatprod.*
FROM tblprodutos INNER JOIN tblvendasfatprod ON (tblprodutos.prodid = tblvendasfatprod.ftpproduto) AND (tblprodutos.prodempresa = tblvendasfatprod.ftpempresa)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));

DELETE tblcomprasprodutos.*
FROM tblprodutos INNER JOIN tblcomprasprodutos ON (tblprodutos.prodid = tblcomprasprodutos.cmpproduto) AND (tblprodutos.prodempresa = tblcomprasprodutos.cmpempresa)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));

DELETE tblprodutosestoque.*
FROM tblprodutos INNER JOIN tblprodutosestoque ON (tblprodutos.prodid = tblprodutosestoque.estid) AND (tblprodutos.prodempresa = tblprodutosestoque.estempresa)
WHERE (((tblprodutos.prodvigencia)<#1/1/2014#))

DELETE tblprodutos.* FROM tblprodutos WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));










DELETE *
FROM tblvendas
WHERE (((tblvendas.vendataorca)<#1/1/2014#));















DELETE *
FROM tblprodutos
WHERE (((tblprodutos.proddatamod) <#11/1/2013#));

DELETE *
FROM tblvendastblautorizacao
WHERE venid in (
	SELECT tblvendas.[venid]
	FROM tblvendas
	WHERE (((tblvendas.vendataorca) > #1/1/2014#));
)



UPDATE Animals, Fruits SET Animals.Value="DELETED", Fruits.Value="DELETED" WHERE Animals.Value=Fruits.Value
DELETE Animals WHERE Animals.Value="DELETED"
DELETE Fruits WHERE Fruits.Value="DELETED"



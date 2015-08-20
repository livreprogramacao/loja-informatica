Attribute VB_Name = "TabelaExcluir"
Option Compare Database

Sub DeleteFromAllTables()
On Error GoTo Err_DeleteFromAllTables
        
        Call ExecuteRowCount
        
        MsgBox ("Aviso  -  Iniciando a manutenção.")
        
        Dim dbCurr As DAO.Database
        Dim tdfCurr As DAO.TableDef
        
        Set dbCurr = CurrentDb()
        
        dbCurr.Execute "DELETE tblcompranotacons.* FROM tblprodutos INNER JOIN tblcompranotacons ON (tblprodutos.prodid = tblcompranotacons.cpconsproduto) AND (tblprodutos.prodempresa = tblcompranotacons.cpconsempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblcompranotaparciais.* FROM tblprodutos INNER JOIN tblcompranotaparciais ON (tblprodutos.prodid = tblcompranotaparciais.cpnpprod) AND (tblprodutos.prodempresa = tblcompranotaparciais.cpnpemp) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblcompranotaprod.* FROM tblprodutos INNER JOIN tblcompranotaprod ON (tblprodutos.prodid = tblcompranotaprod.cpmpdcodigo) AND (tblprodutos.prodempresa = tblcompranotaprod.cpmpdempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblcomprasdevolucoes.* FROM tblprodutos INNER JOIN tblcomprasdevolucoes ON (tblprodutos.prodid = tblcomprasdevolucoes.nfcpdcodigo) AND (tblprodutos.prodempresa = tblcomprasdevolucoes.nfcpdempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblcomprasprodutos.* FROM tblprodutos INNER JOIN tblcomprasprodutos ON (tblprodutos.prodid = tblcomprasprodutos.cmpproduto) AND (tblprodutos.prodempresa = tblcomprasprodutos.cmpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tbldevolucaoprodutos.* FROM tblprodutos INNER JOIN tbldevolucaoprodutos ON (tblprodutos.prodid = tbldevolucaoprodutos.dvpproduto) AND (tblprodutos.prodempresa = tbldevolucaoprodutos.dvpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblkardex.* FROM tblprodutos INNER JOIN tblkardex ON (tblprodutos.prodid = tblkardex.movproduto) AND (tblprodutos.prodempresa = tblkardex.movempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblordemproducaocomponentes.* FROM tblprodutos INNER JOIN tblordemproducaocomponentes ON (tblprodutos.prodid = tblordemproducaocomponentes.opcntcomponente) AND (tblprodutos.prodempresa = tblordemproducaocomponentes.opcntempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblordemproducaoexcecoes.* FROM tblprodutos INNER JOIN tblordemproducaoexcecoes ON (tblprodutos.prodempresa = tblordemproducaoexcecoes.opexempresa) AND (tblprodutos.prodid = tblordemproducaoexcecoes.opexcomponente) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosprecocliente.* FROM tblprodutos INNER JOIN tblprodutosprecocliente ON (tblprodutos.prodid = tblprodutosprecocliente.espprod) AND (tblprodutos.prodempresa = tblprodutosprecocliente.espempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosassociados.* FROM tblprodutos INNER JOIN tblprodutosassociados ON (tblprodutos.prodid = tblprodutosassociados.assproduto) AND (tblprodutos.prodempresa = tblprodutosassociados.assempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosconsignados.* FROM tblprodutos INNER JOIN tblprodutosconsignados ON (tblprodutos.prodid = tblprodutosconsignados.conid) AND (tblprodutos.prodempresa = tblprodutosconsignados.conempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosconsignadosfornecedor.* FROM tblprodutos INNER JOIN tblprodutosconsignadosfornecedor ON (tblprodutos.prodid = tblprodutosconsignadosfornecedor.conid) AND (tblprodutos.prodempresa = tblprodutosconsignadosfornecedor.conempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosdevolvidos.* FROM tblprodutos INNER JOIN tblprodutosdevolvidos ON (tblprodutos.prodid = tblprodutosdevolvidos.dvpproduto) AND (tblprodutos.prodempresa = tblprodutosdevolvidos.dvpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosestoque.* FROM tblprodutos INNER JOIN tblprodutosestoque ON (tblprodutos.prodid = tblprodutosestoque.estid) AND (tblprodutos.prodempresa = tblprodutosestoque.estempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#))", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosfornecedor.* FROM tblprodutos INNER JOIN tblprodutosfornecedor ON (tblprodutos.prodid = tblprodutosfornecedor.prodforproduto) AND (tblprodutos.prodempresa = tblprodutosfornecedor.prodforempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutoslinhacliente.* FROM tblprodutos INNER JOIN tblprodutoslinhacliente ON tblprodutos.prodformato = tblprodutoslinhacliente.lincliformato WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutosreceita.* FROM tblprodutos INNER JOIN tblprodutosreceita ON (tblprodutos.prodid = tblprodutosreceita.pdcid) AND (tblprodutos.prodempresa = tblprodutosreceita.pdcempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblpromocaoprodutos.* FROM tblprodutos INNER JOIN tblpromocaoprodutos ON (tblprodutos.prodid = tblpromocaoprodutos.pmpproduto) AND (tblprodutos.prodempresa = tblpromocaoprodutos.pmpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblremessaprodutos.* FROM tblprodutos INNER JOIN tblremessaprodutos ON (tblprodutos.prodid = tblremessaprodutos.rprprod) AND (tblprodutos.prodempresa = tblremessaprodutos.rpremp) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendasfatmateriais.* FROM tblprodutos INNER JOIN tblvendasfatmateriais ON (tblprodutos.prodid = tblvendasfatmateriais.vencompcomp) AND (tblprodutos.prodempresa = tblvendasfatmateriais.vencompcompemp) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendasfatprod.* FROM tblprodutos INNER JOIN tblvendasfatprod ON (tblprodutos.prodid = tblvendasfatprod.ftpproduto) AND (tblprodutos.prodempresa = tblvendasfatprod.ftpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendasprodutos.* FROM tblprodutos INNER JOIN tblvendasprodutos ON (tblprodutos.prodid = tblvendasprodutos.vnpproduto) AND (tblprodutos.prodempresa = tblvendasprodutos.vnpempresa) WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblprodutos.* FROM tblprodutos WHERE (((tblprodutos.prodvigencia)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblautorizacao.* FROM tblvendas INNER JOIN tblautorizacao ON tblvendas.venid = tblautorizacao.autvendaid WHERE (((tblvendas.vendataorca)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendasdatas.* FROM tblvendas INNER JOIN tblvendasdatas ON tblvendas.venid = tblvendasdatas.agvenvendaid WHERE (((tblvendas.vendataorca)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendasfaturadas.* FROM tblvendas INNER JOIN tblvendasfaturadas ON tblvendas.venid = tblvendasfaturadas.fatvenda WHERE (((tblvendas.vendataorca)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendasprodutos.* FROM tblvendas INNER JOIN tblvendasprodutos ON tblvendas.venid = tblvendasprodutos.vnpnumero WHERE (((tblvendas.vendataorca)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendasservicos.* FROM tblvendas INNER JOIN tblvendasservicos ON tblvendas.venid = tblvendasservicos.vnsid WHERE (((tblvendas.vendataorca)<#1/1/2014#));", dbFailOnError
        dbCurr.Execute "DELETE tblvendas.* FROM tblvendas WHERE (((tblvendas.vendataorca)<#1/1/2014#));", dbFailOnError
        
        Set dbCurr = Nothing
        
        MsgBox ("Aviso  -  Terminando a manutenção!")
        
        Call ExecuteRowCount
        
End_DeleteFromAllTables:
        
Exit Sub

Err_DeleteFromAllTables:
MsgBox Err.Number & ": " & Err.Description
Resume End_DeleteFromAllTables

End Sub


Sub ExecuteRowCount()
On Error GoTo Err_ExecuteRowCount
        Dim dbCurr As DAO.Database
        Dim tdfCurr As DAO.TableDef

        Set dbCurr = CurrentDb()
        For Each tdfCurr In dbCurr.TableDefs

        If (tdfCurr.Attributes And dbSystemObject) = 0 Then

                If Left(tdfCurr.Name, 3) = "tbl" Then

                        If tdfCurr.Name = "tblreceberpagar" Or tdfCurr.Name = "tblkardex" Or tdfCurr.Name = "tblvendasprodutos" Or tdfCurr.Name = "tblvendasfatprod" Or tdfCurr.Name = "tblprodutosestoque" Or tdfCurr.Name = "tblnotasfiscaisform" Or tdfCurr.Name = "tblcompranotaprod" Or tdfCurr.Name = "tblcomprasprodutos" Or tdfCurr.Name = "tblcompranotaerro" Or tdfCurr.Name = "tblcompras" Or tdfCurr.Name = "tblrelcliempresa" Or tdfCurr.Name = "tblprodutosfornecedor" Or tdfCurr.Name = "tblcompranotaparciais" Or tdfCurr.Name = "tbltempnfentradaprod" Or tdfCurr.Name = "tbltiporecdesp" Or tdfCurr.Name = "tblnotasfiscais" Then
                                rowcount = DCount("*", tdfCurr.Name)
                                MsgBox ("Grupo [PRODUTOS]  -  A tabela: " & tdfCurr.Name & " possui " & rowcount & " registros.")
                        End If
                        
                        If (tdfCurr.Name = "tblvendas" Or tdfCurr.Name = "tblprodutos" Or tdfCurr.Name = "tblcliente") Then
                                rowcount = DCount("*", tdfCurr.Name)
                                MsgBox ("Grupo [VENDAS]  -  A tabela: " & tdfCurr.Name & " possui " & rowcount & " registros.")
                        End If
                        
                End If

        End If
        Next tdfCurr
        Set dbCurr = Nothing
        
End_ExecuteRowCount:
        
Exit Sub

Err_ExecuteRowCount:
MsgBox Err.Number & ": " & Err.Description
Resume End_ExecuteRowCount

End Sub

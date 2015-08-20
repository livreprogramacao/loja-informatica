/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loja.com.br.entity;

import java.util.Date;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author tux
 */
public class PropostaProdutoTest {

    PropostaProduto instance;
    Proposta proposta;
    Categoria categoria;
    Fornecedor fornecedor;
    Produto produto;
    Cliente cliente;
    PropostaStatus status;
    final Date DATA_CRIACAO = new Date();

    public PropostaProdutoTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        this.status = new PropostaStatus(Integer.MIN_VALUE);
        Double total = 10.99;
        proposta = new Proposta(Integer.MIN_VALUE, cliente, DATA_CRIACAO, total, status);

        categoria = new Categoria(Integer.MIN_VALUE, "Material");
        fornecedor = new Fornecedor(Integer.MIN_VALUE, "AOC");
        produto = new Produto(Integer.MIN_VALUE, categoria, fornecedor, "Monitor", 100.00);

        Double quantidade = 1.00;
        Double valor = 1.99;
        this.instance = new PropostaProduto(Integer.MIN_VALUE, proposta, produto, quantidade, valor);
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class PropostaProduto.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
//        PropostaProduto instance = new PropostaProduto();
        Integer expResult = Integer.MIN_VALUE;
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class PropostaProduto.
     */
    @Test
    public void testSetId() {
        System.out.println("setId");
        Integer expResult = Integer.MAX_VALUE;
        //Vendedor instance = new Vendedor();
        instance.setId(expResult);
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getQuantidade method, of class PropostaProduto.
     */
    @Test
    public void testGetQuantidade() {
        System.out.println("getQuantidade");
//        PropostaProduto instance = new PropostaProduto();
        Double expResult = 1.0;
        Double result = instance.getQuantidade();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setQuantidade method, of class PropostaProduto.
     */
    @Test
    public void testSetQuantidade() {
        System.out.println("setQuantidade");
        Double quantidade = null;
//        PropostaProduto instance = new PropostaProduto();
        instance.setQuantidade(quantidade);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getValor method, of class PropostaProduto.
     */
    @Test
    public void testGetValor() {
        System.out.println("getValor");
//        PropostaProduto instance = new PropostaProduto();
        Double expResult = 1.99;
        Double result = instance.getValor();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setValor method, of class PropostaProduto.
     */
    @Test
    public void testSetValor() {
        System.out.println("setValor");
        Double valor = null;
//        PropostaProduto instance = new PropostaProduto();
        instance.setValor(valor);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getProduto method, of class PropostaProduto.
     */
    @Test
    public void testGetProduto() {
        System.out.println("getProduto");
//        PropostaProduto instance = new PropostaProduto();
        Produto expResult = produto;
        Produto result = instance.getProduto();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setProduto method, of class PropostaProduto.
     */
    @Test
    public void testSetProduto() {
        System.out.println("setProduto");
        Produto produto = null;
//        PropostaProduto instance = new PropostaProduto();
        instance.setProduto(produto);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getProposta method, of class PropostaProduto.
     */
    @Test
    public void testGetProposta() {
        System.out.println("getProposta");
//        PropostaProduto instance = new PropostaProduto();
        Proposta expResult = proposta;
        Proposta result = instance.getProposta();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setProposta method, of class PropostaProduto.
     */
    @Test
    public void testSetProposta() {
        System.out.println("setProposta");
        Proposta proposta = null;
//        PropostaProduto instance = new PropostaProduto();
        instance.setProposta(proposta);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of hashCode method, of class PropostaProduto.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
//        PropostaProduto instance = new PropostaProduto();
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class PropostaProduto.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
//        PropostaProduto instance = new PropostaProduto();
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class PropostaProduto.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
//        PropostaProduto instance = new PropostaProduto();
        String expResult = "loja.com.br.entity.PropostaProduto[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

}

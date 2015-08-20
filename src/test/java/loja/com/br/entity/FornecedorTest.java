/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loja.com.br.entity;

import java.util.Collection;
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
public class FornecedorTest {

    Fornecedor instance;

    public FornecedorTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        instance = new Fornecedor(Integer.MIN_VALUE, "Fornecedor");
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Fornecedor.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        //Fornecedor instance = new Fornecedor();
        Integer expResult = Integer.MIN_VALUE;
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Fornecedor.
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
     * Test of getNome method, of class Fornecedor.
     */
    @Test
    public void testGetNome() {
        System.out.println("getNome");
        //Fornecedor instance = new Fornecedor();
        String expResult = "Fornecedor";
        String result = instance.getNome();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setNome method, of class Fornecedor.
     */
    @Test
    public void testSetNome() {
        System.out.println("setNome");
        String nome = "";
        //Fornecedor instance = new Fornecedor();
        instance.setNome(nome);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getProdutoCollection method, of class Fornecedor.
     */
    @Test
    public void testGetProdutoCollection() {
        System.out.println("getProdutoCollection");
        //Fornecedor instance = new Fornecedor();
        Collection<Produto> expResult = null;
        Collection<Produto> result = instance.getProdutos();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setProdutoCollection method, of class Fornecedor.
     */
    @Test
    public void testSetProdutoCollection() {
        System.out.println("setProdutoCollection");
        Collection<Produto> produtoCollection = null;
        //Fornecedor instance = new Fornecedor();
        instance.setProdutos(produtoCollection);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of hashCode method, of class Fornecedor.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        //Fornecedor instance = new Fornecedor();
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class Fornecedor.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
        //Fornecedor instance = new Fornecedor();
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class Fornecedor.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        //Fornecedor instance = new Fornecedor();
        String expResult = "loja.com.br.entity.Fornecedor[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

}

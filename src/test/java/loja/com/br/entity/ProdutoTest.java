/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loja.com.br.entity;

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
public class ProdutoTest {

    Produto instance;
    Categoria categoria;
    Fornecedor fornecedor;

    public ProdutoTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        categoria = new Categoria(Integer.MIN_VALUE, "Material");
        fornecedor = new Fornecedor(Integer.MIN_VALUE, "AOC");
        instance = new Produto(Integer.MIN_VALUE, categoria, fornecedor, "Monitor", 100.00);
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Produto.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        //Produto instance = new Produto();
        Integer expResult = Integer.MIN_VALUE;
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Produto.
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
     * Test of getNome method, of class Produto.
     */
    @Test
    public void testGetNome() {
        System.out.println("getNome");
        //Produto instance = new Produto();
        String expResult = "Monitor";
        String result = instance.getNome();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setNome method, of class Produto.
     */
    @Test
    public void testSetNome() {
        System.out.println("setNome");
        String nome = "";
        //Produto instance = new Produto();
        instance.setNome(nome);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getPreco method, of class Produto.
     */
    @Test
    public void testGetPreco() {
        System.out.println("getPreco");
        //Produto instance = new Produto();
        Double expResult = 100.00;
        Double result = instance.getPreco();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setPreco method, of class Produto.
     */
    @Test
    public void testSetPreco() {
        System.out.println("setPreco");
        Double preco = null;
        //Produto instance = new Produto();
        instance.setPreco(preco);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getCategoria method, of class Produto.
     */
    @Test
    public void testGetCategoria() {
        System.out.println("getCategoria");
        //Produto instance = new Produto();
        Categoria expResult = categoria;
        Categoria result = instance.getCategoria();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setCategoria method, of class Produto.
     */
    @Test
    public void testSetCategoria() {
        System.out.println("setCategoria");
        Categoria categoria = null;
        //Produto instance = new Produto();
        instance.setCategoria(categoria);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getFornecedor method, of class Produto.
     */
    @Test
    public void testGetFornecedor() {
        System.out.println("getFornecedor");
        //Produto instance = new Produto();
        Fornecedor expResult = fornecedor;
        Fornecedor result = instance.getFornecedor();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setFornecedor method, of class Produto.
     */
    @Test
    public void testSetFornecedor() {
        System.out.println("setFornecedor");
        Fornecedor fornecedor = null;
        //Produto instance = new Produto();
        instance.setFornecedor(fornecedor);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of hashCode method, of class Produto.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        //Produto instance = new Produto();
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class Produto.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
        //Produto instance = new Produto();
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class Produto.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        //Produto instance = new Produto();
        String expResult = "loja.com.br.entity.Produto[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

}

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
public class CategoriaTest {

    Categoria instance;

    public CategoriaTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        instance = new Categoria(Integer.MIN_VALUE, "Material");
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Categoria.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        //Categoria instance = new Categoria();
        Integer expResult = Integer.MIN_VALUE;
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Categoria.
     */
    @Test
    public void testSetId() {
        System.out.println("setId");
        Integer expResult = Integer.MAX_VALUE;
        //Vendedor instance = new Vendedor();
        instance.setId(expResult);
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of getNome method, of class Categoria.
     */
    @Test
    public void testGetNome() {
        System.out.println("getNome");
        //Categoria instance = new Categoria();
        String expResult = "Material";
        String result = instance.getNome();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of setNome method, of class Categoria.
     */
    @Test
    public void testSetNome() {
        System.out.println("setNome");
        String nome = "";
        //Categoria instance = new Categoria();
        instance.setNome(nome);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of getProdutos method, of class Categoria.
     */
    @Test
    public void testGetProdutos() {
        System.out.println("getProdutos");
        //Categoria instance = new Categoria();
        Collection<Produto> expResult = null;
        Collection<Produto> result = instance.getProdutos();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of setProdutos method, of class Categoria.
     */
    @Test
    public void testSetProdutos() {
        System.out.println("setProdutos");
        Collection<Produto> produtos = null;
        //Categoria instance = new Categoria();
        instance.setProdutos(produtos);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of hashCode method, of class Categoria.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        //Categoria instance = new Categoria();
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of equals method, of class Categoria.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
        //Categoria instance = new Categoria();
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

    /**
     * Test of toString method, of class Categoria.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        //Categoria instance = new Categoria();
        String expResult = "loja.com.br.entity.Categoria[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail"The test case is a prototype.");
    }

}

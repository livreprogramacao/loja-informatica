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
public class PropostaStatusTest {

    private PropostaStatus instance;

    public PropostaStatusTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        instance = new PropostaStatus(Integer.MIN_VALUE, "teste");
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class PropostaStatus.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        //PropostaStatus instance = new PropostaStatus();
        Integer expResult = Integer.MIN_VALUE;
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class PropostaStatus.
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
     * Test of getStatus method, of class PropostaStatus.
     */
    @Test
    public void testGetStatus() {
        System.out.println("getStatus");
        //PropostaStatus instance = new PropostaStatus();
        String expResult = "teste";
        String result = instance.getStatus();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setStatus method, of class PropostaStatus.
     */
    @Test
    public void testSetStatus() {
        System.out.println("setStatus");
        String status = "";
        //PropostaStatus instance = new PropostaStatus();
        instance.setStatus(status);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getPropostaCollection method, of class PropostaStatus.
     */
    @Test
    public void testGetPropostaCollection() {
        System.out.println("getPropostaCollection");
        //PropostaStatus instance = new PropostaStatus();
        Collection<Proposta> expResult = null;
        Collection<Proposta> result = instance.getPropostaCollection();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setPropostaCollection method, of class PropostaStatus.
     */
    @Test
    public void testSetPropostaCollection() {
        System.out.println("setPropostaCollection");
        Collection<Proposta> propostaCollection = null;
        //PropostaStatus instance = new PropostaStatus();
        instance.setPropostaCollection(propostaCollection);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of hashCode method, of class PropostaStatus.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        //PropostaStatus instance = new PropostaStatus();
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class PropostaStatus.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
        //PropostaStatus instance = new PropostaStatus();
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class PropostaStatus.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        //PropostaStatus instance = new PropostaStatus();
        String expResult = "loja.com.br.entity.PropostaStatus[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loja.com.br.entity;

import java.util.Collection;
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
public class PropostaTest {

    Cliente cliente;
    Proposta instance;
    PropostaStatus status;
    final Date DATA_CRIACAO = new Date();

    public PropostaTest() {
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
        Vendedor vendedor = new Vendedor(Integer.MIN_VALUE, "Carina", "teste unitario");
        this.cliente = new Cliente(0, vendedor, "nome");
        Date dataCriacao = DATA_CRIACAO;
        Double total = 10.99;
        instance = new Proposta(Integer.MIN_VALUE, cliente, dataCriacao, total, status);
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Proposta.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        //Proposta instance = new Proposta();
        Integer expResult = Integer.MIN_VALUE;
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Proposta.
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
     * Test of getDataCriacao method, of class Proposta.
     */
    @Test
    public void testGetDataCriacao() {
        System.out.println("getDataCriacao");
        //Proposta instance = new Proposta();
        Date expResult = DATA_CRIACAO;
        Date result = instance.getDataCriacao();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setDataCriacao method, of class Proposta.
     */
    @Test
    public void testSetDataCriacao() {
        System.out.println("setDataCriacao");
        Date dataCriacao = null;
        //Proposta instance = new Proposta();
        instance.setDataCriacao(dataCriacao);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getTotal method, of class Proposta.
     */
    @Test
    public void testGetTotal() {
        System.out.println("getTotal");
        //Proposta instance = new Proposta();
        Double expResult = 10.99;
        Double result = instance.getTotal();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setTotal method, of class Proposta.
     */
    @Test
    public void testSetTotal() {
        System.out.println("setTotal");
        Double total = null;
        //Proposta instance = new Proposta();
        instance.setTotal(total);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getProdutos method, of class Proposta.
     */
    @Test
    public void testGetProdutos() {
        System.out.println("getProdutos");
        //Proposta instance = new Proposta();
        Collection<PropostaProduto> expResult = null;
        Collection<PropostaProduto> result = instance.getProdutos();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setProdutos method, of class Proposta.
     */
    @Test
    public void testSetProdutos() {
        System.out.println("setProdutos");
        Collection<PropostaProduto> produtos = null;
        //Proposta instance = new Proposta();
        instance.setProdutos(produtos);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getStatus method, of class Proposta.
     */
    @Test
    public void testGetStatus() {
        System.out.println("getStatus");
        //Proposta instance = new Proposta();
        PropostaStatus expResult = status;
        PropostaStatus result = instance.getStatus();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setStatus method, of class Proposta.
     */
    @Test
    public void testSetStatus() {
        System.out.println("setStatus");
        PropostaStatus status = null;
        //Proposta instance = new Proposta();
        instance.setStatus(status);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of hashCode method, of class Proposta.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        //Proposta instance = new Proposta();
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class Proposta.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
        //Proposta instance = new Proposta();
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class Proposta.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        //Proposta instance = new Proposta();
        String expResult = "loja.com.br.entity.Proposta[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getCliente method, of class Proposta.
     */
    @Test
    public void testGetCliente() {
        System.out.println("getCliente");
        //Proposta instance = new Proposta();
        Cliente expResult = cliente;
        Cliente result = instance.getCliente();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setCliente method, of class Proposta.
     */
    @Test
    public void testSetCliente() {
        System.out.println("setCliente");
        Cliente cliente = null;
        //Proposta instance = new Proposta();
        instance.setCliente(cliente);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

}

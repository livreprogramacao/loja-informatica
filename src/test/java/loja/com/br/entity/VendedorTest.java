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
public class VendedorTest {

    Vendedor instance;

    public VendedorTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        instance = new Vendedor(Integer.MIN_VALUE, "Carina", "teste unitario");
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Vendedor.
     *
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        Integer expResult = Integer.MIN_VALUE;
        Integer result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Vendedor.
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
     * Test of getNome method, of class Vendedor.
     */
    @Test
    public void testGetNome() {
        System.out.println("getNome");
        //Vendedor instance = new Vendedor();
        String expResult = "Carina";
        String result = instance.getNome();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setNome method, of class Vendedor.
     */
    @Test
    public void testSetNome() {
        System.out.println("setNome");
        String nome = "";
        //Vendedor instance = new Vendedor();
        instance.setNome(nome);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of hashCode method, of class Vendedor.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        //Vendedor instance = new Vendedor();
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class Vendedor.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
        //Vendedor instance = new Vendedor();
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class Vendedor.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        //Vendedor instance = new Vendedor();
        String expResult = "loja.com.br.entity.Vendedor[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getObservacao method, of class Vendedor.
     */
    @Test
    public void testGetObservacao() {
        System.out.println("getObservacao");
        //Vendedor instance = new Vendedor();
        String expResult = "teste unitario";
        String result = instance.getObservacao();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setObservacao method, of class Vendedor.
     */
    @Test
    public void testSetObservacao() {
        System.out.println("setObservacao");
        String observacao = "";
        //Vendedor instance = new Vendedor();
        instance.setObservacao(observacao);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getClientes method, of class Vendedor.
     */
    @Test
    public void testGetClientes() {
        System.out.println("getClientes");
        //Vendedor instance = new Vendedor();
        Collection<Cliente> expResult = null;
        Collection<Cliente> result = instance.getClientes();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setClientes method, of class Vendedor.
     */
    @Test
    public void testSetClientes() {
        System.out.println("setClientes");
        Collection<Cliente> clientes = null;
        //Vendedor instance = new Vendedor();
        instance.setClientes(clientes);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

}

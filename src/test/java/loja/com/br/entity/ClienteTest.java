package loja.com.br.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author Fábio Santos Almeida <livre.programacao@.gmail.com>
 */
public class ClienteTest {

    Cliente instance;
    Vendedor vendedor;
    Validator validator;

    public ClienteTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        vendedor = new Vendedor(Integer.MIN_VALUE, "Carina", "teste unitario");
        instance = new Cliente(Integer.MIN_VALUE, vendedor, "nome");
        ValidatorFactory vf = Validation.buildDefaultValidatorFactory();
        this.validator = vf.getValidator();
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Cliente.
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
     * Test of setId method, of class Cliente.
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
     * Test of getNome method, of class Cliente.
     */
    @Test
    public void testGetNome() {
        System.out.println("getNome");
        String expResult = "nome";
        String result = instance.getNome();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setNome method, of class Cliente.
     */
    @Test
    public void testSetNome() {
        System.out.println("setNome");
        String nome = "nome";
        instance.setNome(nome);
        String expResult = "nome";
        String result = instance.getNome();
        assertEquals(expResult, result);
    }

    /**
     * Test of hashCode method, of class Cliente.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        int expResult = Integer.MIN_VALUE;
        int result = instance.hashCode();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class Cliente.
     */
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object object = null;
        boolean expResult = false;
        boolean result = instance.equals(object);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class Cliente.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        String expResult = "loja.com.br.entity.Cliente[ id=" + instance.getId() + " ]";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getPropostas method, of class Cliente.
     */
    @Test
    public void testGetPropostas() {
        System.out.println("getPropostas");
        Collection<Proposta> expResult = null;
        Collection<Proposta> result = instance.getPropostas();
        assertTrue("Deve estar sem propostas", result.isEmpty());
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setPropostas method, of class Cliente.
     */
    @Test
    public void testSetPropostas() {
        System.out.println("setPropostas");

        Date dataCriacao = new Date();
        Double total = Double.MIN_NORMAL;
        PropostaStatus status = new PropostaStatus(1);
        Collection<PropostaProduto> produtos = new ArrayList<>();
        Proposta proposta = new Proposta(Integer.MIN_VALUE, instance, dataCriacao, total, status);

        Collection<Proposta> propostas = new ArrayList<>(1);
        propostas.add(proposta);
        instance.setPropostas(propostas);

        Collection<Proposta> result = instance.getPropostas();
        assertTrue("Deve ter uma proposta", !result.isEmpty());
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getVendedor method, of class Cliente.
     */
    @Test
    public void testGetVendedor() {
        System.out.println("getVendedor");
        Vendedor expResult = vendedor;
        Vendedor result = instance.getVendedor();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setVendedor method, of class Cliente.
     */
    @Test
    public void testSetVendedor() {
        System.out.println("setVendedor");
        Vendedor expResult = new Vendedor(1);
        instance.setVendedor(expResult);
        Vendedor result = instance.getVendedor();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to //fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of Constraint Violation, of class Cliente.
     */
    @Test
    public void testConstraintViolation() {
        System.out.println("Test of Constraint Violation, of class Cliente.");
        Set<ConstraintViolation<Cliente>> violations = this.validator.validate(instance);
        assertTrue(violations.isEmpty());
    }

}

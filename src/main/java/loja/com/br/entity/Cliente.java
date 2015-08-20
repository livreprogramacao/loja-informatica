package loja.com.br.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 * @author Fábio Santos Almeida <livre.programacao@.gmail.com>
 *
 */
@Entity
@Table(name = "CLIENTE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c"),
    @NamedQuery(name = "Cliente.findById", query = "SELECT c FROM Cliente c WHERE c.id = :id"),
    @NamedQuery(name = "Cliente.findByVendedorId", query = "SELECT c FROM Cliente c WHERE c.vendedor = :vendedorId"),
    @NamedQuery(name = "Cliente.findByNome", query = "SELECT c FROM Cliente c WHERE c.nome = :nome")})
public class Cliente implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name = "CLIENTE_SEQ", schema = "APP", sequenceName = "cliente_seq", initialValue = 2, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CLIENTE_SEQ")
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;

    @JoinColumn(name = "VENDEDOR_ID", referencedColumnName = "ID")
    @ManyToOne
    @NotNull
    private Vendedor vendedor;

    @OneToMany(mappedBy = "cliente")
    private Collection<Proposta> propostas = new ArrayList<>();

    @Size(max = 30)
    @Column(name = "NOME")
    @NotNull
    private String nome;

    public Cliente() {
    }

    public Cliente(Integer id, Vendedor vendedor) {
        this.id = id;
        this.vendedor = vendedor;
    }

    public Cliente(Integer id, Vendedor vendedor, String nome) {
        this(id, vendedor);
        this.nome = nome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Cliente{" + "id=" + id + ", vendedor=" + vendedor + ", propostas=" + propostas + ", nome=" + nome + '}';
    }

    @XmlTransient
    public Collection<Proposta> getPropostas() {
        return propostas;
    }

    public void setPropostas(Collection<Proposta> propostas) {
        this.propostas = propostas;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

}

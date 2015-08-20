package loja.com.br.entity;

import java.io.Serializable;
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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Fábio Santos Almeida <livre.programacao@.gmail.com>
 */
@Entity
@Table(name = "PROPOSTA_PRODUTO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PropostaProduto.findAll", query = "SELECT p FROM PropostaProduto p"),
    @NamedQuery(name = "PropostaProduto.findById", query = "SELECT p FROM PropostaProduto p WHERE p.id = :id"),
    @NamedQuery(name = "PropostaProduto.findByQuantidade", query = "SELECT p FROM PropostaProduto p WHERE p.quantidade = :quantidade"),
    @NamedQuery(name = "PropostaProduto.findByValor", query = "SELECT p FROM PropostaProduto p WHERE p.valor = :valor")})
public class PropostaProduto implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name = "PROPOSTA_PRODUTO_SEQ", schema = "APP", sequenceName = "proposta_produto_seq", initialValue = 2, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROPOSTA_PRODUTO_SEQ")
    @Basic(optional = false)
    @Column(name = "ID")
    @NotNull
    private Integer id;

    @JoinColumn(name = "PROPOSTA_ID", referencedColumnName = "ID")
    @ManyToOne
    @NotNull
    private Proposta proposta;

    @JoinColumn(name = "PRODUTO_ID", referencedColumnName = "ID")
    @ManyToOne
    @NotNull
    private Produto produto;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "QUANTIDADE")
    @NotNull
    private Double quantidade;

    @Column(name = "VALOR")
    @NotNull
    private Double valor;

    public PropostaProduto() {
        super();
    }

    public PropostaProduto(Integer id) {
        this();
        this.id = id;
    }

    public PropostaProduto(Integer id, Proposta proposta, Produto produto, Double quantidade, Double valor) {
        this(id);
        this.proposta = proposta;
        this.produto = produto;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Double quantidade) {
        this.quantidade = quantidade;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Proposta getProposta() {
        return proposta;
    }

    public void setProposta(Proposta proposta) {
        this.proposta = proposta;
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
        if (!(object instanceof PropostaProduto)) {
            return false;
        }
        PropostaProduto other = (PropostaProduto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "loja.com.br.entity.PropostaProduto[ id=" + id + " ]";
    }

}

package loja.com.br.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
 *
 * @author Fábio Santos Almeida <livre.programacao@.gmail.com>
 */
@Entity
@Table(name = "PROPOSTA_STATUS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PropostaStatus.findAll", query = "SELECT p FROM PropostaStatus p"),
    @NamedQuery(name = "PropostaStatus.findById", query = "SELECT p FROM PropostaStatus p WHERE p.id = :id"),
    @NamedQuery(name = "PropostaStatus.findByStatus", query = "SELECT p FROM PropostaStatus p WHERE p.status = :status")})
public class PropostaStatus implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name = "PROPOSTA_STATUS_SEQ", schema = "APP", sequenceName = "proposta_status_seq", initialValue = 2, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROPOSTA_STATUS_SEQ")
    @Basic(optional = false)
    @Column(name = "ID")
    @NotNull
    private Integer id;

    @OneToMany(mappedBy = "status")
    private Collection<Proposta> propostaCollection;

    @Size(max = 30)
    @Column(name = "STATUS")
    @NotNull
    private String status;

    public PropostaStatus() {
        super();
    }

    public PropostaStatus(Integer id) {
        this();
        this.id = id;
    }

    public PropostaStatus(Integer id, String status) {
        this(id);
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Proposta> getPropostaCollection() {
        return propostaCollection;
    }

    public void setPropostaCollection(Collection<Proposta> propostaCollection) {
        this.propostaCollection = propostaCollection;
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
        if (!(object instanceof PropostaStatus)) {
            return false;
        }
        PropostaStatus other = (PropostaStatus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "loja.com.br.entity.PropostaStatus[ id=" + id + " ]";
    }

}

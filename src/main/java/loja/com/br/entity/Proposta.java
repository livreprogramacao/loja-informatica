/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loja.com.br.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Fábio Santos Almeida <livre.programacao@.gmail.com>
 */
@Entity
@Table(name = "PROPOSTA")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proposta.findAll", query = "SELECT p FROM Proposta p"),
    @NamedQuery(name = "Proposta.findById", query = "SELECT p FROM Proposta p WHERE p.id = :id"),
    @NamedQuery(name = "Proposta.findByDataCriacao", query = "SELECT p FROM Proposta p WHERE p.dataCriacao = :dataCriacao"),
    @NamedQuery(name = "Proposta.findByTotal", query = "SELECT p FROM Proposta p WHERE p.total = :total")})
public class Proposta implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name = "PROPOSTA_SEQ", schema = "APP", sequenceName = "proposta_seq", initialValue = 2, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROPOSTA_SEQ")
    @Basic(optional = false)
    @Column(name = "ID")
    @NotNull
    private Integer id;

    @JoinColumn(name = "CLIENTE_ID", referencedColumnName = "ID")
    @ManyToOne
    @NotNull
    private Cliente cliente;

    @OneToMany(mappedBy = "proposta")
    private Collection<PropostaProduto> produtos;

    @JoinColumn(name = "PROPOSTA_STATUS_ID", referencedColumnName = "ID")
    @ManyToOne
    @NotNull
    private PropostaStatus status;

    @Column(name = "DATA_CRIACAO")
    @Temporal(TemporalType.DATE)
    @NotNull
    private Date dataCriacao;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "TOTAL")
    @NotNull
    private Double total;

    public Proposta() {
        super();
    }

    public Proposta(Integer id) {
        this();
        this.id = id;
    }

    public Proposta(Integer id, Cliente cliente, Date dataCriacao, Double total, PropostaStatus status) {
        this(id);
        this.cliente = cliente;
        this.dataCriacao = dataCriacao;
        this.total = total;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @XmlTransient
    public Collection<PropostaProduto> getProdutos() {
        return produtos;
    }

    public void setProdutos(Collection<PropostaProduto> produtos) {
        this.produtos = produtos;
    }

    public PropostaStatus getStatus() {
        return status;
    }

    public void setStatus(PropostaStatus status) {
        this.status = status;
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
        if (!(object instanceof Proposta)) {
            return false;
        }
        Proposta other = (Proposta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "loja.com.br.entity.Proposta[ id=" + id + " ]";
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

}

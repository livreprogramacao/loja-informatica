/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loja.com.br.controller;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import loja.com.br.entity.Proposta;

/**
 *
 * @author Fábio Santos Almeida <livre.programacao@.gmail.com>
 */
@Stateless
public class PropostaFacade extends AbstractFacade<Proposta> {
    @PersistenceContext(unitName = "database")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PropostaFacade() {
        super(Proposta.class);
    }

}

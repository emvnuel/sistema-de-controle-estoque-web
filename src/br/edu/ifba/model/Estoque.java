package br.edu.ifba.model;

import java.math.BigDecimal;

public class Estoque {
    
    private Long id;
    private Mercadoria mercadoria;
    private Integer quantidade;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Mercadoria getMercadoria() {
        return mercadoria;
    }
    public void setMercadoria(Mercadoria mercadoria) {
        this.mercadoria = mercadoria;
    }
    public Integer getQuantidade() {
        return quantidade;
    }
    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public BigDecimal getPrecoTotal() {
        return this.mercadoria.getPrecoUnitario().multiply(new BigDecimal(this.quantidade.toString()));
    }

}

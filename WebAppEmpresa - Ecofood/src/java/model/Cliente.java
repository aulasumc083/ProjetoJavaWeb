/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
/**
 *
 * @author alunocmc
 */
public class Cliente {
    // Atrib.
    private int codigo;
    private String nome;
    private Double renda;
    private Date nasc;    
    
    // Métodos
    public Cliente() {
    }
    public Cliente(int p_codigo, String p_nome, Double p_renda, Date p_nasc) {
        this.codigo = p_codigo;
        this.nome = p_nome;
        this.renda = p_renda;
        this.nasc = p_nasc;
    }

    public void setCod(int p_codigo) {
        this.codigo = p_codigo;    
    }
    public void setNome(String parametro_nome) {
        this.nome = parametro_nome;    
    }
    public void setRenda(Double p_renda) {
        this.renda = p_renda;    
    }
    public void setNasc(Date p_nasc) {
        this.nasc = p_nasc;
    }
    public int getCod() {
        return this.codigo;
    }
    public String getNome() {
        return this.nome;
    }
    public Double getRenda() {
        return this.renda;
    }
    public Date getNasc() {
        return this.nasc;
    }   
}

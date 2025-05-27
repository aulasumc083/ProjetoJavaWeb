/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Cliente;
import util.ConectaDB;
import java.sql.*;
import java.text.*;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author alunocmc
 */
public class ClienteDAO {
    // Zero Atrib.
    
    // Métodos - CRUD
    public boolean inserir (Cliente p_cli) throws ClassNotFoundException{
        //Conectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement();
            //String sql = "Insert into cliente (codigo, nome, renda, nasc) values(987654, 'José da Silva', 9500, '1981/03/22')";
            String sql = "Insert into cliente (codigo, nome, renda, nasc) values(" + p_cli.getCod() + ", '" + 
                                                                                     p_cli.getNome() + "', " + 
                                                                                    p_cli.getRenda() + ", '"+ new SimpleDateFormat("yyyy/MM/dd").format(p_cli.getNasc())+"')";
                                                                                            // SimpleDateFormat("dd/MM/yyyy").format(func.getNasc())
            stmt.executeUpdate(sql); // Insert - Update - Delete
            return true;
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }               
    }
    
    //Consultas
    public List consultar_lista_simples() throws ClassNotFoundException, ParseException{
        List lista = new ArrayList();
        //Conectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement(); //Cria uma instrução
            //String sql = "SELECT * FROM cliente";
            String sql = "SELECT * FROM cliente";
            ResultSet rs = stmt.executeQuery(sql); // Select
            
            int n_reg = 0;
            while (rs.next()){
               Cliente cliente = new Cliente();
               cliente.setCod(Integer.parseInt( rs.getString("codigo")));
               cliente.setNome(rs.getString("nome"));
               cliente.setRenda(Double.valueOf(rs.getString("renda") ));
               cliente.setNasc(rs.getDate("nasc"));  
               lista.add(cliente);
               n_reg++;
            }
                
            if (n_reg == 0){
                return null;
            }else{
                return lista;
            }            
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);    
            return null;
        }               
    }

    
    public Cliente consultar_id(Cliente p_cli) throws ClassNotFoundException, ParseException{
        //Conectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement(); //Cria uma instrução
            //String sql = "SELECT * FROM cliente WHERE pk_id = 7";
            String sql = "SELECT * FROM cliente WHERE codigo = " + p_cli.getCod();
            ResultSet rs = stmt.executeQuery(sql); // Select
            
            int n_reg = 0;
            while (rs.next()){
               p_cli.setCod( Integer.parseInt( rs.getString("codigo") ));
               p_cli.setNome(rs.getString("nome") );
               p_cli.setRenda(Double.valueOf(rs.getString("renda") ));
               p_cli.setNasc( rs.getDate("nasc"));
               n_reg++;
            }
                
            if (n_reg == 0){
                return null;
            }else{
                return p_cli;
            }            
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);    
            return null;
        }               
    }
    
    //excluir_id
    public boolean excluir_id(Cliente p_cli) throws ClassNotFoundException{
        //Conectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement();            
            String sql = "DELETE from cliente WHERE codigo = " + p_cli.getCod();          
            stmt.executeUpdate(sql); // Insert - Update - Delete
            return true;
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }               
    }
    
    //alterar
    public boolean alterar(Cliente p_cli) throws ClassNotFoundException{
        //Conectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement();
          //String sql = "UPDATE cliente SET nome='Amanda de Souza', renda= 7500, nasc='2020/04/20' WHERE codigo = 700";
            String sql = "UPDATE cliente SET nome='" + p_cli.getNome() + "', renda= " +p_cli.getRenda()+ ", nasc='" + new SimpleDateFormat("yyyy/MM/dd").format(p_cli.getNasc())+
                                                                          "' WHERE codigo = " + p_cli.getCod();                                                                                                                       
            stmt.executeUpdate(sql); // Insert - Update - Delete
            return true;
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }               
    }

}

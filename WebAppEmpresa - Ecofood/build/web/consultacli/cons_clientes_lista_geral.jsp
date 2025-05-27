<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Clientes</title>
        
        <style>
            table {
                border-collapse: collapse;
                width: 100%                    
            }
            th, td{
                padding: 8px;
                text-align: left;
                border: 1px solid #DDD
            }
            tr:hover {background-color: #D6EEEE }
            
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    </head>
    <body>
        <h2>Empresa XPTO - Controle de Clientes - Consulta - Lista Geral</h2> <br>
        
        <%           
                                    
            ClienteDAO clienteDAO = new ClienteDAO();
            
            List<Cliente> lista = new ArrayList();
            lista = clienteDAO.consultar_lista_simples();
            
            out.println("<br><h3> Consulta cliente Lista geral </h3><br>");
        %>    
            <table class="table table-hover" >                
                <tr bgcolor="#F3F3F3">
                   <th><b>#</b></th> 
                   <th><b>Código</b></th> 
                   <th><b>Nome</b></th> 
                   <th><b>Renda</b></th> 
                   <th><b>Nasciomento</b></th>                   
                   <th><b>Editar?</b></th> 
                   <th><b>Consultar?</b></th> 
                   <th><b>Excluir?</b></th> 
                </tr>            
        <%    
            for (int i=0; i<=lista.size()-1; i++ ){                
        %>
                <tr>
                    <td>  <%=(i+1)%> </td>
                    <td>  <%=lista.get(i).getCod()%> </td>
                    <td>  <%=lista.get(i).getNome()%> </td>
                    <td>  <%=lista.get(i).getRenda()%> </td>
                    <td>  <%=new SimpleDateFormat("dd/MM/yyyy").format(lista.get(i).getNasc())%> </td> 
                    <td> <a href="../alteracli/alt_cons_clientes.jsp?cod=<%=lista.get(i).getCod()%>"> <img src="../imagens/edit.png" alt="" width="24" /> </a> </td> 
                    <td> <a href="../consultacli/cons_clientes.jsp?cod=<%=lista.get(i).getCod()%>"> <img src="../imagens/cons.png" alt="" width="32" /> </a> </td> 
                    <td> <a href="../excluicli/exc_clientes.jsp?cod=<%=lista.get(i).getCod()%>"> <img src="../imagens/del.png" alt="" width="32" /> </a> </td> 
                    
                </tr>
        <%        
            }
        %>
            </table>
            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    </body>
</html>

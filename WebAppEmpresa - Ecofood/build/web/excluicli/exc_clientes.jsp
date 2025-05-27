<%-- 
    Document   : clientes
    Created on : 1 de abr. de 2025, 19:38:11
    Author     : alunocmc
--%>

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">                
    </head>
    <body>
        <h1>Empresa XPTO - Controle de Clientes - Consulta</h1>
        
        <%
            Cliente cli = new Cliente(); // Instância do obj
            // Atrib. valor
            cli.setCod( Integer.parseInt( request.getParameter("cod") ));
                                    
            ClienteDAO clienteDAO = new ClienteDAO();
            
            /*if (clienteDAO.excluir_id(cli) != false){                                     
                out.println("Cliente Excluído com sucesso!");
            }else{
                out.println("Cliente não Localizado!!!");
            }*/
            
            if (clienteDAO.excluir_id(cli)){                                     
                out.println("Cliente Excluído comsucesso!");
            }else{
                out.println("Cliente não Localizado!!!");
            }

        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>        
    </body>
</html>

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
        <h1>Empresa XPTO - Controle de Clientes - Salvar alteração</h1>
        
        <%
            Cliente cli = new Cliente(); // Instância do obj
            // Atrib. valor
            cli.setCod( Integer.parseInt( request.getParameter("cod") ));
            cli.setNome( request.getParameter("nome") );
            cli.setRenda( Double.parseDouble( request.getParameter("renda") ) );            
            //Date dt_nasc = new SimpleDateFormat("yyyy-MM-dd").parse( request.getParameter("nascimento") );            
            cli.setNasc( new SimpleDateFormat("yyyy-MM-dd").parse( request.getParameter("nasc") ) );
            //cli.setNasc( new Date() );
                        
            ClienteDAO clienteDAO = new ClienteDAO();
            
            if (clienteDAO.alterar(cli)){   // se (true/verdadeiro) 
                out.println("Cliente alterado com sucesso!");
            }else{
                out.println("Cliente não alterado!!!");
            }                      
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>                       
    </body>
</html>

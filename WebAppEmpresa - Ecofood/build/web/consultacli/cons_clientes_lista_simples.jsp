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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">        
    </head>
    <body>
        <h1>Empresa XPTO - Controle de Clientes - Consulta - Lista Simples</h1>
        
        <%           
                                    
            ClienteDAO clienteDAO = new ClienteDAO();
            
            List<Cliente> lista = new ArrayList();
            lista = clienteDAO.consultar_lista_simples();
            
            out.println("<br> Consulta cliente Lista simples");
            for (int i=0; i<=lista.size()-1; i++ ){
                out.println("<br><br><b>#:</b> " + (i+1));
                out.println("<br><b>Código............:</b> " + lista.get(i).getCod());
                out.println("<br><b>Nome..............:</b> " + lista.get(i).getNome());
                out.println("<br><b>Renda.............:</b> " + lista.get(i).getRenda());
                out.println("<br><b>Data de Nascimento:</b> " + new SimpleDateFormat("dd/MM/yyyy").format(lista.get(i).getNasc()));                        
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    </body>
</html>

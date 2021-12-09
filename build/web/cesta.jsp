<%@page import="java.util.ArrayList"%>
<%@page import="Beans.CestaBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">             
        <title> Cesta de compras </title>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="Estilos/Estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <header>   
        <%@ include file="Partes/Header.jsp" %>
    </header>
    <body>
        <div class="container">
            <h2 align="center"> Cesta de Compras </h2>
            <table class="table">
                <tr>
                    <th> Código </th>
                    <th> Imagen </th>
                    <th> Nombre </th>
                    <th> Cantidad </th>
                    <th> Precio Unitario </th>
                    <th> Precio Final </th>
                </tr>
                <%
                    
                    double total = 0;
                    ArrayList<CestaBeans> arrayCesta = (ArrayList<CestaBeans>)session.getAttribute("carrito");
                    if(arrayCesta != null){
                        for (CestaBeans cestaBeans : arrayCesta) {
                            Double precioTotal = cestaBeans.getCantidad() * cestaBeans.getPrecioFinal();
                            
                    %>        
                <tr>
                    <td> <%= cestaBeans.getCod() %> </td>
                    <td> <img src="img/Productos/<%= cestaBeans.getImg()%>" style="max-height:2.5rem;"> </td>
                    <td> <%= cestaBeans.getNombre()%> </td>
                    <td> <%= cestaBeans.getCantidad()%> </td>
                    <td> <%= cestaBeans.getPrecioFinal()%> </td>
                    <td> <%= precioTotal%> </td>
                </tr> 
                    
                <%
                    total = total + precioTotal;
                            }                        
                    }
                    %>
                <tr>
                    <td colspan="5" align="right"> Total: </td>
                    <td style="font-weight: bold">  <%= total %> </td>
                </tr>
                
                <tr>
                    <td colspan="6" align="center"> 
                        <a href="cesta.jsp?proceso=venta" class="btn btn-info" style="font-weight: bold"> Realizar Compra </a>                       
                    </td>
                 
                </tr>
            </table>
        </div>
                
        <div class="container p-5">                 
            <%
                String proceso = request.getParameter("proceso");
                if(proceso.equals("venta")){
                %>
            <form class="form-control" action="Servlet">
                <h2 align="center"> Procesar Venta </h2>
                <input type="hidden" name="operacion" value="Comprar">                
                <input type="hidden" name="contador" value="0">
                <table class="table">
                    <tr>
                        <td> Nombres y Apellidos: </td>
                        <td> <input class="form-control" type="text" name="txtDatos"> </td>
                    </tr>
                    <tr>
                        <td> Dni: </td>
                        <td> <input class="form-control" type="number" name="txtDni"> </td>
                    </tr>                    
                    <tr>
                        <td> Dirección: </td>
                        <td> <input class="form-control" type="text" name="txtDir"> </td>
                    </tr>                   
                    <tr>
                        <td> Teléfono: </td>
                        <td> <input class="form-control" type="number" name="txtTel"> </td>
                    </tr> 
                    <tr>
                        <td colspan="2"> <input type="submit" value="Concluir Compra" class="form-control btn btn-primary"> </td>                        
                    </tr> 
                </table>
            </form>
                <%
                }else if(proceso.equals("Detalles")){
                        int contador = Integer.parseInt(request.getParameter("cont"));
                    for (int i = contador; i < arrayCesta.size(); i++) {                           
                            int codV = 1;
                            String producto = arrayCesta.get(i).getCod();
                            int cantidad = arrayCesta.get(i).getCantidad(); 
                            contador = contador + 1;
                    %>
                    
                            <script>
                                window.onload=function(){
                                    document.forms["formularioDetalles"].submit();
                                }                
                            </script>

                            <form class="form-control" action="Servlet" name="formularioDetalles">
                                <input type="hidden" name="operacion" value="Detalles">
                                <input type="hidden" name="codVenta" value="<%= codV %>">
                                <input type="hidden" name="codProducto" value="<%= producto %>">
                                <input type="hidden" name="cant" value="<%= cantidad %>">
                                <input type="hidden" name="cont" value="<%= contador %>">
                            </form>
                    
                <%                                                      
                        } 
                    if(contador == arrayCesta.size()){
                    %>
                  
                    <script>
                                window.onload=function(){
                                    document.forms["formularioDetalles"].submit();
                                }                
                            </script>

                            <form class="form-control" action="cesta.jsp" name="formularioDetalles">
                                <input type="hidden" name="proceso" value="Concluido">
                            </form>
                    
                <%
                    }
                }else if(proceso.equals("Concluido")){
                    session.invalidate();
                %>                
                <div class="container p-5"> Gracias por realizar su compra </div>
                <p> <a href="index.jsp" class="btn btn-primary"> Continuar </a> </p>                
            <%   
                }
                %>
        </div>
        
    </body>
</html>

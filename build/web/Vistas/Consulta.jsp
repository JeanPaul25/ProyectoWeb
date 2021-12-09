<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Beans.ProductosBeans"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="Estilos/Estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <header>            
            <%@ include file="../Partes/Header.jsp" %>            
        </header>
            
        
        <main>

            <div class="container">
                                
                <% 
                    String opc = request.getParameter("opcion");
                    
                    ArrayList<ProductosBeans> lista = (ArrayList<ProductosBeans>)request.getAttribute("lista"); 
                                        
                    if(opc.equals("Bebes")){
                        opc = "Bebés";
                    }else if(opc.equals("Ninos")){
                        opc = "Niños";
                    }else if(opc.equals("Ninas")){
                        opc = "Niñas";
                    }
                    
                        %>                        
                        
                    <h2 class="p-4" align="center"> Productos: <%= opc %> </h2> 
                    
                    <div class="row">
                <%
                    for(int i = 0; i < lista.size(); i++){
                        
                        ProductosBeans prod = lista.get(i);
                        Double precioFinal = prod.getPrecio() - prod.getDesc();
                        %>
                    
                        
                        <div class="col p-4" align="center">
                            <div class="card h-100" style="width: 20rem;">
                                <img src="img/Productos/<%=prod.getImagen()%>" class="card-img-top" style="max-height:12.5rem;" alt="...">
                                <div class="card-body h-100">
                                    <p style="text-align: center"> <%= prod.getNom() %> </p> 
                                    <hr>
                                    <form action="Servlet">
                                        <input type="hidden" name="operacion" value="AgregarCarrito">
                                        <input type="hidden" name="cod" value="<%= prod.getCod()%>">
                                        <input type="hidden" name="img" value="<%= prod.getImagen()%>">
                                        <input type="hidden" name="nom" value="<%= prod.getNom()%>">
                                        <input type="hidden" name="precio" value="<%= prod.getPrecio()%>">
                                        <input type="hidden" name="desc" value="<%= prod.getDesc()%>">
                                        <input type="submit" value="Agregar Producto" class="btn btn-info">                     
                                    </form>
                                    <p class="card-text"> <%= prod.getDescrp() %> </p>
                                    <p> Marca: <%= prod.getMarca() %> </p>
                                    <p> Categoría <%= prod.getCategoria() %> </p>
                                    <p align="center"> Precio: <%= prod.getPrecio() %> </p>
                                    <p align="center"> Descuento: <%= prod.getDesc() %> </p>                                    
                                    <p align="center" style="font-weight: bold"> Precio Final: <%= precioFinal %> </p>
                                </div>
                            </div>
                        </div>   
                   
                <%
                    }
                        %>
                
                    </div>
                
                
            </div> 
            
        </main>
        
            
        <footer>  
            <%@ include file="../Partes/Footer.jsp" %>
        </footer>
        
        
    </body>
</html>

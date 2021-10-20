<%@page import="java.util.ArrayList"%>
<%@page import="Beans.ProductosBeans"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Dashboard </title>
        
        <%@include file="Partes/Bootstrap.jsp" %> 
        
        <link rel="stylesheet" href="Estilos/Dashboard.css">     
        
    </head>
    
    <body>      
        
        <main>    
            <div class="container-fluid">
                <div class="row">
                    <div class="sidebar-container col-2 bg-primary p-4">     
                            
                        <h3 class="text-light"> Productos </h3>

                            <div class="container p-4">
                                <a href="Dashboard.jsp?boton=Agregar"> <button type="button" class="btn btn-info"> Agregar </button> </a>                                
                            </div>

                            <div class="container p-4"> 
                                <a href="Servlet?operacion=Mostrar"> <button type="button" class="btn btn-info"> Mostrar </button> </a>
                            </div>


                        <h3 class="text-light"> Clientes </h3>

                            <div class="container p-4"> 
                                <a href="#"> <button type="button" class="btn btn-info" disabled> Mostrar </button> </a>
                            </div>


                        <h3 class="text-light"> Trabajadores </h3>

                            <div class="container p-4"> 
                                <a href="#"> <button type="button" class="btn btn-info" disabled> Agregar </button> </a>
                            </div>

                            <div class="container p-4"> 
                                <a href="#"> <button type="button" class="btn btn-info" disabled> Mostrar </button> </a>
                            </div>

                        <h3 class="text-light"> Ventas </h3>

                            <div class="container p-4">
                                <a href="#"> <button type="button" class="btn btn-info" disabled> En Proceso </button> </a>                                
                            </div>

                    </div>
                    
                    <div class="col-10 border">
                        
                         
                        <h1 align="center"> <a href="Dashboard.jsp" style="text-decoration: none; color:#00AAE4"> Dashboard </a> </h1>
                        
                    <%                            
                        String btn = request.getParameter("boton");
                                              
                        try{
                            if(btn == null){
                        %>
                        
                        <div class="row p-4">
                            <div class="p-4">
                                <img src="img/LittleLions.png" alt="alt" style="height: 5rem"/>
                            </div>
                            <div class="text-center">
                                <div>   
                                    <h3> Bienvenido Usuario: Cod </h3>                                
                                </div>                               
                            </div>
                            
                        </div>
                        
                    <%
                                
                            }else if(btn.equals("Agregar")){                            
                        %>
                           
                            <div class="container">
                                <div class="row p-4">  

                                    <h2 align="center"> Agregar Productos </h2>

                                    <form action="Servlet" class="form-control" enctype="multipart/form-data">
                                        
                                        <input type="hidden" name="operacion" value="Agregar">
                                        
                                        <input type="hidden" name="opcion" value="Producto">
                                        
                                        <table class="table">

                                            <tr>
                                                <td> Nombre: </td>
                                                <td> <input class="form-control" type="text" name="txtNom"> </td>
                                            </tr>

                                            <tr>
                                                <td> Descripción: </td>
                                                <td> <input class="form-control" type="text" name="txtDescrp"> </td>
                                            </tr>

                                            <tr>
                                                <td> Marca: </td>
                                                <td> 
                                                    <select class="form-select" name="slcMarca">
                                                        <option selected> Seleccione la marca del producto </option>
                                                        <option value=1> Bestway </option>
                                                        <option value=2> Step 2 </option>
                                                    </select>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td> Categoría </td>
                                                <td> 
                                                    <select class="form-select" name="slcCategoria">
                                                            <option selected> Seleccione la categoría del producto </option>
                                                            <option value=1> Bebés </option>
                                                            <option value=2> Niñas </option>
                                                            <option value=3> Niños </option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> Stock: </td>
                                                <td> <input class="form-control" type="number" min="0" name="numStock"> </td>
                                            </tr>

                                            <tr>
                                                <td> Precio: </td>
                                                <td> <input class="form-control" type="number" step="0.01" min="0" name="numPrecio"> </td>
                                            </tr>

                                            

                                            <tr>
                                                <td> Descuento: </td>
                                                <td> <input class="form-control" type="number" step="0.01" min="0" value="0" name="numDesc"> </td>
                                            </tr>
                                            
                                            <tr>
                                                <td> Imagen: </td>
                                                <td> <input class="form-file" type="file" name="fileImagen"> </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2"> <input type="submit" value="Agregar Producto" class="form-control btn btn-primary"> </td>                        
                                            </tr> 
                                        </table>

                                    </form>

                                </div>
                            </div>
                                    
                                    
                    <%
                            }else if(btn.equals("Mostrar")){

                                ArrayList<ProductosBeans> lista = (ArrayList<ProductosBeans>)request.getAttribute("lista");
                        %>
                        
                                    <table class="table" style="text-align: center">
                                        <tr> 
                                            <th> Código </th>
                                            <th> Nombre </th>
                                            <th> Descripción </th>
                                            <th> Marca </th>
                                            <th> Categoria </th>
                                            <th> Stock </th>
                                            <th> Precio </th>
                                            <th> Descuento </th>
                                            <th> Precio Final </th>
                                            <th> EDITAR </th>
                                            <th> ELIMINAR </th>
                                        </tr>
                            
                    <%
                                for(int i = 0; i < lista.size(); i++){

                                    ProductosBeans prod = lista.get(i);
                        %>                                  
                                        <tr>
                                            <td> <%= prod.getCod() %> </td>
                                            <td> <%= prod.getNom() %> </td>
                                            <td> <%= prod.getDescrp() %> </td>
                                            <td> <%= prod.getMarca() %> </td>
                                            <td> <%= prod.getCategoria() %> </td>
                                            <td> <%= prod.getStock() %> </td>
                                            <td> <%= prod.getPrecio() %> </td>
                                            <td> <%= prod.getDesc() %> </td>
                                            <td> <%= prod.getPrecio() - prod.getDesc() %> </td>
                                            <td>                                                
                                                <a href="Servlet?operacion=Consultar&opcion=codigo&cod=<%= prod.getCod() %>"> 
                                                    <i class='bx bxs-pencil bx-sm bx-tada-hover' style='color:#32af3e'  ></i>                               
                                                </a>
                                            </td>                                            
                                            <td> 
                                                <a href="Servlet?operacion=Eliminar&cod=<%= prod.getCod() %>">
                                                    <i class='bx bxs-trash bx-sm bx-flashing-hover' style='color:#7b0000'  ></i>
                                                </a>
                                            </td>
                                        </tr>                                    
                    <%
                                }                                                
                        %>
                        
                                    </table>
                        
                    <%
                            }else if(btn.equals("Editar")){     
                                
                                ArrayList<ProductosBeans> lista = (ArrayList<ProductosBeans>)request.getAttribute("lista");
                
                                for(int i = 0; i < lista.size(); i++){
                                    ProductosBeans prod = lista.get(i);
                                                           
                        %>
                        
                                <div class="container">
                                <div class="row p-4">  

                                    <h2 align="center"> Editar Producto: <%= prod.getCod() %> </h2>

                                    <form action="Servlet" class="form-control">
                                        
                                        <input type="hidden" name="operacion" value="Editar">
                                        
                                        <input type="hidden" name="opcion" value="Producto">
                                        
                                        <input type="hidden" name="txtCod" value="<%= prod.getCod() %>">
                                        
                                        <table class="table">

                                            <tr>
                                                <td> Nombre: </td>
                                                <td> <input class="form-control" type="text" name="txtNom" value="<%= prod.getNom() %>"> </td>
                                            </tr>

                                            <tr>
                                                <td> Descripción: </td>
                                                <td> <input class="form-control" type="text" name="txtDescrp" value="<%= prod.getDescrp() %>"> </td>
                                            </tr>

                                            <tr>
                                                <td> Marca: </td>
                                                <td> 
                                                    <select class="form-select" name="slcMarca">
                                                        <% 
                                                            if(prod.getMarca().equals("Bestway")){                                                                
                                                            %>
                                                                <option disabled hidden> Seleccione la categoría del producto </option>
                                                                <option value=1 selected> Bestway </option>
                                                                <option value=2> Step2 </option>
                                                        <%
                                                            }else if(prod.getMarca().equals("Step2")){
                                                            %>
                                                                <option disabled hidden> Seleccione la categoría del producto </option>
                                                                <option value=1> Bestway </option>
                                                                <option value=2 selected> Step2 </option>
                                                        <%   
                                                            }
                                                            %>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> Stock: </td>
                                                <td> <input class="form-control" type="number" min="0" name="numStock" value=<%= prod.getStock() %>> </td>
                                            </tr>

                                            <tr>
                                                <td> Precio: </td>
                                                <td> <input class="form-control" type="number" step="0.01" min="0" name="numPrecio" value=<%= prod.getPrecio() %>> </td>
                                            </tr>

                                            <tr>
                                                <td> Categoría </td>
                                                <td> 
                                                    <select class="form-select" name="slcCategoria">
                                                        <% 
                                                            if(prod.getCategoria().equals("Bebés")){                                                                
                                                            %>
                                                                <option disabled hidden> Seleccione la categoría del producto </option>
                                                                <option value=1 selected> Bebés </option>
                                                                <option value=2> Niñas </option>
                                                                <option value=3> Niños </option>
                                                        <%
                                                            }else if(prod.getCategoria().equals("Niñas")){
                                                            %>
                                                                <option disabled hidden> Seleccione la categoría del producto </option>
                                                                <option value=1> Bebés </option>
                                                                <option value=2 selected> Niñas </option>
                                                                <option value=3> Niños </option>
                                                        <%   
                                                            }else if(prod.getCategoria().equals("Niños")){
                                                            %>
                                                                <option disabled hidden> Seleccione la categoría del producto </option>
                                                                <option value=1> Bebés </option>
                                                                <option value=2> Niñas </option>
                                                                <option value=3 selected> Niños </option>
                                                        <%   
                                                            }
                                                            %>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> Descuento: </td>
                                                <td> <input class="form-control" type="number" step="0.01" min="0" name="numDesc" value=<%= prod.getDesc() %>> </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2"> <input type="submit" value="Editar Producto" class="form-control btn btn-primary"> </td>                        
                                            </tr> 
                                        </table>

                                    </form>

                                </div>

                            </div>
                        
                        <%    
                                }
                            }
                        }catch(Exception e){
                            System.out.println("Error:" + e);
                        }
                        %>
                        
                    </div>
                    
                </div>
                
                
            </div>
            
            
        </main>
        
    </body>
</html>

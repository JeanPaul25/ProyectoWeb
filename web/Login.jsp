<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
        
         <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container">    
            <h1 align="center"> Ingreso </h1>
            
            <%                            
                String btn = request.getParameter("boton");                
                try {   
                    if(btn.equals("Inicio")){                                   
                %>
            
            <h2 class="text-light"> Seleccione una opción </h2>

                <div class="container p-4">
                    <a href="Login.jsp?boton=Ingresar"> <button type="button" class="btn btn-info"> Ingresar </button> </a>                                
                </div>

                <div class="container p-4"> 
                    <a href="Login.jsp?boton=Registrar"> <button type="button" class="btn btn-info"> Registrar </button> </a>
                </div>
            
            <%
                    }else if(btn.equals("Ingresar")){
                %>
            
            
            <form class="form-control" action="Servlet?operacion=Login"> 
                <table class="table">
                    <tr>
                        <td> Correo: </td>
                        <td> <input class="form-control" type="text" name="txtCorreo"> </td>
                    </tr>

                    <tr>
                        <td> Contraseña: </td>
                        <td> <input class="form-control" type="text" name="txtContraseña"> </td>
                    </tr>

                    <tr>
                        <td colspan="2"> <input type="submit" value="Ingresar" class="form-control btn btn-primary"> </td>                        
                    </tr>  
                </table>
            </form>
                
            <%
                    }else if(btn.equals("Registrar")){
                %>  
                
            <form class="form-control" action="Servlet?operacion=Registrar"> 
                <table class="table">
                    <tr>
                        <td> Nombres: </td>
                        <td> <input class="form-control" type="text" name="txtUsuario"> </td>
                    </tr>

                    <tr>
                        <td> Apellidos: </td>
                        <td> <input class="form-control" type="text" name="txtUsuario"> </td>
                    </tr>
                    
                    <tr>
                        <td> Correo: </td>
                        <td> <input class="form-control" type="text" name="txtUsuario"> </td>
                    </tr>
                    
                    <tr>
                        <td> Telefono: </td>
                        <td> <input class="form-control" type="text" name="txtUsuario"> </td>
                    </tr>
                    
                    <tr>
                        <td> Direccion: </td>
                        <td> <input class="form-control" type="text" name="txtUsuario"> </td>
                    </tr>
                    
                    <tr>
                        <td> Contraseña: </td>
                        <td> <input class="form-control" type="password" name="txtContraseña"> </td>
                    </tr>

                    <tr>
                        <td colspan="2"> <input type="submit" value="Ingresar" class="form-control btn btn-primary"> </td>                        
                    </tr>  
                </table>
            </form>
        </div>
        
        <%
                }
            } catch (Exception e) {
                System.out.println("Error Login: " + e);
            }
            
            %>
        
    </body>
</html>

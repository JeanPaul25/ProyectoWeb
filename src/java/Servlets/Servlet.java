package Servlets;

import Beans.*;
import Utils.*;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"})
//@MultipartConfig 
public class Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String ope = request.getParameter("operacion");
                
        String opc = request.getParameter("opcion");
        
        System.out.println("Conexión Servlet: " + ope + opc);
        
        
        if(ope.equals("Consultar")){
                        
            if(opc.equals("Generales")){
                                
                try{
                    
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from Productos");
                                           
                    ResultSet rs = psta.executeQuery();

                    ArrayList<ProductosBeans> lista = new ArrayList<>();                    
                        
                    while(rs.next()){       
                        ProductosBeans pro = new ProductosBeans(rs.getString(1),
                                rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), 
                                rs.getDouble(7), rs.getDouble(8), rs.getString(9));
                        System.out.println(pro.getCategoria());
                        lista.add(pro);
                    }

                    request.setAttribute("lista", lista);               

                    ConexionDB.getConexion().close();

                    request.getRequestDispatcher("Vistas/Consulta.jsp").forward(request, response);

                }catch(Exception e){
                    System.out.println("Error: " + e);
                }
                
            }else if(opc.equals("Bestway") || opc.equals("Step2")){
                
                try{
                    
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from Productos where marca = ?");
                                           
                    psta.setString(1, opc);
                    
                    ResultSet rs = psta.executeQuery();

                    ArrayList<ProductosBeans> lista = new ArrayList<>();

                    while(rs.next()){
                        ProductosBeans pro = new ProductosBeans(rs.getString(1),
                                rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), 
                                rs.getDouble(7), rs.getDouble(8), rs.getString(9));

                        lista.add(pro);
                    }

                    request.setAttribute("lista", lista);               

                    ConexionDB.getConexion().close();

                    request.getRequestDispatcher("Vistas/Consulta.jsp").forward(request, response);

                }catch(Exception e){
                    System.out.println("Error: " + e);
                }
                
            }else if(opc.equals("Bebes") || opc.equals("Ninos") || opc.equals("Ninas")){
                                
                try{
                    
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from Productos where categoria = ?");
                                           
                    psta.setString(1, opc);
                    
                    ResultSet rs = psta.executeQuery();
                    
                    ArrayList<ProductosBeans> lista = new ArrayList<>();
                    
                    while(rs.next()){
                        ProductosBeans pro = new ProductosBeans(rs.getString(1),
                                rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), 
                                rs.getDouble(7), rs.getDouble(8), rs.getString(9));

                        lista.add(pro);
                    }

                    request.setAttribute("lista", lista);               

                    ConexionDB.getConexion().close();

                    request.getRequestDispatcher("Vistas/Consulta.jsp").forward(request, response);

                }catch(Exception e){
                    System.out.println("Error: " + e);                
                }
            }else if(opc.equals("codigo")){
                
                
                String cod = request.getParameter("cod");        
                System.out.println("ConsultaR" + cod);        
                
                try{
                    
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from Productos where codProducto = ?");
                                           
                    psta.setString(1, cod);
                    
                    ResultSet rs = psta.executeQuery();
                    
                    ArrayList<ProductosBeans> lista = new ArrayList<>();
                    
                    while(rs.next()){
                        ProductosBeans pro = new ProductosBeans(rs.getString(1),
                                rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), 
                                rs.getDouble(7), rs.getDouble(8), rs.getString(9));

                        lista.add(pro);
                    }

                    request.setAttribute("lista", lista);               

                    ConexionDB.getConexion().close();

                    request.getRequestDispatcher("Dashboard.jsp?boton=Editar").forward(request, response);  
                    
                }catch(Exception e){
                    System.out.println("Error: " + e);                
                }
                
                
            }else if(opc.equals("Ventas")){             
                ArrayList<VentaBeans> arrayVentas = new ArrayList();
                ArrayList<CestaBeans> arrayCesta = new ArrayList();
                try {
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from venta");
                    
                    ResultSet rs = psta.executeQuery();
                    
                    
                    while(rs.next()){
                        VentaBeans venta = new VentaBeans(rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5));
                        arrayVentas.add(venta);
                        
                        System.out.println("DatosB: " + rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + " " + rs.getString(4) + " " + rs.getInt(5));
                      
                        PreparedStatement psta2 = ConexionDB.getConexion().prepareStatement("select codProducto, cant from detalleventas where codVenta = ?");
                        psta2.setInt(1, rs.getInt(1));
                        System.out.println("Datos: " + rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + " " + rs.getString(4) + " " + rs.getInt(5));
                        ResultSet rs2 = psta2.executeQuery();                       
                        
                        while(rs2.next()){               
                            System.out.println("Datos 2: " + rs2.getString(1) + " --- " + rs2.getInt(2));                                         
                            CestaBeans cesta = new CestaBeans(rs2.getString(1), rs2.getInt(2));
                            arrayCesta.add(cesta);
                        }
                    }                   
                    
                    
                    request.setAttribute("arrayVentas", arrayVentas); 
                    request.setAttribute("arrayCesta", arrayCesta);

                    ConexionDB.getConexion().close();
                    
                    arrayVentas = new ArrayList();
                    arrayCesta = new ArrayList();
                    
                    request.getRequestDispatcher("Dashboard.jsp?boton=MostrarV").forward(request, response);  
                } catch (Exception e) {
                    System.out.println("Error Mostrar Ventas: " + e);
                }
            }
        }else if(ope.equals("Agregar")){
            
            if(opc.equals("Producto")){
                
                System.out.println("Conexión Opcion");
                
                try{                        
                    String cod = request.getParameter("txtCod");
                    String nom = request.getParameter("txtNom");
                    String descrp = request.getParameter("txtDescrp");
                    int marca = Integer.parseInt(request.getParameter("slcMarca"));
                    int stock = Integer.parseInt(request.getParameter("numStock"));
                    double precio = Double.parseDouble(request.getParameter("numPrecio"));
                    int categoria = Integer.parseInt(request.getParameter("slcCategoria"));
                    Double desc = Double.parseDouble(request.getParameter("numDesc"));
                    String img = request.getParameter("txtImagen");
                    String marcaR, categoriaR;
                    
                    if(marca == 1){
                        marcaR = "Bestway";
                    }else{
                        marcaR = "Step2";
                    }

                    if(categoria == 1){
                        categoriaR = "Bebés";
                    }else if(categoria == 2){
                        categoriaR = "Niñas";
                    }else{
                        categoriaR = "Niños";
                    }
                        
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("insert into Productos values(?,?,?,?,?,?,?,?,?)");
                    
                    psta.setString(1, cod);
                    psta.setString(2, nom); 
                    psta.setString(3, descrp); 
                    psta.setString(4, marcaR); 
                    psta.setString(5, categoriaR);
                    psta.setInt(6, stock);
                    psta.setDouble(7, precio);
                    psta.setDouble(8, desc);
                    psta.setString(9, img);

                    psta.executeUpdate();

                    ConexionDB.getConexion().close();

                    request.getRequestDispatcher("Servlet?operacion=Mostrar").forward(request, response);                        
                        
                }catch(Exception e){
                    System.out.println("Error: " + e);
                }  
            }
            
        }else if(ope.equals("Mostrar")){
            
            try{
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from Productos");
                
                ResultSet rs = psta.executeQuery();
                
                ArrayList<ProductosBeans> lista = new ArrayList<>();
                
                while(rs.next()){
                    
                    ProductosBeans prod = new ProductosBeans(rs.getString(1),
                                rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), 
                                rs.getDouble(7), rs.getDouble(8), rs.getString(9));
                    
                    lista.add(prod);
                }
                
                request.setAttribute("lista", lista);               
                
                ConexionDB.getConexion().close();
                
                request.getRequestDispatcher("Dashboard.jsp?boton=Mostrar").forward(request, response);
                
            }catch(Exception e){
                System.out.println("Error: " + e);
            }
            
        }else if(ope.equals("Editar")){
            
            try{
                
                System.out.println("Ingreso Editar");                                               
                                
                String nom = request.getParameter("txtNom");
                String descrp = request.getParameter("txtDescrp");
                int marca = Integer.parseInt(request.getParameter("slcMarca"));
                int stock = Integer.parseInt(request.getParameter("numStock"));
                double precio = Double.parseDouble(request.getParameter("numPrecio"));
                int categoria = Integer.parseInt(request.getParameter("slcCategoria"));
                Double desc = Double.parseDouble(request.getParameter("numDesc"));
                
                String marcaR, categoriaR;

                if(marca == 1){
                    marcaR = "Bestway";
                }else{
                    marcaR = "Step2";
                }

                if(categoria == 1){
                    categoriaR = "Bebés";
                }else if(categoria == 2){
                    categoriaR = "Niñas";
                }else{
                    categoriaR = "Niños";
                }

                 PreparedStatement psta = ConexionDB.getConexion().prepareStatement("update Productos set Nombre=?,"
                    + "Descripcion=?, Marca=?, Categoria=?, Stock=?, Precio=?, Descuento=? where codProducto=?");

                psta.setString(1, nom); 
                psta.setString(2, descrp); 
                psta.setString(3, marcaR); 
                psta.setString(4, categoriaR);
                psta.setInt(5, stock);
                psta.setDouble(6, precio);
                psta.setDouble(7, desc); 
                psta.setString(8, request.getParameter("txtCod"));
                
                psta.executeUpdate();
                
                ConexionDB.getConexion().close();
                
                request.getRequestDispatcher("Servlet?operacion=Mostrar").forward(request, response);
                
            }catch(Exception e){
                System.out.println("Error: " + e);
            }
            
            
        }else if(ope.equals("Eliminar")){
            
            System.out.println("Eliminar");
            
            String cod = request.getParameter("cod");
            
            try{
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("delete from Productos where codProducto = ?");    
                
                psta.setString(1, cod);

                psta.executeUpdate();
                
                ConexionDB.getConexion().close();
                
                request.getRequestDispatcher("Servlet?operacion=Mostrar").forward(request, response);
                
            }catch(Exception e){
                System.out.println("Error: " + e);
            }            
        }else if(ope.equals("Login")){
            System.out.println("Login");
            
            String correo = request.getParameter("txtCorreo");
            String contraseña = request.getParameter("txtContraseña");
            
            try {
                
                ResultSet usuario = null;
                String respuesta = null;
                String[] correoS = correo.split("-");
                if(correoS[1].equals("Emp")){
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from empleados where correo=? and contraseña=?");    
                    
                    psta.setString(1, correo);
                    psta.setString(2, contraseña);
                    
                    usuario = psta.executeQuery();
                }else{
                    PreparedStatement psta = ConexionDB.getConexion().prepareStatement("select * from clientes where correo=? and contraseña=?");    
                    
                    psta.setString(1, correo);
                    psta.setString(2, contraseña);

                    psta.executeQuery();
                }
                
                if(usuario != null){
                    respuesta = "Bienvenido Usuario";
                }else{
                    respuesta = "Correo o Contraseña Incorrecta";
                }
                    
                ConexionDB.getConexion().close();
                               
                
                request.getRequestDispatcher("Servlet?operacion=Mostrar").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error Login: " + e);
            }
        }else if(ope.equals("AgregarCarrito")){
            
            HttpSession sesion = request.getSession();
            ArrayList<CestaBeans> carrito;
            
            if(sesion.getAttribute("carrito") == null){
                carrito = new ArrayList();
            }else{
                carrito = (ArrayList<CestaBeans>)sesion.getAttribute("carrito");
            }
            String cod = request.getParameter("cod");
            String img = request.getParameter("img");
            String nom = request.getParameter("nom");
            Double precio = Double.parseDouble(request.getParameter("precio"));
            Double desc = Double.parseDouble(request.getParameter("desc"));
            Double precioFinal = precio - desc;
            
            int indice = -1;
            int cant = 0;
            
            for (int i = 0; i < carrito.size(); i++) {
                CestaBeans cesta1 = carrito.get(i);
                if(cesta1.getCod().equals(cod)){
                    indice = i;
                    cant = cesta1.getCantidad();
                    break;
                }                
            }
            if(indice == -1){
                CestaBeans cesta2 = new CestaBeans(cod, img, nom, precio, desc, precioFinal, 1); 
                carrito.add(cesta2);
            }else{
                int cant2 = cant + 1;
                CestaBeans cesta3 = new CestaBeans(cod, img, nom, precio, desc, precioFinal, cant2); 
                carrito.set(indice, cesta3);
            }
            
            sesion.setAttribute("carrito", carrito);
            response.sendRedirect("cesta.jsp?proceso=");
        }else if(ope.equals("Comprar")){
            System.out.println("Comprar");
            String apel = request.getParameter("txtDatos");
            int dni = Integer.parseInt(request.getParameter("txtDni"));
            String dir = request.getParameter("txtDir");
            int tel = Integer.parseInt(request.getParameter("txtTel"));
            
            try {                
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("insert into venta values(?,?,?,?,?)");    

                psta.setString(1, null);
                psta.setString(2, apel);
                psta.setInt(3, dni);
                psta.setString(4, dir);
                psta.setInt(5, tel);

                psta.executeUpdate();
                
                ConexionDB.getConexion().close();
                
                request.getRequestDispatcher("cesta.jsp?proceso=Detalles&cont=0").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error Venta: " + e);
            }
        }else if(ope.equals("Detalles")){
            int cont = 0;
            try {                
                PreparedStatement pstaC = ConexionDB.getConexion().prepareStatement("select codVenta from venta");
                ResultSet ventaA = pstaC.executeQuery();
              
                while(ventaA.next()){
                    cont = ventaA.getInt(1);
                }
                System.out.println("Contar:" + cont);
                
                ConexionDB.getConexion().close();
            } catch (Exception e) {
                System.out.println("Error Contar: " + e);
            }
            
            String pro = request.getParameter("codProducto");
            int cant = Integer.parseInt(request.getParameter("cant"));
            String estado = request.getParameter("estado");
            
            int contador = Integer.parseInt(request.getParameter("cont"));
            
            try {                
                PreparedStatement psta = ConexionDB.getConexion().prepareStatement("insert into detalleVentas values(?,?,?,?)");    

                psta.setString(1, null);
                psta.setInt(2, cont);
                psta.setString(3, pro);
                psta.setInt(4, cant);

                psta.executeUpdate();
                
                ConexionDB.getConexion().close();
                
                request.getRequestDispatcher("cesta.jsp?proceso=Detalles&cont=<%= contador %>").forward(request, response);
                
                
            } catch (Exception e) {
                System.out.println("Error Venta: " + e);
            }
        }
    }
    
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

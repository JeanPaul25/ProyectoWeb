<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>

<%
       String img="";
    try{
   /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
		
	/*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
	/*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
     
        for(int i=0;i<items.size();i++){
	/*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(0);
        /*item.isFormField() false=input file; true=text field*/
            if (!item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("F:\\2021 - 2\\Desarrollo Web Integrado\\Proyecto\\ProyectoWeb\\web\\img\\Productos\\"+item.getName());
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                img=item.getName();
            }
        }
    }catch(Exception e){
        System.out.println("Error: "+e);
    }   
        
        
%>

<jsp:forward page="Dashboard.jsp?boton=Agregar">
    <jsp:param name="img" value="<%=img%>"></jsp:param>
</jsp:forward>

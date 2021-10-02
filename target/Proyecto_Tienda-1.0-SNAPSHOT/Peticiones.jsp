<%-- 
    Document   : Peticiones
    Created on : 28/09/2021, 8:31:14 p. m.
    Author     : GIGABYTE
--%>

// importar las librerías

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Lógica.Producto"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType= "application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>


<% //Iniciar la respuesta Json
    Producto p1= new Producto();
    String respuesta = "{";
    
//Listar las tareas o los procesos a realizar

    List<String> tareas = Arrays.asList(new String[] {
        "actualizarProducto",
        "borrarProducto",
        "listarProductos",
        "guardarProducto",
        });
        
    String proceso = "" + request.getParameter("proceso");
    
// validación de parámetros utilizados en cada uno de los procesos
    if (tareas.contains(proceso)){
    respuesta += "\"ok\": true,";
    
    //Iniciar los respectivos procesos
    if (proceso.equals("guardarProducto")){
     String Nombre_Producto = request.getParameter("Nombre_producto");
     int Precio = Integer.parseInt(request.getParameter("Precio"));
     int Codigo_producto = Integer.parseInt(request.getParameter("Codigo_producto"));
     String Fecha_vencimiento = request.getParameter("Fecha_vencimiento");
     int Cantidad = Integer.parseInt(request.getParameter("Cantidad"));
     String Tipo = request.getParameter("Tipo");
     String Proveedor = request.getParameter("Proveedor");
    
     Producto p= new Producto();
     p.setNombre_Producto(Nombre_Producto);
     p.setPrecio(Precio);
     p.setCodigo_producto(Codigo_producto);
     p.setFecha_vencimiento(Fecha_vencimiento);
     p.setCantidad(Cantidad);
     p.setTipo(Tipo);
     p.setProveedor(Proveedor);
     if(p.guardarProducto()){
       respuesta += "\"ok\": true,";
    }
     else
       respuesta += "\"ok\": false,";
    
    }
    else if (proceso.equals("borrarProducto")){
     Producto p= new Producto();
     int Codigo_producto= Integer.parseInt(request.getParameter("Codigo_producto"));
     if (p.borrarProducto(Codigo_producto)){
           respuesta += "\"" +proceso+ "\": true";
    } 
        else {
           respuesta += "\"" +proceso+ "\": false";
    }
    
    }
    else if (proceso.equals("listarProductos")){
     Producto p= new Producto();
     try { 
        
             List <Producto> Lista = p.listarProductos();
             respuesta += "\"" +proceso+ "\": true,\"Producto\":" + new Gson().toJson(Lista);
    }catch(SQLException e ){
             respuesta += "\"" +proceso+ "\": true,\"Producto\":[]";
             Logger.getLogger(Producto.class.getName()).log(Level.SEVERE,null,e);
    }
        
             
    }
    
    else if (proceso.equals("actualizarProducto")){
        int Codigo_producto= Integer.parseInt(request.getParameter("Codigo_producto"));
        String Nombre_Producto = request.getParameter("Nombre_producto");
        int Precio = Integer.parseInt(request.getParameter("Precio"));
        String Fecha_vencimiento = request.getParameter("Fecha_vencimiento");
        int Cantidad = Integer.parseInt(request.getParameter("Cantidad"));
        String Tipo = request.getParameter("Tipo");
        String Proveedor = request.getParameter("Proveedor");
        
        Producto p= new Producto();
        p.setNombre_Producto(Nombre_Producto);
        p.setPrecio(Precio);
        p.setCodigo_producto(Codigo_producto);
        p.setFecha_vencimiento(Fecha_vencimiento);
        p.setCantidad(Cantidad);
        p.setTipo(Tipo);
        p.setProveedor(Proveedor);
        if(p.actualizarProducto(Codigo_producto)){
            respuesta += "\"" +proceso+ "\": true";
    }
        else{
            respuesta += "\"" +proceso+ "\": false";
    
    }  
    // FIN DE PROCESOS 
    
    }
    
    else{
     respuesta += "\"ok\": false,";
     respuesta += "\"error\": \"INVALID\",";
     respuesta += "\"error_msg\": \"Lo sentimos, "+ "son inválidos, inténtalo de nuevo\"";
     
    
    }
    
  
    respuesta += "}"; 
    response.setContentType("application/Json;charset=iso-8859-1;");
    out.print(respuesta);
    %>
    
    
   
  
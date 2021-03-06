/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lógica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Persistencia.ConexionDB;

/**
 *
 * @author GIGABYTE
 */
public class Producto {

    private String Nombre_Producto;
    private int Precio;
    private int Codigo_producto;
    private String Fecha_vencimiento;
    private int Cantidad;
    private String Tipo;
    private String Proveedor;
    public Producto() {
    }



    public String getNombre_Producto() {
        return Nombre_Producto;
    }

    public void setNombre_Producto(String Nombre_Producto) {
        this.Nombre_Producto = Nombre_Producto;
    }

    public int getPrecio() {
        return Precio;
    }

    public void setPrecio(int Precio) {
        this.Precio = Precio;
    }

    public int getCodigo_producto() {
        return Codigo_producto;
    }

    public void setCodigo_producto(int Codigo_producto) {
        this.Codigo_producto = Codigo_producto;
    }

    public String getFecha_vencimiento() {
        return Fecha_vencimiento;
    }

    public void setFecha_vencimiento(String Fecha_vencimiento) {
        this.Fecha_vencimiento = Fecha_vencimiento;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getProveedor() {
        return Proveedor;
    }

    public void setProveedor(String Proveedor) {
        this.Proveedor = Proveedor;
    }

  
    public boolean guardarProducto() {
        ConexionDB conexion = new ConexionDB();
        
        String sentencia = "INSERT INTO mi_tienda.hoja1(Nombre_Producto, Precio, Codigo_producto, Fecha_vencimiento, Cantidad, Tipo, Proveedor) "
                + " VALUES ( '" + this.Nombre_Producto + "','" + this.Precio + "',"
                + "," + this.Codigo_producto + ",'" + this.Fecha_vencimiento + "'," + this.Cantidad + ","
                + "'" + this.Tipo + "','" + this.Proveedor + "');  ";
        
       conexion.insertarDB(sentencia);
        
        conexion.closeConnection();
        
        
        return true;
    }

    public boolean borrarProducto(int Codigo_producto) {
        ConexionDB conexion = new ConexionDB();
        
        String sentencia = "DELETE FROM mi_tienda.hoja1 WHERE Codigo_producto='"+Codigo_producto+"';";
        
        System.out.println(sentencia);
        conexion.borrarDB(sentencia);
        
        conexion.closeConnection();
        
        
        return true;    
    }

//actualizar 
    public boolean actualizarProducto(int Codigo_producto){
        ConexionDB conexion = new ConexionDB();
        
        String sentencia = "UPDATE Inventarioo SET Nombre_Producto='"+this.Nombre_Producto+"', Precio='"+this.Precio+"',Cantidad='"+
                            this.Cantidad+"',Fecha_vencimiento='"+this.Fecha_vencimiento+",'Tipo='" +this.Tipo +"'Proveedor='"+this.Proveedor +" 'WHERE Codigo_producto="+this.Codigo_producto+";";
        
        System.out.println(sentencia);
        conexion.actualizarDB(sentencia);
        
        conexion.closeConnection();
        
        
        return true;      
    }
    


    public List<Producto> listarProductos() throws SQLException {
        ConexionDB conexion = new ConexionDB();
        ArrayList<Producto> listaProductos = new ArrayList<>();
        String sentencia = "SELECT * FROM mi_tienda.hoja1 order by identificacion asc";
        ResultSet rs = conexion.consultarDB(sentencia);
        Producto P;

        try {

            while (rs.next()) {
                P = new Producto();
                P.setNombre_Producto(rs.getString("Nombre_Producto"));
                P.setPrecio(rs.getInt("Precio"));
                P.setCodigo_producto(rs.getInt("Codigo_producto"));
                P.setFecha_vencimiento(rs.getString("Fecha_vencimiento"));
                P.setCantidad(rs.getInt("Cantidad"));
                P.setTipo(rs.getString("Tipo"));
                P.setProveedor(rs.getString("Proveedor"));
              

                listaProductos.add(P);
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de la Base de datos" + e.getMessage());
        }
        return listaProductos;
     }

    public Producto consultarProducto(int id){
        ConexionDB conexion = new ConexionDB();
        
        String sentencia = "SELEC * FROM productos WHERE Codigo_producto="+Codigo_producto+";";        
        System.out.println(sentencia);
        
        
        ResultSet rs = conexion.consultarDB(sentencia);
        
            try {
                if(rs.next()){
                  this.Nombre_Producto = rs.getString("Nombre_Producto");
                  this.Precio=rs.getInt("Precio");
                  this.Codigo_producto =rs.getInt("Codigo_producto");
                  this.Fecha_vencimiento = rs.getString("Fecha_vencimiento");
                  this.Cantidad = rs.getInt("cantidad");   
                  this.Tipo = rs.getString("Tipo");   
                  this.Proveedor = rs.getString("Proveedor");  
                  conexion.closeConnection();
                }else{
                  conexion.closeConnection();
                  return null;
              }
        
            } catch (SQLException error) {
              System.out.println("error: " + error.getMessage());
            }
        conexion.closeConnection();
   
        return this ;      
    }

    @Override
    public String toString() {
        return "Contacto{" + "Nombre_Product=" + Nombre_Producto + ", Precio=" + Precio + ", Codigo_producto=" + Codigo_producto + ", Fecha_vencimiento=" + Fecha_vencimiento + ", Cantidad=" + Cantidad + ", Tipo=" + Tipo + ", Proveedor=" + Proveedor + "}";
    }
}

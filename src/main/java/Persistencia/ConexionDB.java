package Persistencia;

import java.sql.*;
import java.util.logging.*;

public class ConexionDB {


    //atributos 
    private String DB_driver = "";
    private String url="";   // direccion de base de datos
    public Connection con=null;  // estado de la conexion 
    private Statement stmt = null;  // sentencia de la operacion 
    private ResultSet rs = null;  // Resultado de la sentencia 

    public ConexionDB(){
        DB_driver = "com.mysql.cj.jdbc.Driver";
        url="jdbc:mysql://localhost:3306/mi_tienda?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";  // nombre del drive : DB : Direccion de la DB

        
        try {
            //Asignacin del Driver
            Class.forName(DB_driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //try para realizar conexion
        try{
            con=DriverManager.getConnection(url,"root","alvaro4278082");
            con.setTransactionIsolation(8);
            if (con!=null){
                DatabaseMetaData meta = con.getMetaData();
                System.out.println("Base de datos conectada: "+ meta.getDriverName()+" producto: "+meta.getDatabaseProductName());
            }       
        }catch(SQLException erroSQL){
            System.out.println(erroSQL.getMessage());
        }
        
    }

    public Connection getConnection(){
        return con;
    }

    public void closeConnection(){
        if (con!=null){
        try {
            con.close();
        } catch (SQLException error) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, error);
        }
    }    
    }
    
    

    //insertar en DB
    public boolean insertarDB(String sentencia){
        try {
            stmt= con.createStatement();
            stmt.execute(sentencia);
            
        } catch (SQLException | RuntimeException error) {
            System.out.println("Error en la rutina: "+ error.getMessage());
            return  false;
        }
        return true;
    }
    
    
    // Actualizar DB
    
    public boolean actualizarDB(String sentencia){
        try {
            stmt= con.createStatement();
            stmt.executeUpdate(sentencia); // aca se ejecuta una actualizacion
            
        } catch (SQLException | RuntimeException error) {
            System.out.println("Error en la rutina: "+ error.getMessage());
            return  false;
        }
        return true;
    }
    
    //Borra DB
    public boolean borrarDB(String sentencia){
        try {
            stmt= con.createStatement();
            stmt.execute(sentencia);
            
        } catch (SQLException | RuntimeException error) {
            System.out.println("Error en la rutina: "+ error.getMessage());
            return  false;
        }
        return true;
    }
    
    
    //Consultar DB
    
    public ResultSet consultarDB(String sentencia){
        try {
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs=stmt.executeQuery(sentencia); // ejecutar sentencia con Query
            
        } catch (SQLException | RuntimeException error) {
            System.out.println("Error en la rutina: "+ error.getMessage());
            
        }catch(Exception error){
            System.out.println("Error en exepcion: "+error);
        }
        return rs;
    }
    
}

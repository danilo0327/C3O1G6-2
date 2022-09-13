/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author aarci
 */

//Atributos de la tabla inventario
public class Producto {
    private int idProducto;
    private String nombre; 
    private double precioVenta;
    private String idCategoria; 
    private int idUnidad;
    private String descripcion;

    public Producto() {
    }
// constructores
    public Producto(int idProducto, String nombre, double precioVenta, String idCategoria, int idUnidad, String descripcion) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precioVenta = precioVenta;
        this.idCategoria = idCategoria;
        this.idUnidad = idUnidad;
        this.descripcion = descripcion;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getIdUnidad() {
        return idUnidad;
    }

    public void setIdUnidad(int idUnidad) {
        this.idUnidad = idUnidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombre=" + nombre + ", precioVenta=" + precioVenta + ", idCategoria=" + idCategoria + ", idUnidad=" + idUnidad + ", descripcion=" + descripcion + '}';
    }
    
    public List<Producto> consultarProductos(){
    List <Producto> productos = new ArrayList<>();
    
    //consultar la base de datos y llenar lña lista
    
    
    ConexionBD  conexion = new ConexionBD();
    
    // hacer consultas sql
    
    String sql="SELECT * FROM inventario.producto;";
    //generar conjunto de resultados
    ResultSet rs = conexion.consultarBD(sql);
    //recorrer el conjunto de resultados
    try{
        
    //llenar nuestra lista
    
    Producto p;
    
    
        while(rs.next()){
            p = new Producto();
            p.setIdProducto(rs.getInt("idProducto"));
            p.setNombre(rs.getString("nombre"));
            p.setPrecioVenta(rs.getDouble("precioVenta"));
            p.setIdCategoria(rs.getString("idCategoria"));
            p.setIdUnidad(rs.getInt("idUnidad"));
            p.setDescripcion(rs.getString("descripcion"));
            productos.add(p);
    }
    }
    catch(SQLException ex){
        System.out.println(ex.getMessage());
            }
    finally{
        //cerrar siempre la base de datos independientemente de si se hace una consulta o no
    conexion.cerrarConexion();
    }
    
    
    return productos;
    }
    public boolean guardarProducto(){
        boolean exito=false;
        ConexionBD conexion = new ConexionBD();
        String sql="INSERT INTO producto (nombre, precioVenta, idCategoria, idUnidad, descripcion) VALUES('"+nombre+"',"+precioVenta+",'"+idCategoria+"', "+idUnidad+",'"+descripcion+"');";
    if (conexion.setAutoCommitBD(false)){
    if (conexion.insertarBD(sql)){
        exito=true;
        conexion.commitBD();
        conexion.cerrarConexion();
        
    }else{
        conexion.rollbackBD();
        conexion.cerrarConexion();
    }
}else{
    conexion.cerrarConexion();
}
return exito;
}
     public boolean actualizarProducto(){
        boolean exito=false;
        ConexionBD conexion = new ConexionBD();
        String sql="UPDATE producto SET nombre='"+nombre+"', precioVenta="+precioVenta+", idCategoria='"+idCategoria+"', idUnidad="+idUnidad+", descripcion='"+descripcion+"' WHERE idProducto="+idProducto+";";
    if (conexion.setAutoCommitBD(false)){
    if (conexion.actualizarBD(sql)){
        exito=true;
        conexion.commitBD();
        conexion.cerrarConexion();
        
    }else{
        conexion.rollbackBD();
        conexion.cerrarConexion();
    }
}else{
    conexion.cerrarConexion();
}
return exito;
}
     public boolean eliminarProducto(){
        boolean exito=false;
        ConexionBD conexion = new ConexionBD();
        String sql="DELETE FROM producto where idProducto="+idProducto+";";
    if (conexion.setAutoCommitBD(false)){
    if (conexion.actualizarBD(sql)){
        exito=true;
        conexion.commitBD();
        conexion.cerrarConexion();
        
    }else{
        conexion.rollbackBD();
        conexion.cerrarConexion();
    }
}else{
    conexion.cerrarConexion();
}
return exito;
}
        
    }
    
    
    
    
       


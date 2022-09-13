/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.List;

/**
 *
 * @author aarci
 */
public class Demo {
    public static void main(String[]args){
         
        Producto p = new Producto();
        ;
        p.setNombre("Coca-cola");
        p.setPrecioVenta(3600);
        p.setIdCategoria("004");
        p.setIdUnidad(4);
        p.setDescripcion("Leche de cocoa");
        p.guardarProducto();
          
        
        List <Producto> productos= p.consultarProductos();
        for (Producto px: productos){
            System.out.println(px.toString());
        }
    }
}

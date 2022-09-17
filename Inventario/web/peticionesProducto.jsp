<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Producto"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar"

    });

    String proceso = "" + request.getParameter("proceso");

    // Validaci�n de par�metros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creaci�n de objeto y llamado a m�todo guardar   
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));

            String nombre = request.getParameter("nombre");

            double precioVenta = Double.valueOf(request.getParameter("precioVenta"));

            String idCategoria = request.getParameter("idCategoria");

            int idUnidad = Integer.parseInt(request.getParameter("idUnidad"));
            String descripcion = request.getParameter("descripcion");

            Producto p = new Producto(idProducto, nombre, precioVenta, idCategoria, idUnidad, descripcion);

            if (p.guardarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creaci�n de objeto y llamado a m�todo eliminar
               int idProducto = Integer.parseInt(request.getParameter("idProducto"));
               Producto p = new Producto();
               p.setIdProducto(idProducto);
            if (p.eliminarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de par�metros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creaci�n de objeto y llamado al metodo listar
            try {
                Producto p = new Producto();
                List<Producto> lista = p.consultarProductos();
                respuesta += "\"" + proceso + "\": true,\"productos \":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"productos\":[]";
                Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creaci�n de objeto y llamado al metodo actualizar
             int idProducto = Integer.parseInt(request.getParameter("idProducto"));

            String nombre = request.getParameter("nombre");

            double precioVenta = Double.valueOf(request.getParameter("precioVenta"));

            String idCategoria = request.getParameter("idCategoria");

            int idUnidad = Integer.parseInt(request.getParameter("idUnidad"));
            String descripcion = request.getParameter("descripcion");

            Producto p = new Producto(idProducto, nombre, precioVenta, idCategoria, idUnidad, descripcion);
            
            if (p.actualizarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inv�lidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Responder como objeto JSON codificaci�n ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>


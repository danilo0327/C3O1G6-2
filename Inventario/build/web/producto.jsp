<%-- 
    Document   : producto
    Created on : 18-sep-2022, 6:38:08
    Author     : Grupo6
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Productos</title>
        <style>
/*            div{
                border: solid 2px;
            }*/
        </style>

    </head>
    <body>

        <div class="container-fluid" ng-app="producto" ng-controller="productoController as a">

            <div class="row">
                <div class="col-6">
                    <h3>Formulario</h3>

                    <div class="row">
                        <div class="col-6">
                            <label >Id Producto:</label>
                            <input type="text" class="form-control" ng-model="a.idProducto">
                        </div>
                        <div class="col-6">
                            <label >Nombre:</label>
                            <input type="text" class="form-control" ng-model="a.nombre">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label >Precio de Venta:</label>
                            <input type="text" class="form-control" ng-model="a.precioVenta">
                        </div>
                        <div class="col-6">
                            <label >Categoria:</label>
                            <input type="text" class="form-control" ng-model="a.idCategoria">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label >Cantidad:</label>
                            <input type="text" class="form-control" ng-model="a.idUnidad">
                        </div>
                        <div class="col-6">
                            <label >Descripcion:</label>
                            <input type="text" class="form-control" ng-model="a.descripcion">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="a.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="a.consultar()">Consultar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="a.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger" ng-click="a.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <h3>Tabla</h3>
                    <table class="table">
                        <thead>
                            <tr>                                
                                <th scope="col">Id Producto</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Precio de Venta</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Descripcion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="ax in a.productos">                               
                                <td>{{ax.idProducto}}</td>
                                <td>{{ax.nombre}}</td>
                                <td>{{ax.precioVenta}}</td>
                                <td>{{ax.idCategoria}}</td>
                                <td>{{ax.idUnidad}}</td>
                                <td>{{ax.descripcion}}</td>
                            </tr>
                            
                        </tbody>
                    </table>
<!--                    {{a.idAutor}}
                    {{a.nombre}}
                    {{a.nacionalidad}}-->
                </div>
            </div>

        </div>
        <script>
            var app=angular.module('producto',[]);
            app.controller('productoController',['$http',controladorProducto]);
            function controladorProducto($http){
                var a=this;
                
                a.consultar=function(){
                    var parametros={
                        proceso:'listar'
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProducto.jsp',
                        params:parametros
                    }).then(function(resp){
                        a.productos=resp.data.productos;
                    });
                };
                
                a.guardar=function(){
                    var parametros={
                        proceso:'guardar',
                        idProducto:a.idProducto,
                        nombre:a.nombre,
                        precioVenta:a.precioVenta,
                        idCategoria:a.idCategoria,
                        idUnidad:a.idUnidad,
                        descripcion:a.descripcion
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProducto.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.guardar===true){
                                alert('Guardó');
                            }else{
                                alert('No Guardó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                a.actualizar=function(){
                    var parametros={
                        proceso:'guardar',
                        idProducto:a.idProducto,
                        nombre:a.nombre,
                        precioVenta:a.precioVenta,
                        idCategoria:a.idCategoria,
                        idUnidad:a.idUnidad,
                        descripcion:a.descripcion
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProducto.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.actualizar===true){
                                alert('Actualizó');
                            }else{
                                alert('No Actualizó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
                a.eliminar=function(){
                     var parametros={
                        proceso:'eliminar',
                        idProducto:a.idProducto
                    };
                    $http({
                        method:'POST',
                        url:'peticionesProducto.jsp',
                        params:parametros
                    }).then(function(resp){
                        if(resp.data.ok===true){
                            if(resp.data.eliminar===true){
                                alert('Eliminó');
                            }else{
                                alert('No Eliminó');
                            }
                            
                        }else{
                            alert(resp.data.errorMsg);
                        }
                    });
                };
            }
        </script>

    </body>
</html>
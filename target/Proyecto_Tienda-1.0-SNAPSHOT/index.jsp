<%-- 
    Document   : index
    Created on : 28/09/2021, 9:50:12 p. m.
    Author     : GIGABYTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>   
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script> 
    </head>
    <body class="bg-primary">
        <div class="container-fluid" ng-app = "TiendaMiBarrio" ng-controller = "productosController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>Tienda mi barrio</h1></center> 
                </div>
            </div>
            
            
            <div class="row">
                <div class="col">
                    <center><h3>Ingresar Producto</h3></center>
                    <div class="row">
                        <div class="col-6">
                            <label >Nombre del producto</label>
                            <input class="form-control" type="number" min="0" ng-model="cn.Nombre_Producto" required>
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" ng-model="cn.Precio" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Codigo del producto</label>
                            <input class="form-control" type="text" ng-model="cn.Codigo_producto" required>
                        </div>
                        <div class="col-6">
                            <label>Fecha vencimineto</label>
                            <input class="form-control" type="text" ng-model="cn.Fecha_vencimiento" required>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Cantidad</label>
                            <input class="form-control" type="text" ng-model="cn.Cantidad" required>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Tipo</label>
                            <select class="form-control" ng-model="cn.tipoTipo" required>
                                <option>Frutas-verdura</option>
                                <option>vivere</option>
                                <option>Aseo</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Proveedor</label>
                            <input class="form-control" type="text" ng-model="cn.Proveedor" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="cn.guardarContacto()">Guardar</button>
                        </div>
                    </div>
                </div>
            
            
             <div class="co-6">   
                 <center><h3>Listado de inventario</h3></center>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Nombre del producto</th>  
                                <th>Precio</th>  
                                <th>Codigo del producto</th>  
                                <th>Fecha de vencimiento</th>  
                                <th>Cantidad</th>  
                                <th>Tipo</th>  
                                <th>Proveedor</th>  
                                  
                            </tr>  
                        </thead>

                        <tr ng-repeat = "producto in cn.productos">  
                            <td>{{ producto.Nombre_Producto}}</td>  
                            <td>{{ producto.Precio}}</td>  
                            <td>{{ producto.Codigo_producto}}</td>  
                            <td>{{ producto.Fecha_vencimiento}}</td>  
                            <td>{{ producto.Cantidad}}</td>  
                            <td>{{ producto.Tipo}}</td>  
                            <td>{{ producto.Proveedor}}</td>  
                            
                    </tr>  
                </table> 
            </div>
        </div>
    </div>
        
        
    </body>

     <script>
        var app = angular.module('TiendaMiBarrio', []);
        app.controller('productossController', ['$http', controladorProductos]);
        function controladorProductos($http) {
            var cn = this;
            cn.listarProductos = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarProductos"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    cn.producto = res.data.Producto;
                });
            };          
        }
    </script>     
    
    
</html>

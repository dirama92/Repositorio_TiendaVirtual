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
        <div class="container-fluid" ng-app = "TiendaMiBarrio" ng-controller = "productossController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>Tienda mi barrio</h1></center> 
                </div>
            </div>
            
            

                    <center><h3>Ingresar Producto</h3></center>
                    <div class="row">
                        <div class="col-6">
                            <label >Nombre del producto</label>
                            <input class="form-control" type="text" ng-model="cn.Nombre_Producto" required>
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="number" min="0" ng-model="cn.Precio" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Codigo del producto</label>
                            <input class="form-control" type="number" ng-model="cn.Codigo_producto" required>
                        </div>
                        <div class="col-6">
                            <label>Fecha vencimiento</label>
                            <input class="form-control" type="text" ng-model="cn.Fecha_vencimiento" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Cantidad</label>
                            <input class="form-control" type="number" min="0" ng-model="cn.Cantidad" required>
                        </div>
                        <div class="col-6">
                            <label>Tipo</label>
                            <select class="form-control" ng-model="cn.Tipo" required>
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
                            <button  class="btn btn-success" ng-click="cn.guardarProducto()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="cn.listarProductos()">Listar Producto</button>
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
                    cn.productos = res.data.Producto;
                });
            };  
            cn.guardarProducto = function () {
                var producto = {
                    proceso: "guardarProducto",
                    Nombre_producto: cn.Nombre_Producto,
                    Precio: cn.Precio,
                    Codigo_producto: cn.Codigo_producto,
                    Fecha_vencimineto: cn.Fecha_vencimiento,
                    Cantidad: cn.Cantidad,
                    Tipo: cn.tipoTipo,
                    Proveedor: cn.Proveedor
                };
                console.log(producto);
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: producto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[producto.proceso] === true) {
                            alert("Guardado con éxito");
                           cn.listarProducto();
                        } else {
                            alert("No se guardo Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
        }
    </script>     
    
    
</html>

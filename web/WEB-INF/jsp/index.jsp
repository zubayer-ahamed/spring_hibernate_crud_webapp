<%-- 
    Document   : index
    Created on : Sep 13, 2017, 11:08:17 AM
    Author     : cyclingbd007
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <spring:url value="/resources/css/bootstrap.css" var="bootstrapCSS"/>
        <spring:url value="/resources/css/font-awesome.css" var="fontawesomeCSS"/>
        <spring:url value="/resources/js/jquery.min.js" var="jqueryJS"/>
        <spring:url value="/resources/js/bootstrap.js" var="bootstrapJS"/>
        <link rel="stylesheet" type="text/css" href="${bootstrapCSS}"/>
        <link rel="stylesheet" type="text/css" href="${fontawesomeCSS}"/>
        <script src="${jqueryJS}"></script>
        <script src="${bootstrapJS}"></script>
        <style type="text/css">
            .header, .message{
                margin-bottom: 20px;
            }
            th, td{
                text-align: center;
            }
        </style>
    </head>
    <body>

        <div class="container">

            <div class="col-md-12 header">
                <h1 align="center">Spring Hibernate CRUD</h1>
            </div>

            <div class="col-md-12 message">
                <c:if test="${sm != null}">
                    <div class="alert alert-success alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> ${sm}
                    </div>

                </c:if>
                <c:if test="${em != null}">
                    <div class="alert alert-danger alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> ${em}
                    </div>
                </c:if>


            </div>

            <div class="student_form col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><i class="fa fa-product-hunt"></i> Insert Product</h3>
                    </div>
                    <div class="panel-body">
                        <c:if test="${product.pid != null}">
                            <form action="<%= request.getContextPath()%>/updateProduct" method="post">
                            </c:if>
                            <c:if test="${product.pid == null}">
                                <form action="<%= request.getContextPath()%>/addProduct" method="post">
                                </c:if>
                                <div class="form-group">
                                    <label for="pid">ID: </label>
                                    <input value="${product.pid}" name="pid" type="text" class="form-control" id="pid" <c:if test="${product.pid == null}">disabled="1"</c:if>" readonly="1">
                                    </div>

                                    <div class="form-group">
                                        <label for="pname">Product Name:</label>
                                        <input value="${product.pname}" name="pname" type="text" class="form-control" id="pname">
                                </div>

                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input value="${product.price}" name="price" type="text" class="form-control" id="price">
                                </div>

                                <div class="form-group">
                                    <label for="qty">Quantity</label>
                                    <input value="${product.qty}" name="qty" type="text" class="form-control" id="qty">
                                </div>

                                <c:if test="${product.pid != null}">
                                    <button type="submit" class="btn btn-warning"><i class="fa fa-edit"></i> Update</button>
                                    <a href="<%= request.getContextPath()%>" class="btn btn-primary pull-right"><i class="fa fa-user-plus"></i> New</a>
                                </c:if>

                                <c:if test="${product.pid == null}">
                                    <button type="submit" class="btn btn-success"><i class="fa fa-send"></i> Submit</button>
                                </c:if>


                            </form>

                    </div>
                    <div class="panel-footer">

                    </div>
                </div>
            </div>

            <div class="header col-md-8">
                <table class="table table-bordered table-responsive table-striped">
                    <thead>
                        <tr>
                            <th colspan="6" style="text-align: center;"><h2><i class="fa fa-product-hunt"></i> Products List</h2></th>
                        </tr>
                        <tr>
                            <th>Id</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${products}">
                            <tr>
                                <td>${row.pid}</td>
                                <td>${row.pname}</td>
                                <td>${row.price}</td>
                                <td>${row.qty}</td>
                                <td>
                                    <a href="<%= request.getContextPath()%>/editProduct/${row.pid}" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                                </td>
                                <td>
                                    <a onclick="return confirm('Are you want to delete this item?')" href="<%= request.getContextPath()%>/deleteProduct/${row.pid}" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="col-md-12" style="text-align: center;">
                &copy; Zubayer Ahamed
                || <a href="https://www.youtube.com/channel/UC4vVj7lKO7H4FohB3lv9dzA" target="_blank">Youtube</a>  || <a href="http://www.facebook.com/zubayerahamed" target="_blank">Facebook</a>
            </div>

        </div>

    </body>
</html>

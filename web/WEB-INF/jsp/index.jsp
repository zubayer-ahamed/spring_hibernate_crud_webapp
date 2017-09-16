<%-- 
    Document   : index
    Created on : Sep 16, 2017, 7:46:15 PM
    Author     : cyclingbd007
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="row" items="${products}">
            ${row.pid}
        </c:forEach>
    </body>
</html>

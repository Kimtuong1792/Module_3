<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/29/2022
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table>
    <tr>
        <td>ID: </td>
        <td><input type="number" name="id" id="id" value="${product.getId()}"></td>
    </tr>
    <tr>
        <td>Name: </td>
        <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
    </tr>
    <tr>
        <td>Price: </td>
        <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
    </tr>
    <tr>
        <td>Describe: </td>
        <td><input type="text" name="describe" id="describe" value="${product.getDescribe()}"></td>
    </tr>
    <tr>
        <td>Producer: </td>
        <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
    </tr>
</table>
</body>
</html>

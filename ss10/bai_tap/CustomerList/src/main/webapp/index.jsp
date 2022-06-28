<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/28/2022
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Hiển thị danh sách khách hàng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body  align="center">
<h2> Display list Customer</h2>
<table class="table" align="center" width="100" border="1">
  <tr bgcolor="#5f9ea0">
    <th> Name</th>
    <th> Birthday</th>
    <th> Address</th>
    <th> Photo</th>
  </tr>
  <c:forEach items="${customerList}" var="customer">
    <tr>
      <td>${customer.name}</td>
      <td>${customer.birthday}</td>
      <td>${customer.address}</td>
      <td><img src="${customer.photo}" width="100" height="100"></td>
    </tr>
  </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>


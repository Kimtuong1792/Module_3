<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management </title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2>
        <a href="/customer?action=customer">List All Customer</a>
    </h2>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">

            <tr>
                <th>Customer id:</th>
                <td>
                    <input type="number" name="id" id="id" size="45"/>
                </td>
            </tr>
            <tr>
                <th>CustomerTypeId:</th>

                <td>
                    <select name="customerTypeId" id="customerTypeId">
                        <option value="">Chọn kiểu khách</option>
                        <c:forEach var="item" items="${customerTypeList}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>

                </td>
            </tr>

            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Birthday:</th>
                <td>
                    <input type="date" name="birthday" id="birthday" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Customer gender:</th>
                <td>
                    <select>
                        <option value="">Chọn giới tính</option>
                        <option value="1"> male </option>
                        <option value="0"> Female </option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Customer idCard:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Number phone:</th>
                <td>
                    <input type="text" name="numberPhone" id="numberPhone" size="45"/>
                </td>
            </tr>
            <tr>
                <th>email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>

        </table>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>

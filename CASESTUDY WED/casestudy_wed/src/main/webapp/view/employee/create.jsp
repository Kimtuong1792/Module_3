<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management </title>
</head>
<body>
<center>
    <h1> Employee Management</h1>
    <h2>
        <a href="/employee?action=employee">List All Customer</a>
    </h2>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">

            <tr>
                <th>employee id:</th>
                <td>
                    <input type="number" name="id" id="id" size="45"/>
                </td>
            </tr>
                <th>Employee Name:</th>
                <td>
                    <input type="text" name="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee Birthday:</th>
                <td>
                    <input type="date" name="birthday" size="45" />
                </td>
            </tr>
            <tr>
                <th>Employee Birthday:</th>
                <td>
                    <input type="text" name="idCard" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee Salary:</th>
                <td>
                    <input type="number" name="salary" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee numberPhone:</th>
                <td>
                    <input type="number" name="numberPhone" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Employee email:</th>
                <td>
                    <input type="text" name="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" size="15" />

                </td>
            </tr>
            <tr>
                <th>positionId:</th>
                <td>
                    <select name="positionId" id="positionId">
                        <option value="">Chọn chức danh</option>
                        <c:forEach var="item" items="${positionList}">
                                <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>educationDegreeId:</th>
                <td>
                    <select name="educationDegreeId" id="educationDegreeId">
                        <option value="">Chọn trình độ học vấn</option>
                        <c:forEach var="item" items="${educationDegreeList}">
                                <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>divisionId:</th>
                <td>
                    <select name="divisionId" id="divisionId">
                        <option value="">Chọn trình phòng ban</option>
                        <c:forEach var="item" items="${divisionList}">
                                <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>userName:</th>
                <td>
                    <select name="userName" id="userName">
                        <option value="">Chọn username</option>
                        <c:forEach var="item" items="${userList}">
                                <option value="${item.userName}">${item.userName}</option>
                        </c:forEach>
                    </select>
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

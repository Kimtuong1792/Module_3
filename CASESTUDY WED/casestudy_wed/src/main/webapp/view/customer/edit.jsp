<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management Application</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2>
        <a href="/customer?action=customer">List All Customer</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/customer?action=edit">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Customer
                </h2>
            </caption>
            <c:if test="${customer != null}">
                <input type="hidden" name="id" value="<c:out value='${customer.id}' />"/>
            </c:if>
            <c:if test="${customer != null}">
                <input type="hidden" name="customerTypeId" value="<c:out value='${customer.customerTypeId}' />"/>
            </c:if>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${customer.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer Birthday:</th>
                <td>
                    <input type="date" name="birthday" size="45"
                           value="<c:out value='${customer.birthday}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer Gender:</th>
                <td>
                    <input type="number" name="gender" size="45"
                           value="<c:out value='${customer.gender}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer IdCard:</th>
                <td>
                    <input type="number" name="idCard" size="45"
                           value="<c:out value='${customer.idCard}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer NumberPhone:</th>
                <td>
                    <input type="number" name="numberPhone" size="45"
                           value="<c:out value='${customer.numberPhone}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer email:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${customer.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" size="15"
                           value="<c:out value='${customer.address}' />"
                    />
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
</body>
</html>

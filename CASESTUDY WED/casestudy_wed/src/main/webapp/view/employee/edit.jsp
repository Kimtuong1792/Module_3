<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>employee Management Application</title>
</head>
<body>
<center>
    <h1>employee Management</h1>
    <h2>
        <a href="/employee?action=employee">List All employee</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/employee?action=edit">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Employee
                </h2>
            </caption>
            <c:if test="${employee != null}">
                <input type="hidden" name="id" value="<c:out value='${employee.id}' />"/>
            </c:if>
            <tr>
                <th>Employee Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${employee.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee Birthday:</th>
                <td>
                    <input type="date" name="birthday" size="45"
                           value="<c:out value='${employee.birthday}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee Birthday:</th>
                <td>
                    <input type="text" name="idCard" size="45"
                           value="<c:out value='${employee.idCard}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee Salary:</th>
                <td>
                    <input type="number" name="salary" size="45"
                           value="<c:out value='${employee.salary}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee numberPhone:</th>
                <td>
                    <input type="number" name="numberPhone" size="45"
                           value="<c:out value='${employee.numberPhone}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Employee email:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${employee.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" size="15"
                           value="<c:out value='${employee.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>positionId:</th>
                <td>
                    <select name="positionId" id="positionId">
                        <option value="">Chọn chức danh</option>
                        <c:forEach var="item" items="${positionList}">
                            <c:if test="${item.id == employee.positionId}">
                                <option value="${item.id}" selected>${item.name}</option>
                            </c:if>
                            <c:if test="${item.id != employee.positionId}">
                                <option value="${item.id}">${item.name}</option>
                            </c:if>
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
                            <c:if test="${item.id == employee.educationDegreeId}">
                                <option value="${item.id}" selected>${item.name}</option>
                            </c:if>
                            <c:if test="${item.id != employee.educationDegreeId}">
                                <option value="${item.id}">${item.name}</option>
                            </c:if>
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
                            <c:if test="${item.id == employee.divisionId}">
                                <option value="${item.id}" selected>${item.name}</option>
                            </c:if>
                            <c:if test="${item.id != employee.divisionId}">
                                <option value="${item.id}">${item.name}</option>
                            </c:if>

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
                            <c:if test="${item.userName == employee.userName}">
                                <option value="${item.userName}" selected>${item.userName}</option>
                            </c:if>
                            <c:if test="${item.userName != employee.userName}">
                                <option value="${item.userName}">${item.userName}</option>
                            </c:if>

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
</body>
</html>

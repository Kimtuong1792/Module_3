<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 7/3/2022
  Time: 10:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Furama</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<c:if test=" ${mess != null}">
    <span>${mess}</span>
</c:if>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="furama.png" alt="" width=60" height="100"
                                     class="d-inline-block align-text-top"></a>
        <a class=".fs-6 text text-dark font arial" href="#">
            <b>Địa chỉ :</b> <br>
            103 - 105 Vo Nguyen Giap Street,<br>
            Khue My Ward, Ngu Hanh Son District,<br>
            Danang City, Vietnam
            7,0 km from Danang Airport</a>

        <span class="navbar-text">
        Make by Trần Kim Tưởng
      </span>
    </div>
</nav>
<nav class="navbar navbar-expand-lg bg-secondary">
    <div class="container-fluid">
        <div class="btn-group">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="defaultDropdown"
                    data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                Home
            </button>

        </div>

        <div class="btn-group">
            <a href="/employee">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuClickableOutside"
                    data-bs-toggle="dropdown" data-bs-auto-close="inside" aria-expanded="false">
                Employee
            </button>

        </div>
        <div class="btn-group">
            <a href="/customer">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuClickableInside"
                        data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                    Customer
                </button>
            </a>

        </div>

        <div class="btn-group">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuClickable"
                    data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">
                Service
            </button>

        </div>
        <div class="btn-group">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuClickables"
                    data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">
                Contract
            </button>

        </div>
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success text" type="submit">Search</button>
        </form>
    </div>
</nav>
<div>
    <div class="container-fluid">
        <div class="row">
            <div align="center">
                <table border="1" cellpadding="5" class="table">

                    <tr bgcolor="blue">
                        <th>ID</th>
                        <th>Name</th>
                        <th>birthday</th>
                        <th>idCard</th>
                        <th>Salary</th>
                        <th>numberPhone</th>
                        <th>email</th>
                        <th>address</th>
                        <th>positionId</th>
                        <th>educationDegreeId</th>
                        <th>divisionId</th>
                        <th>userName</th>
                        <th>Actions</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach var="employee" items="${employeeList}">
                        <tr>
                            <td><c:out value="${employee.id}"/></td>
                            <td><c:out value="${employee.name}"/></td>
                            <td><c:out value="${employee.birthday}"/></td>
                            <td><c:out value="${employee.idCard}"/></td>
                            <td><c:out value="${employee.salary}"/></td>
                            <td><c:out value="${employee.numberPhone}"/></td>
                            <td><c:out value="${employee.email}"/></td>
                            <td><c:out value="${employee.address}"/></td>
                            <c:forEach var="position" items="${positionList}">
                                <c:if test="${position.id == employee.positionId}">
                                    <td><c:out value="${position.name}"/></td>
                                </c:if>
                            </c:forEach>

                            <c:forEach var="educationDegree" items="${educationDegreeList}">
                                <c:if test="${educationDegree.id == employee.educationDegreeId}">
                                    <td><c:out value="${educationDegree.name}"/></td>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="division" items="${divisionList}">
                                <c:if test="${division.id == employee.divisionId}">
                                    <td><c:out value="${division.name}"/></td>
                                </c:if>
                            </c:forEach>

                            <c:forEach var="user" items="${userList}">
                                <c:if test="${user.userName == employee.userName}">
                                    <td><c:out value="${user.userName}"/></td>
                                </c:if>
                            </c:forEach>
                            <td>
                                <a href="/employee?action=edit&id=${employee.id}">Edit</a>
                            </td>
                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                        onclick="objdelete('${employee.id}' ,'${employee.name}')"
                                        data-bs-target="#exampleModal">
                                    Delete
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>


<h2>
    <a href="/employee?action=create">
        <button class="btn btn-primary">Add New Employee</button>
    </a>
</h2>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/employee " method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">thong bao</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden name="id" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <span> ban co muon xoa : </span>
                    <span id="nameDelete">  </span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function objdelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</body>
</html>
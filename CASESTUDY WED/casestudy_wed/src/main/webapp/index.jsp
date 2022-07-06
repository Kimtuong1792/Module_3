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
</head>
<body>
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
            <ul class="dropdown-menu" aria-labelledby="defaultDropdown">
                <li><a class="dropdown-item" href="#">Menu item</a></li>
                <li><a class="dropdown-item" href="#">Menu item</a></li>
                <li><a class="dropdown-item" href="#">Menu item</a></li>
            </ul>
        </div>

        <div class="btn-group">
            <a href="/employee">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuClickableOutside"
                        data-bs-toggle="dropdown" data-bs-auto-close="inside" aria-expanded="false">
                    Employee
                </button>
            </a>
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
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickable">
                <li><a class="dropdown-item" href="#">Menu item</a></li>
                <li><a class="dropdown-item" href="#">Menu item</a></li>
                <li><a class="dropdown-item" href="#">Menu item</a></li>
            </ul>
        </div>
        <div class="btn-group">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuClickables"
                    data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">
                Contract
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickable">
                <li><a class="dropdown-item" href="#">Menu item</a></li>
                <li><a class="dropdown-item" href="#">Menu item</a></li>
                <li><a class="dropdown-item" href="#">Menu item</a></li>
            </ul>
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
            <div class="col-3 bg-light" style="height: 500px">
                <div class="col-12 ">
                    item One
                </div>
                <div class="col-12 ">
                    item two
                </div>
                <div class="col-12 ">
                    item three
                </div>
            </div>
            <div class="col-9">
                <a class="navbar-brand"><img src="Resort-la-gi-01.jpeg" alt="" style="width: calc(100% - 5px)"
                                             height="400" class="d-inline-block align-text-top"></a>
            </div>
        </div>
    </div>
</div>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous">
</body>
</html>
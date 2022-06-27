<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/27/2022
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ứng dụng Product Discount Calculator</title>
  </head>
  <body style="align-items: center">
  <h2> Product Discount Calculator </h2>
  <form method="post" action="/product" >
    <label >Product Description: </label>
    <input type="text" name="description " placeholder="Mô tả sản phẩm" width="60px" height="10px">
    <br><br>
    <label>List Price: </label>
    <input type="number" name="price" placeholder="Giá niêm yết sản phẩm" width="60px" height="10px">
    <br><br>
    <label>Discount Percent: </label>
    <input type="number" name="percent" placeholder=" Tỷ lệ chiết khấu phần trăm" width="60px" height="15px">
    <br><br>
    <button type="submit"> Calculate Discount</button>
  </form>
<h4>Giá sau chiết khấu:  ${ketQua}</h4>
  </body>
</html>

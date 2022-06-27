<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/27/2022
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<style type="text/css" >
  .login {
    height:180px; width:330px;
    margin:0;
    padding:10px;
    border:1px #CCC solid;
  }
  .login input {
    padding:5px; margin:5px
  }
</style>
<body>
<form>
  <div class="login">
    <h2>Login</h2>
    <input type="text" name="username" size="30"  placeholder="username" />
    <br>
    <input type="password" name="password" size="30" placeholder="password" />
    <br>
    <input type="submit" value="Sign in"/>
  </div>
</form>
</body>
</html>

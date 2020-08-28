<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 23/11/2019
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="style.css">
    <title>Home</title>
    <%
    session.invalidate();

    %>
</head>
<body>
<h1> IMDB <br>
    Home
</h1>
<div>
<table class="center">
    <tr>
        <td>
            <form action="actori.jsp">
                <input type="submit" value="Actori">
            </form>
        </td>
        <td>
            <form action="filme.jsp">
                <input type="submit" value="Filme">
            </form>
        </td>
        <td>
            <form action="regizori.jsp">
                <input type="submit" value="Regizori">
            </form>
        </td>
        <td>
            <form action="oscaruri.jsp">
                <input type="submit" value="Oscaruri">
            </form>
        </td>
    </tr>
</table>
</div>

<footer>

  (C)  Slanina Sergiu 2019
</footer>
<br>
</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>

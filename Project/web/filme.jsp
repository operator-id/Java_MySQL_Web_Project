<%@ page import="imdb.sergiu.Film" %>
<%@ page import="imdb.sergiu.GestiuneFilm" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 24/11/2019
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Filme</title>
    <link rel="stylesheet" href="style.css">
</head>
<link rel="stylesheet" href="style.css">
<body>
<h5>Filme</h5>
<table border=1 id="tabelFilme" class="center" style="width: 70%; border-collapse: collapse; border-color: red;">
    <tr>
        <td>ID</td>
        <td>Titlu</td>
        <td>Durata</td>
        <td>An Aparitie</td>
        <td>Rating</td>
        <td>Descriere</td>

    </tr>
    <%


        ArrayList<Film> filme = new ArrayList();
        GestiuneFilm gf = new GestiuneFilm();
        filme = gf.getListaFilme();

    %>

    <% for (Film film : filme) {%>
    <tr>
        <td><%=film.getId()%>
        </td>
        <td><%=film.getTitlu()%>
        </td>
        <td><%=film.getDurata()%>
        </td>
        <td><%=film.getAnAparitie()%>
        </td>
        <td><%=film.getRating()%>
        </td>
        <td><%=film.getDescriere()%>
        </td>
    </tr>

    <%}%>
</table>
<br>
<A HREF="index.jsp">Home</A>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</body>

</html>

<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 24/11/2019
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="imdb.sergiu.Actor" %>
<%@ page import="imdb.sergiu.GestiuneActor" %>
<%@ page import="imdb.sergiu.GestiuneOscar" %>
<%@ page import="imdb.sergiu.Oscar" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Actori cu oscar</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h5>Actori cu oscar</h5>
<table border=1 id="tabelActori" class="center" style="width: 70%; border-collapse: collapse; border-color: red;">
    <tr>
        <td>ID</td>
        <td>Nume</td>
        <td>Prenume</td>
        <td>Anul Nasterii</td>
        <td>Locul Nasterii</td>

    </tr>
    <%

        String actoriOscar = "";

        ArrayList<Oscar> oscaruri = new ArrayList();
        GestiuneActor ga = new GestiuneActor();
        GestiuneOscar go = new GestiuneOscar();

        oscaruri = go.getListaOscaruri();

        for (Oscar oscar : oscaruri) {
            Actor actor = ga.getDateActor(oscar.getIdActor());
    %>
    <tr>
        <td><%=actor.getIdActor()%>
        </td>
        <td><%=actor.getNume()%>
        </td>
        <td><%=actor.getPrenume()%>
        </td>
        <td><%=actor.getDataNasterii()%>
        </td>
        <td><%=actor.getLoculNasterii()%>
        </td>
    </tr>
    <% } %>


</table>

<br>
<table>
    <tr>
        <td><A HREF="actori.jsp">Actori</A></td>
        <td><A HREF="index.jsp">Home</A></td>
    </tr>

</table>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 23/11/2019
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="imdb.sergiu.Actor" %>
<%@ page import="imdb.sergiu.GestiuneActor" %>
<%@ page import="java.util.ArrayList" %>


<html>

<head>
    <title>Actori</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h5>Actori</h5>

<br>
<table border=1 id="tabelActori" class="center" style="width: 70%; border-collapse: collapse; border-color: red;">
    <tr>
        <td>ID</td>
        <td>Nume</td>
        <td>Prenume</td>
        <td>Anul Nasterii</td>
        <td>Locul Nasterii</td>

    </tr>
    <%
        ArrayList<Actor> actori = new ArrayList();
        GestiuneActor ga = new GestiuneActor();
        actori = ga.getListaActori();

    %>

    <% for (Actor actor : actori) { %>
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

<table class="center">
    <tr>
        <td>
            <form action="cauta.jsp">
                <input type="submit" value="Cauta actor dupa id">
            </form>
        </td>
        <td>
            <form action="modifica_actor.jsp">
                <input type="submit" value="Modifica actor">
            </form>
        </td>
        <td>
        <form action="adauga_persoana_noua.jsp" method="post">
            <input type="hidden" name="tip" value="actor">
            <button type="submit">Adauga actor</button>
        </form>
    </td>
        <td>
            <form action="afiseaza_filmele_actorului.jsp" method="post">
                <button type="submit">Distributie actor</button>
            </form>
        </td>
        <td>
            <form action="actori_cu_oscar.jsp">
                <input type="submit" value="Actori cu oscar">
            </form>
        </td>

    </tr>
</table>
<br>
<table>
    <tr>
        <td><A HREF="index.jsp">Home</A></td>
        <td><A href="actori.jsp">Actori</A></td>
    </tr>
</table>
<footer>

    (C)  Slanina Sergiu 2019
</footer>

</body>
</html>

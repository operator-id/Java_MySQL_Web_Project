<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 24/11/2019
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="imdb.sergiu.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Oscaruri</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h5>Oscaruri</h5>
<table border=1 id="tabelOscari" class="center" style="width: 70%; border-collapse: collapse; border-color: red;">
    <tr>
        <td>ID</td>
        <td>Nume Actor</td>
        <td>Prenume Actor</td>
        <td>Titlu Film</td>
        <td>An Aparitie Film</td>
        <td>Rating Film</td>
        <td>An Oscar</td>
        <td>Categorie</td>

    </tr>
    <%

        String allOscars = "";
        ArrayList<Oscar> oscaruri = new ArrayList();

        GestiuneOscar go = new GestiuneOscar();
        GestiuneActor ga = new GestiuneActor();
        GestiuneFilm gf = new GestiuneFilm();
        oscaruri = go.getListaOscaruri();
        for (Oscar oscar : oscaruri) {
            Actor actor = ga.getDateActor(oscar.getIdActor());
            Film film = gf.getDateFilm(oscar.getIdFilm());

            allOscars += "<tr><td>" + oscar.getId() + "</td><td>" + actor.getNume() + "</td><td>" + actor.getPrenume() + "</td><td>" +
                    film.getTitlu() + "</td><td>" + film.getAnAparitie() + "</td><td>" + film.getRating() +
                    "</td><td>" + oscar.getAnul() + "</td><td>" + oscar.getCategorie() + "</td></tr>";

        }

    %>
    <%=allOscars%>
</table>
<br>
<A HREF="index.jsp">Home</A>
</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>

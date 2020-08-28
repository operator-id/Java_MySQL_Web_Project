<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 24/11/2019
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="imdb.sergiu.GestiuneRegizor" %>
<%@ page import="imdb.sergiu.Regizor" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Regizor</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h5>Regizori</h5>
<table border=1 id="tabelRegizori" class="center" style="width: 70%; border-collapse: collapse; border-color: red;">
    <tr>
        <td>ID</td>
        <td>Nume</td>
        <td>Prenume</td>
        <td>Anul Nasterii</td>
        <td>Locul Nasterii</td>

    </tr>
    <%

        String allRegizors = "";
        ArrayList<Regizor> regizori = new ArrayList();
        GestiuneRegizor gr = new GestiuneRegizor();
        regizori = gr.getListaRegizori();
        for (Regizor regizor : regizori) {
            allRegizors += "<tr><td>" + regizor.getId() + "</td><td>" + regizor.getNume() + "</td><td>" + regizor.getPrenume() + "</td><td>" + regizor.getDataNasterii() +
                    "</td><td>" + regizor.getLoculNasterii() + "</td></tr>";

        }

    %>
    <%=allRegizors%>
</table>
<br>
<table class="center">
    <tr>
    <td>
    <form action="adauga_persoana_noua.jsp" method="post">
        <input type="hidden" name="tip" value="regizor">
        <button type="submit">Adauga regizor</button>
    </form>
    <td>
        <form action="afiseaza_filmele_actorului.jsp" method="post">
            <button type="submit">Filmele regizorului</button>
        </form>
    </td>
    </tr>
    </table>

<BR>
<A HREF="index.jsp">Home</A>
</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>

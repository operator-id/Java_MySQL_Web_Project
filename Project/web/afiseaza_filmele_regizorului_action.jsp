<%@ page import="imdb.sergiu.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 10/12/2019
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Regie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h4>Regie</h4>
<%
    int id = Integer.parseInt(request.getParameter("id"));


    GestiuneRegizor gestiuneRegizor = new GestiuneRegizor();
    GestiuneRegie gestiuneRegie = new GestiuneRegie();
    GestiuneFilm gestiuneFilm = new GestiuneFilm();
    ArrayList<Regie> regie = gestiuneRegie.getListaRegiei();

    Regizor regizor = gestiuneRegizor.getDateRegizor(id);
    ArrayList<Film> filme = new ArrayList();


    for(Regie row: regie){
        if(regizor.getId() == row.getIdRegizor()){
            filme.add(gestiuneFilm.getDateFilm(row.getIdFilm()));
        }

    }
%>
<h5>Actor</h5>
<p>
    <%=regizor.getNume()%>
    <%=regizor.getPrenume()%>
    <%=regizor.getDataNasterii()%>
    <%=regizor.getLoculNasterii()%>
</p>
<h5>Filme</h5>
<BR>
<table border=1 id="tabelFilme" class="center" style="width: 70%; border-collapse: collapse; border-color: red;">
    <tr>
        <td>ID</td>
        <td>Titlu</td>
        <td>Durata</td>
        <td>An Aparitie</td>
        <td>Rating</td>
        <td>Descriere</td>

    </tr>


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
<BR>
<table class="center">
    <tr>
        <td><A HREF="index.jsp">Home</A></td>
        <td><A href="regizori.jsp">Regizori</A></td>
    </tr>
</table>

</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>

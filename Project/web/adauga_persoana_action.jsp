<%@ page import="imdb.sergiu.Actor" %>
<%@ page import="imdb.sergiu.GestiuneActor" %>
<%@ page import="imdb.sergiu.GestiuneRegizor" %>
<%@ page import="imdb.sergiu.Regizor" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html >


<html>
<head>

    <title>Adaugare Persoana</title>

</head>
<body>


<%
    String rezultat = "";

    String nume = request.getParameter("nume");
    String prenume = request.getParameter("prenume");
    java.sql.Date data = null;

    String localitate = request.getParameter("loc");
    String tip = request.getParameter("tip");
    try {
        data = java.sql.Date.valueOf(request.getParameter("data"));
    } catch (Exception ex){
        rezultat = "Eroare format data";
    }

    session.setAttribute("nume", nume);
    session.setAttribute("prenume", prenume);
    session.setAttribute("loc", localitate);
    session.setAttribute("data", request.getParameter("data"));

if(data != null) {
    rezultat = "Date trimise";
    if (tip.equals("actor")) {
        GestiuneActor ga = new GestiuneActor();
        ga.salveazaActor(new Actor(nume, prenume, data, localitate));

    } else if (tip.equals("regizor")) {
        GestiuneRegizor gr = new GestiuneRegizor();

        gr.salveazaRegizor(new Regizor(nume, prenume, data, localitate));
    }
}
%>


<B><%=rezultat%>
</B>

<BR>
<td><A HREF="adauga_persoana_noua.jsp">BACK</A></td>
<BR>


<br>
<br>


<br>
<table class="center">
    <tr>
        <td><A HREF="index.jsp">Home</A></td>
        <td><A href="actori.jsp">Actori</A></td>
    </tr>
</table>


</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>



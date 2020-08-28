<%@ page import="imdb.sergiu.Actor" %>
<%@ page import="imdb.sergiu.GestiuneActor" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html >


<html>
<head>

    <title>Rezultatul cautarii</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>


<%
    String id = request.getParameter("id");
    String nume = request.getParameter("nume");


    int idClient = Integer.parseInt(id);
    GestiuneActor ga = new GestiuneActor();
    Actor actorCautat = ga.getDateActor(idClient);


%>

Pagina va cauta persoana cu id= <B><%=id%>
</B>

<BR>

<BR>
parametrul nume este <%=nume%>

<br>
<br>

<%=actorCautat%>

<br>
<A HREF="index.jsp">Home</A>


</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>



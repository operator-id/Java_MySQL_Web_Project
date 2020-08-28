<%@ page import="imdb.sergiu.Actor" %>
<%@ page import="imdb.sergiu.GestiuneActor" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>

    <title>Rezultatul cautarii</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>


<%

    String id = request.getParameter("id");
    String numeNou = request.getParameter("nume");
    String prenumeNou = request.getParameter("prenume");


    int idActor = Integer.parseInt(id);
    GestiuneActor ga = new GestiuneActor();
    Actor actorCautat = ga.getDateActor(idActor);
    if (!numeNou.equals("")) {
        ga.modificaNumeActor(idActor, numeNou);
    }
    if (!prenumeNou.equals("")) {
        ga.modificaPrenumeActor(idActor, prenumeNou);
    }
    Actor actorModificat = ga.getDateActor(idActor);
%>

persoana cu id = <B><%=id%>
</B> inainte de modificare:

<BR>
<%=actorCautat%>
<BR>
persoana cu id = <B><%=id%>
</B> dupa modificare:

<BR>
<%=actorModificat%>


<br>
<table>
    <tr>
        <td><A HREF="filme.jsp">Filme</A></td>
        <td><A HREF="index.jsp">Home</A></td>
    </tr>

</table>


</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>



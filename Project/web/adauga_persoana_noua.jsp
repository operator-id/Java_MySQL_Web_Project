<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 02/12/2019
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Adauga Persoana</title>


</head>
<body>
<%
    String tip = request.getParameter("tip");


    String nume = "";
    String prenume = "";
    String loc = "";
    String data = "";
    if(session.getAttribute("nume") != null) {

         nume = (String) session.getAttribute("nume");
         prenume = (String) session.getAttribute("prenume");
         loc = (String) session.getAttribute("loc");
         data = (String) session.getAttribute("data");
    }

%>
<form onsubmit="return validation();" action="adauga_persoana_action.jsp" method="post">
    <p>Adaugare persoana
    </p>
    <input id="nume" name="nume" placeholder="Nume" type="text" value="<%=nume%>"/>
    <BR>
    <input id="prenume" name="prenume" placeholder="Prenume" type="text" value="<%=prenume%>"/>
    <BR>
    <input id="data" name="data" placeholder="Data Nasterii aaaa-ll-zz" type="text" value="<%=data%>"/>
    <BR>
    <input id="loc" name="loc" placeholder="Locul Nasterii" type="text" value="<%=loc%>"/>
    <BR>
    <div id="result"></div>
    <BR>
    <input type="hidden" name="tip" value=<%=tip%>>
    <button type="submit">Adauga</button>
</form>
<script type="text/javascript">
    function validation() {

        var nume = document.getElementById("nume").value;
        var prenume = document.getElementById("prenume").value;
        var data = document.getElementById("data").value;
        var loc = document.getElementById("loc").value;
        if (nume.trim ==='' || prenume.trim() === '' || data.trim() === '' || loc.trim() === '') {


            document.getElementById('result').innerText = 'Toate campurile trebuie completate';

            return false;

        }
        var dateFormat = /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/;
        if(!data.match(dateFormat)) {
            document.getElementById('result').innerText = 'Format data gresit';
            return false;
        }
        else {

            return true;
        }
    }


</script>
<br>
<A HREF="index.jsp">Home</A>
</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>
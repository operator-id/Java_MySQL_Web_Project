<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 10/12/2019
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Afiseaza filme</title>
    <link rel="stylesheet" href="style.css">

</head>
<body>
<h5>Afiseaza filme</h5>
<form onsubmit="return validation();" action="afiseaza_filmele_actorului_action.jsp"  method="post">
    <input name="id" id="id" placeholder="ID" type="text"/>
    <BR>
    <p id="warning"> </p>
    <BR>
    <button type="submit">Afiseaza</button>

</form>

<script type="text/javascript">
    function validation() {
        var id = document.getElementById("id");

        if (id.value.trim() === ''){
            document.getElementById("warning").innerText = 'Trebuie completate campurile';
            return false}
         if(( isNaN(id.value)) || (id.value%1 !== 0 ) || id.value < 1 ){
            document.getElementById("warning").innerText = 'ID-ul trebuie sa fie un numar intreg';
            return false;
        }
        else return true;
    }
</script>

<BR>
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

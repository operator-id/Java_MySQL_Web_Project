<%--
  Created by IntelliJ IDEA.
  User: L440
  Date: 24/11/2019
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificare Actor</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Modificare actor</h1>
<form onsubmit="return validation()" action="modifica_actor_action.jsp" method="post">
    ID <input type="text" name="id" id="id">
    <br>
    Nume Nou <input type="text" name="nume" id="nume">
    <br>
    Prenume Nou<input type="text" name="prenume" id="prenume">
    <BR>
    <div id="result"></div>
    <br>
    <button type="submit" >Modifica</button>

</form>


<BR>
<script type="text/javascript">
    function validation() {
        var id = document.getElementById("id").value;
        var nume = document.getElementById("nume").value;
        var prenume = document.getElementById("prenume").value;
        if(id.trim() ==='' || (typeof id !== 'number' && id%1 != 0)){
            document.getElementById('result').innerText = 'Campul "ID" este gol sau nu este Integer';
            return false;
        }
        if( ( nume.trim()==='' && prenume.trim()==='')){
            document.getElementById('result').innerText = 'Unul dintre campuri trebuie completat';
            return false;
        }
        else{return true}
    }

</script>
<br>
<A HREF="index.jsp">Home</A>


</body>
<footer>

    (C)  Slanina Sergiu 2019
</footer>
</html>

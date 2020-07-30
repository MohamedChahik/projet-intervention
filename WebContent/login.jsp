<%@ page import ="controleur.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <style>
 body {
  min-height: 100vh;
  position: relative;
  margin: 0;
}
.container {
    min-height:100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Connexion </title>
</head>
<body>
    <section class="features-icons bg-dark text-center" id="middle">
    <div class="container">
    <br>
    <h1 style='margin-top: 10%' class="text-white">Connexion à votre compte</h1>
    <br>

    <div class="text-align-center text-white">
    <form method ="post" action="">
    <div>
    <label> Email:  <input type="text" class='text-center form-control' name="email"></label>
    </br>
    <label>Password : <input type="password" class='text-center form-control' name="password"></label>
    </br>
    </div>
	<br>
    <input type="submit" class='btn btn-lg btn-primary' name="ouvrir" value="Se connecter">
    </form>
    </div>
    </div>
    </section>
      <footer class="navbar-fixed-bottom bg-secondary text-light">
        <div class="text-center bg-secondary">
            <small>Site créé dans le cadre d'un projet à l'école Iris</small><br>
            <small>MyTickets designed and created by <a href="fnac.com" style="color:orange">FNAC</a>.© 2020-2020</small>
            <br>
            <br>
        </div>
    </footer>
</body>
<%
    if(request.getParameter("ouvrir") !=null)
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        request.getSession();
        session.setAttribute("email", email);
        session.setAttribute("password", password);

        response.sendRedirect(response.encodeRedirectURL("http://localhost:8080/ticket/index.jsp"));

    }
%>

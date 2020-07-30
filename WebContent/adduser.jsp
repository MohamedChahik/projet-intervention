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
<title>Gestion d'un ticket </title>
</head>
<body>
<nav class="navbar navbar-dark bg-dark navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="http://localhost:8080/ticket/index.jsp">Projet Ticket</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Tickets
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="http://localhost:8080/ticket/index.jsp">Voir les tickets</a>
          <a class="dropdown-item" href="http://localhost:8080/ticket/ajout.jsp">Créer un ticket</a>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/ticket/users.jsp">Utilisateurs</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/ticket/logout.jsp">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<%!
    User unUser ;
%>


<%

java.util.ArrayList<Intervention> lesInterventions = Controleur.selectAllInterventions();
java.util.ArrayList<User> lesUsers = Controleur.selectAllUsers();

if (Controleur.checkConnection(request) == 0){
	response.sendRedirect("http://localhost:8080/ticket/login.jsp");
}

if(request.getParameter("ouvrir") !=null)
{
	java.nio.charset.Charset UTF_8 = java.nio.charset.Charset.forName("UTF-8");
	java.nio.charset.Charset ISO = java.nio.charset.Charset.forName("ISO-8859-1");
	
    String email = new String (request.getParameter("email").getBytes(ISO), UTF_8);
    String password = new String (request.getParameter("password").getBytes(ISO), UTF_8);
    String roles = new String (request.getParameter("roles").getBytes(ISO), UTF_8);
    
    
  	String api_token = "";
    Integer tickets_id;
    Integer id = 0;
    Integer actif = 1;
    
    unUser = new User (
    		id,
    		email,
    		roles,
    		password,
    		api_token,
    		actif);
    
    //insertion de ce compte dans la bdd 

    Controleur.insertUser(unUser);
    response.sendRedirect(response.encodeRedirectURL("http://localhost:8080/ticket/users.jsp"));

}
%>

<section class="features-icons bg-dark text-center" id="middle">
<div class="container">
<br>
<h1 class="text-white">Création du ticket</h1>
<p class="text-white"> Veuillez renseigner le formulaire </p>
<br>

<div class="text-align-center text-white">
<form method ="post" action="">
<div>
<label >Email :  <input type="text" class='text-center form-control' name="email" required></label>
</br>
<label>Mot de passe : <input type="password" class='text-center form-control' name="password" required></label>
</br>
<label>Role : <select type='text' class='text-center form-control' name='roles'>
<option value='ROLE_ADMIN'>ROLE_ADMIN</option>
<option value='ROLE_TECH'>ROLE_TECH</option>
</select></label>
<br/>

</div>
<br>
<input type="submit" class='btn btn-lg btn-primary' name="ouvrir" value="Créer">
</form>
</div>
<br>
</div>
</section>
    <footer class="navbar-fixed-bottom bg-secondary text-light">
        <div class="text-center bg-secondary">
            <small>Site créé dans le cadre d'un projet à l'école Iris</small><br>
            <small>MyTickets designed and created by <a href="fnac.com" style="color:orange">FNAC</a>.© 2020-2020</small>
        </div>
    </footer>


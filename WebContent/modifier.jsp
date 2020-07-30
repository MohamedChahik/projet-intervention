<%@ page import ="controleur.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/5fa8b69455.js" crossorigin="anonymous"></script>
<title>Gestion d'un ticket </title>
</head>
<body>
<%!
Ticket unTicket ;
Intervention uneIntervention ;
Intervention intervention ;
User unUser ;
User user ;
User currentUser ;

%>
<%
if (Controleur.checkConnection(request) == 0){
	response.sendRedirect("http://localhost:8080/ticket/login.jsp");
	return;
}

currentUser = Controleur.getCurrentUser(request);
%>
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
      <%
      if (currentUser.getRoles().equals("ROLE_ADMIN")){
    	  out.print("<li class='nav-item'><a class='nav-link' href='http://localhost:8080/ticket/users.jsp'>Utilisateurs</a></li>");
      }
      %>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/ticket/logout.jsp">Logout</a>
      </li>
    </ul>
  </div>
</nav>
<section class="features-icons bg-dark text-center" id="middle">
<div class="container">
        <br>
        <h1 class="text-white">Modification du ticket</h1>
        <br>
<%

if (request.getParameter("idticket") != null)
{
	java.util.ArrayList<Intervention> lesInterventions = Controleur.selectAllInterventions();
	java.util.ArrayList<User> lesUsers = Controleur.selectAllUsers();
	
	int id = Integer.parseInt(request.getParameter("idticket"));
	Ticket unTicket = Controleur.selectTicketById (id);
	intervention = Controleur.selectInterventionById(unTicket.getIntervention_id());
	user = Controleur.selectUserById(unTicket.getUser_id());
	out.print("<form style='color:white'method ='post' action=''><div><label >Titre : <input value ='"+unTicket.getTitre()+"' type='text' class='text-center form-control' name='titre' required> </label></br>");
	out.print("<label>Description : <input value='"+unTicket.getDescription()+"' type='text' class='text-center form-control' name='description' required></label></br>");
	out.print("<label>Statut : <select type='text' class='text-center form-control' name='statut' required></label>"+
			  " <option selected hidden>"+unTicket.getStatut()+
			  "</option><option value='Résolu'>Résolu</option><option value='Expiré'>Expiré</option><option value='En cours'>En cours</option><option value='En attente'>En attente</option></select><br>");
	out.print("<label>Date de création : <input value='"+unTicket.getDateCreation()+"' type='date' class='text-center form-control' name='dateCreation' readonly></label></br>");
	out.print("<label>Date d'expiration : <input value='"+unTicket.getDateExpiration()+"' type='date' class='text-center form-control' name='dateExpiration' required></label></br>");
	out.print("<label>Intervention : <select type='text' class='text-center form-control' name='intervention_id'></label>");
	out.print("<option value='"+intervention.getId()+"' selected hidden>"+intervention.getTitre()+"</option>");
	for (Intervention uneIntervention : lesInterventions) {
		out.print("<option value='"+uneIntervention.getId()+"'>"+uneIntervention.getTitre()+"</option>");
	}
	out.print("</select>");
	if (currentUser.getRoles().equals("ROLE_ADMIN")){
		out.print("<label>User : <select type='text' class='text-center form-control' name='user_id'></label>");
		out.print("<option value='"+user.getId()+"' selected hidden>"+user.getEmail()+"</option>");
		for (User unUser : lesUsers) {
			out.print("<option value='"+unUser.getId()+"'>"+unUser.getEmail()+"</option>");
		}
		out.print("</select>");	
	}
	out.print("<br/></div><input type='submit' class='btn btn-lg btn-primary' name='ouvrir' value='Modifier'></form>"); 
}
if (request.getParameter("ouvrir") != null)
{
	Integer id = Integer.parseInt(request.getParameter("idticket"));
	Ticket unTicket = Controleur.selectTicketById (id);
	java.nio.charset.Charset UTF_8 = java.nio.charset.Charset.forName("UTF-8");
	java.nio.charset.Charset ISO = java.nio.charset.Charset.forName("ISO-8859-1");
	
    String titre = new String (request.getParameter("titre").getBytes(ISO), UTF_8);
    String description = new String (request.getParameter("description").getBytes(ISO), UTF_8);
    String statut = new String (request.getParameter("statut").getBytes(ISO), UTF_8);
    
    
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.util.Date langDate = sdf.parse(request.getParameter("dateCreation"));
    java.sql.Date dateCreation = new java.sql.Date(langDate.getTime());
    
    java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.util.Date langDate2 = sdf2.parse(request.getParameter("dateExpiration"));
    java.sql.Date dateExpiration = new java.sql.Date(langDate2.getTime());
    
    Integer user_id = unTicket.getUser_id();
  	Integer intervention_id = Integer.parseInt(request.getParameter("intervention_id"));
  	if (currentUser.getRoles().equals("ROLE_ADMIN")){
  		user_id = Integer.parseInt(request.getParameter("user_id")) ;
  	}
    
    unTicket = new Ticket (
    		id,
    		intervention_id,
    		user_id,
    		titre,
    		description,
    		statut,
    		dateCreation,
    		dateExpiration);
    
    //insertion de ce compte dans la bdd 

    Controleur.updateTicket(unTicket);
    response.sendRedirect(response.encodeRedirectURL("http://localhost:8080/ticket/index.jsp"));
    
}

%>

<div class="text-align-left">
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
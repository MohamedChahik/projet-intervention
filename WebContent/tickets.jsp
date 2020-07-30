<%@ page import ="controleur.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.bootstrap4.min.css">
 
 <style>
 body {
  min-height: 100vh;
  position: relative;
  margin: 0;
}
.container-fluid {
    min-height:100%;
}
</style>
 
<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/5fa8b69455.js" crossorigin="anonymous"></script>
<title>Gestion d'un ticket </title>
</head>
<body>
<%!

Ticket unTicket ;

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
       <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/ticket/users.jsp">Utilisateurs</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/ticket/logout.jsp">Logout</a>
      </li>
    </ul>
  </div>
</nav>
<section class="features-icons bg-dark text-center" id="middle">
<div class="container-fluid">
        <br>
        <h1 class="text-white">Tickets</h1>
        <br>

<script type="text/javascript">
$(document).ready(function() {
$('#data-tables').DataTable({
	"bInfo" : false,
	"lengthChange": false
});
document.getElementById('data-tables_filter').style["color"] = "white";
} );
</script>

<%

if (Controleur.checkConnection(request) == 0){
	response.sendRedirect("http://localhost:8080/ticket/login.jsp");
}

if (request.getParameter("statut") != null)
{
	Integer idticket = Integer.parseInt(request.getParameter("idticket"));	
	Integer statut = Integer.parseInt(request.getParameter("statut"));
	
	Controleur.updateStatut(idticket, statut);
	
}
if (request.getParameter("iduser") != null){
	Integer iduser = Integer.parseInt(request.getParameter("iduser"));	
	java.util.ArrayList<Ticket> lesTickets = Controleur.selectAllTickets();
	// parcourir les comptes
	out.print("<table id='data-tables' class=\"table table-dark\"> <thead> <tr><th> ID </th><th> Titre </th><th> Description </th> <th> Statut </th> <th> Date de création </th>" + "<th> Date d'expiration </th><th> Intervention </th><th> Technicien </th> <th> Actions </th> </tr></thead><tbody>" );
	for (Ticket unTicket : lesTickets) {
		if (unTicket.getUser_id() == iduser){
			 out.print ("<tr>" +
			    		"<td>" + unTicket.getId()+"</td>" +
			            "<td>" + unTicket.getTitre()+"</td>" +
			            "<td>" +unTicket.getDescription() +"</td>" +
			            "<td>" +unTicket.getStatut() +"</td>" +
			            "<td>" + unTicket.getDateCreation()+"</td>" +
			            "<td>" + unTicket.getDateExpiration()+"</td>" +
			            "<td><a href=\"http://localhost:8888/project-2/public/intervention/"+unTicket.getIntervention_id()+"\">Plus de détails</td>" +
			            "<td><a href=\"http://localhost:8080/ticket/technicien.jsp?idtechnicien="+unTicket.getUser_id()+"\">Plus de détails</td>" +
			            "<td><a href=\"http://localhost:8080/ticket/index.jsp?idticket="+unTicket.getId()+"&statut=1\"><i class='fa fa-check-square' style='font-size:26px; color:green'></i>"+
			            " <a href=\"http://localhost:8080/ticket/index.jsp?idticket="+unTicket.getId()+"&statut=0\"><i class='fa fa-minus-square' style='font-size:26px; color:red'></i>"+
			            " <a href=\"http://localhost:8080/ticket/modifier.jsp?idticket="+unTicket.getId()+"\"><i class='fa fa-pencil-square' style='font-size:26px; color:orange'></i></td>" +
			            "</tr>"
			    );	
		}
	}
	out.print("</tbody></table>");	
}


%>

<div class="text-align-left">
<a href="http://localhost:8080/ticket/ajout.jsp" type="button" class="btn btn-lg btn-primary">Créer un ticket</a>
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

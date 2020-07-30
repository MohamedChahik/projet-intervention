package controleur;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import modele.Modele;

public class Controleur {
	
		
		public static Integer checkConnection(HttpServletRequest request) {
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			
			if (email != null && password != null) {
				return Modele.checkConnection(email, password);
			}
			return 0;
		}

		public static void insertTicket (Ticket unTicket)
		{
			//appel du modele
			//on peut realiser des controle sur les données avant insertion
			Modele.insertTicket(unTicket);
		}
		
		public static void insertUser (User unUser)
		{
			//appel du modele
			//on peut realiser des controle sur les données avant insertion
			Modele.insertUser(unUser);
		}
		
		public static void updateTicket(Ticket unTicket)
		{
			Modele.updateTicket(unTicket);
		}
		
		public static void updateUser(User unUser)
		{
			Modele.updateUser(unUser);
		}
		
		public static boolean deleteUser(Integer id)
		{
			return Modele.deleteUser(id);
		}
		
		public static void updateUserStatut(Integer id, Integer actif)
		{
			Modele.updateUserStatut(id, actif);
		}
		
		public static void updateStatut(int idticket, int statut)
		{
			Modele.updateStatut(idticket, statut);
		}
		
		public static ArrayList<Ticket> selectAllTickets()
		{
			return Modele.selectAllTickets();
		}
		
		public static ArrayList<Intervention> selectAllInterventions()
		{
			return Modele.selectAllInterventions();
		}
		
		public static ArrayList<User> selectAllUsers()
		{
			return Modele.selectAllUsers();
		}
		
		public static Ticket selectTicketById(int idticket)
		{
			return Modele.selectTicketById(idticket);
		}
		
		public static Intervention selectInterventionById(int id)
		{
			return Modele.selectInterventionById(id);
		}
		
		public static User selectUserById(int idtechnicien)
		{
			return Modele.selectUserById(idtechnicien);
		}
		
		public static User getCurrentUser(HttpServletRequest request) {
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			return Modele.getCurrentUser(email);
		}
}

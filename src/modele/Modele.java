
package modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import controleur.Intervention;
import controleur.Ticket;
import controleur.User;

public class Modele 
{
    private static Bdd uneBdd = new Bdd("localhost", "ressources", "root", "");
    
    public static ArrayList<Ticket> selectAllTickets()
    {
        ArrayList<Ticket> lesTickets = new ArrayList <Ticket>();
        String requete = "select * from tickets";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            while (desRes.next ())
            {
                Ticket unTicket = new Ticket (
                		 desRes.getInt("id"),
                         desRes.getInt("intervention_id"),
                         desRes.getInt("user_id"), desRes.getString("titre"),
                         desRes.getString("description"),
                         desRes.getString("statut"),
                         desRes.getDate("dateCreation"), desRes.getDate("dateExpiration")
                );
                lesTickets.add(unTicket);
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return lesTickets;
    }
    
    public static ArrayList<Intervention> selectAllInterventions()
    {
        ArrayList<Intervention> lesInterventions = new ArrayList <Intervention>();
        String requete = "select * from res_intervention";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            while (desRes.next ())
            {
                Intervention uneIntervention = new Intervention (
		               		 desRes.getInt("id"),
		                     desRes.getString("titre"),
		                     desRes.getString("description"), desRes.getString("lieu"),
		                     desRes.getDate("date"),
		                     desRes.getInt("entreprise_id")
		            );
                lesInterventions.add(uneIntervention);
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return lesInterventions;
    }
    
    public static ArrayList<User> selectAllUsers()
    {
        ArrayList<User> lesUsers = new ArrayList <User>();
        String requete = "select * from user";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            while (desRes.next ())
            {
                User unUser = new User (
	               		 desRes.getInt("id"),
	                     desRes.getString("email"),
	                     desRes.getString("roles"), desRes.getString("password"),
	                     desRes.getString("api_token"),
	                     desRes.getInt("actif")
            );
                lesUsers.add(unUser);
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return lesUsers;
    }
    
    public static Ticket selectTicketById (int idticket)
    {
    	Ticket unTicket = null;
        String requete = "select * from tickets where id="+idticket+";";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            if (desRes.next())
            {
                unTicket = new Ticket (
                		 desRes.getInt("id"),
                         desRes.getInt("intervention_id"),
                         desRes.getInt("user_id"), desRes.getString("titre"),
                         desRes.getString("description"),
                         desRes.getString("statut"),
                         desRes.getDate("dateCreation"), desRes.getDate("dateExpiration")
                );
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return unTicket;
    }
    
    public static User selectUserById (int idtechnicien)
    {
    	User unUser = null;
        String requete = "select * from user where id="+idtechnicien+";";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            if (desRes.next())
            {
                unUser = new User (
                		 desRes.getInt("id"),
                         desRes.getString("email"),
                         desRes.getString("roles"), desRes.getString("password"),
                         desRes.getString("api_token"),
                         desRes.getInt("actif")
                );
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return unUser;
    }
    
    public static Intervention selectInterventionById (int id)
    {
    	Intervention uneIntervention = null;
        String requete = "select * from res_intervention where id="+id+";";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            if (desRes.next())
            {
                uneIntervention = new Intervention (
                		 desRes.getInt("id"),
                         desRes.getString("titre"),
                         desRes.getString("description"), desRes.getString("lieu"),
                         desRes.getDate("date"),
                         desRes.getInt("entreprise_id")
                );
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return uneIntervention;
    }

    public static void insertTicket (Ticket unTicket )
    {
        String requete="insert into tickets values(null, \""+unTicket.getStatut()+"\",\""
                +unTicket.getTitre() +"\",\"" + unTicket.getDescription()
                +"\",'" + unTicket.getDateCreation() +"','" + unTicket.getDateExpiration()+"','"
                +unTicket.getIntervention_id()+"','"+unTicket.getUser_id()+"');";
        executer (requete);
    }
    
    public static void insertUser (User unUser )
    {
        String requete="insert into user values(null, \""+unUser.getEmail()+"\",\""
                +unUser.getRoles() +"\", \""+unUser.getPassword()+"\", null, null);";
        executer (requete);
    }
    
    
    public static void updateTicket (Ticket unTicket )
    {
    	System.out.print("ICI JE SUIS LA");
        String requete="update tickets "
        		+ "set titre = '" + unTicket.getTitre() +"', "
        		+ "description = '" + unTicket.getDescription() +"', "
        		+ "statut = '" + unTicket.getStatut() +"', "
        		+ "dateExpiration = '" + unTicket.getDateExpiration() +"', "
        		+ "intervention_id = " + unTicket.getIntervention_id() +", "
        		+ "user_id = " + unTicket.getUser_id() +" "
        		+ "where id = "+unTicket.getId()+";";
        executer (requete);
    }
    
    public static void updateUser (User unUser )
    {
    	System.out.print(unUser.getActif());
        String requete="update user "
        		+ "set email = '" + unUser.getEmail() +"', "
        		+ "password = '" + unUser.getPassword() +"', "
        		+ "actif = " + unUser.getActif() +", "
        		+ "roles = '" + unUser.getRoles() +"' "
        		+ "where id = "+unUser.getId()+";";
        executer (requete);
    }
    
    public static boolean deleteUser (Integer id)
    {
    	String requeteVerif="select * from tickets where user_id = "+id+";";
        String requete="delete from user "
        		+ "where id = "+id+";";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requeteVerif);
            if (desRes.next())
            {
            	uneBdd.seDeConnecter();
            	return false;
            } else {
            	uneBdd.seDeConnecter();
            	executer(requete);
            	return true;
            }
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return false;
    }
    
    public static void updateStatut(int idticket, int statut)
    {
    	String requete = null;
    	if (statut == 0) {
    		requete="update tickets set statut ='Expiré' where id = '"+idticket+"';";
    	} else if (statut == 1) {
    		requete="update tickets set statut ='Résolu' where id = '"+idticket+"';";
    	}
    	if (requete != null) {
    		executer (requete);
    	}
    }
    
    public static void updateUserStatut(int id, int actif)
    {
    	String requete = null;
    	if (actif == 0) {
    		requete="update user set actif = 1 where id = "+id+";";
    	} else if (actif == 1) {
    		requete="update user set actif = 0 where id = "+id+";";
    	}
    	if (requete != null) {
    		executer (requete);
    	}
    }
    
    public static void executer (String requete)
    {
        try
        {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            unStat.execute(requete);
            //unStat.close();
            uneBdd.seDeConnecter();
        }
        catch (SQLException exp)
        {
            System.out.println("Erreur d'execution :" + requete);
        }

    }

    public static Integer checkConnection(String email, String password)
    {
        ArrayList<User> lesUsers = new ArrayList <User>();
        String requete = "select * from user";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            while (desRes.next ())
            {
            	if (email.equals(desRes.getString("email")) && password.equals(desRes.getString("password"))) {
            		if (desRes.getInt("actif") == 1) {
            			uneBdd.seDeConnecter();
                		return 1;	
            		}
            	}
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return 0;
    }
    
    public static User getCurrentUser(String email)
    {
    	User unUser = null;
        String requete = "select * from user";
        try {
            uneBdd.seConnecter();
            Statement unStat = uneBdd.getMaConnexion().createStatement();
            ResultSet desRes = unStat.executeQuery(requete);
            while (desRes.next ())
            {
            	if (email.equals(desRes.getString("email"))) {
                    unUser = new User (
                   		 	desRes.getInt("id"),
                            desRes.getString("email"),
                            desRes.getString("roles"), desRes.getString("password"),
                            desRes.getString("api_token"),
                            desRes.getInt("actif")
                   );
            		uneBdd.seDeConnecter();
            		return unUser;
            	}
            }
            uneBdd.seDeConnecter();
        } catch (SQLException exp)
        {
          exp.printStackTrace();
        }
        return unUser;
    }
}
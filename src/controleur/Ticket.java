package controleur;

import java.sql.Date;

public class Ticket {
	
    private int id, intervention_id, user_id;
    private String titre, description, statut;
    private Date dateCreation, dateExpiration;
	
    public Ticket(int id, int intervention_id, int user_id, String titre, String description, String statut, Date dateCreation,
    		Date dateExpiration) {
    	this.id = id;
		this.intervention_id = intervention_id;
		this.user_id = user_id;
		this.titre = titre;
		this.description = description;
		this.statut = statut;
		this.dateCreation = dateCreation;
		this.dateExpiration = dateExpiration;
	}
    
	 public String consulter()
	    {
	        return "Ticket: " + this.id+
	        		"<br/>Prenom : " +this.titre +
	        		"<br/> Numero :" +this.description +
	        		"<br/> Solde :" +this.dateCreation +
	        		"</br>";
	    }

	public int getIntervention_id() {
		return intervention_id;
	}

	public void setIntervention_id(int intervention_id) {
		this.intervention_id = intervention_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDateCreation() {
		return dateCreation;
	}

	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}

	public Date getDateExpiration() {
		return dateExpiration;
	}

	public void setDateExpiration(Date dateExpiration) {
		this.dateExpiration = dateExpiration;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}
	
    
    
    
}

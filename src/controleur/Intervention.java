package controleur;

import java.util.Date;

public class Intervention {
    private int id;
    private String titre, description, lieu;
    private Date date;
    private int entreprise_id;
    
	public Intervention(int id, String titre, String description, String lieu, Date date, int entreprise_id) {
		this.id = id;
		this.titre = titre;
		this.description = description;
		this.lieu = lieu;
		this.date = date;
		this.entreprise_id = entreprise_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getLieu() {
		return lieu;
	}

	public void setLieu(String lieu) {
		this.lieu = lieu;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getEntreprise_id() {
		return entreprise_id;
	}

	public void setEntreprise_id(int entreprise_id) {
		this.entreprise_id = entreprise_id;
	}
    
	
    
}
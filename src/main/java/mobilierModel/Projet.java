package mobilierModel;

import java.util.Date;

public class Projet {
	int id, count;
	String etat, description, date, image, nom, unite, ville;
	Date date_ajout;
	
	public Projet() {
		super();
	}
	
	//select tous les projets
	public Projet(int id, String etat, String description, String date, String image, String nom, Date date_ajout, String unite, 
			String ville) {
		super();
		this.id = id;
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.image = image;
		this.nom = nom;
		this.date_ajout = date_ajout;
		this.unite = unite;
		this.ville = ville;
	}

	// ajouter projet
	public Projet(String etat, String description, String date, String image, String nom, String unite, String ville) {
		super();
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.image = image;
		this.nom = nom;
		this.unite = unite;
		this.ville = ville;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Date getDate_ajout() {
		return date_ajout;
	}

	public void setDate_ajout(Date date_ajout) {
		this.date_ajout = date_ajout;
	}

	public String getUnite() {
		return unite;
	}

	public void setUnite(String unite) {
		this.unite = unite;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}
	
}

package mobilierModel;

import java.util.Date;

public class Contact {
	int id, count;
	String nom, email, sujet, message;
	Date date;
	
	public Contact() {
		super();
	}

	//count reclamation agent
	public Contact(String nom, int count) {
		super();
		this.nom = nom;
		this.count = count;
	}

	//select tous les reclamations agent
	public Contact(String nom, String email, String sujet, String message, Date date, int id) {
		super();
		this.nom = nom;
		this.email = email;
		this.sujet = sujet;
		this.message = message;
		this.date = date;
		this.id = id;
	}

	//ajouter reclamation client
	public Contact(String nom, String email, String sujet, String message) {
		super();
		this.nom = nom;
		this.email = email;
		this.sujet = sujet;
		this.message = message;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}

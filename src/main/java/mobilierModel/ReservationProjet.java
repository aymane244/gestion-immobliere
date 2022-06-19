package mobilierModel;

import java.util.Date;

public class ReservationProjet {
	int id, projet, count;
	String nom, email, phone, date, heure, nomProjet, nomResidence;
	Date ajout;
	Object projetId, projetNom;
	
	public ReservationProjet() {
		super();
	}
	
	//count reservation par client
	public ReservationProjet(String nom, int count) {
		super();
		this.nom = nom;
		this.count = count;
	}

	// ajouter réservation
	public ReservationProjet(String nom, String email, String phone, String date, String heure, int projet) {
		super();
		this.nom = nom;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.heure = heure;
		this.projet = projet;
	}
	
	//select tous les réservations
	public ReservationProjet(int id, String nom, String email, String phone, String date, String heure, int projet, Object projetNom) {
		super();
		this.id = id;
		this.nom = nom;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.heure = heure;
		this.projet = projet;
		this.projetNom = projetNom;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHeure() {
		return heure;
	}
	public void setHeure(String heure) {
		this.heure = heure;
	}
	public int getProjet() {
		return projet;
	}
	public void setProjet(int projet) {
		this.projet = projet;
	}
	public Date getAjout() {
		return ajout;
	}
	public void setAjout(Date ajout) {
		this.ajout = ajout;
	}
	public String getNomProjet() {
		return nomProjet;
	}
	public void setNomProjet(String nomProjet) {
		this.nomProjet = nomProjet;
	}
	public String getNomResidence() {
		return nomResidence;
	}
	public void setNomResidence(String nomResidence) {
		this.nomResidence = nomResidence;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Object getProjetId() {
		return projetId;
	}

	public void setProjetId(Object projetId) {
		this.projetId = projetId;
	}

	public Object getProjetNom() {
		return projetNom;
	}

	public void setProjetNom(Object projetNom) {
		this.projetNom = projetNom;
	}
	
}

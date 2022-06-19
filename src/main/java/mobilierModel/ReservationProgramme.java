package mobilierModel;

import java.util.Date;

public class ReservationProgramme {
	int id, count, programme;
	String nom, email, phone, date, heure, nomProjet, nomResidence;
	Date date_ajout;
	Object programmeId, programmeNom;
	
	public ReservationProgramme() {
		super();
	}
	
	// count reservation par client
	public ReservationProgramme(String nom, int count) {
		super();
		this.nom = nom;
		this.count = count;
	}
	
	//Ajouter réservation
	public ReservationProgramme(String nom, String email, String phone, String date, String heure, int programme) {
		super();
		this.nom = nom;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.heure = heure;
		this.programme = programme;
	}
	
	// select tous les réservations
	public ReservationProgramme(int id, String nom, String email, String phone, String date, String heure,
			int programme, Object programmeNom) {
		super();
		this.id = id;
		this.nom = nom;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.heure = heure;
		this.programme = programme;
		this.programmeNom = programmeNom;
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
	public Date getDate_ajout() {
		return date_ajout;
	}
	public void setDate_ajout(Date date_ajout) {
		this.date_ajout = date_ajout;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getProgramme() {
		return programme;
	}
	public void setProgramme(int programme) {
		this.programme = programme;
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

	public Object getProgrammeId() {
		return programmeId;
	}

	public void setProgrammeId(Object programmeId) {
		this.programmeId = programmeId;
	}

	public Object getProgrammeNom() {
		return programmeNom;
	}

	public void setProgrammeNom(Object programmeNom) {
		this.programmeNom = programmeNom;
	}
	
}

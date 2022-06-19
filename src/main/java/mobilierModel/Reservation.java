package mobilierModel;

import java.util.Date;

public class Reservation {
	int id, bien, count;
	String nom, email, phone, date, heure;
	Date date_ajout;
	Object bienId, bienNom;
	
	public Reservation() {
		super();
	}

	// count reservation par client
	public Reservation(String nom, int count) {
		super();
		this.nom = nom;
		this.count = count;
	}

	//select tous les réservations
	public Reservation(int id, String nom, String email, String phone, String date, String heure, int bien, Object bienNom) {
		super();
		this.id = id;
		this.nom = nom;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.heure = heure;
		this.bien = bien;
		this.bienNom = bienNom;
	}

	// ajouter réservation
	public Reservation(String nom, String email, String phone, String date, String heure, int bien) {
		super();
		this.nom = nom;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.heure = heure;
		this.bien = bien;
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

	public int getBien() {
		return bien;
	}

	public void setBien(int bien) {
		this.bien = bien;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Object getBienId() {
		return bienId;
	}

	public void setBienId(Object bienId) {
		this.bienId = bienId;
	}

	public Object getBienNom() {
		return bienNom;
	}

	public void setBienNom(Object bienNom) {
		this.bienNom = bienNom;
	}
	
}

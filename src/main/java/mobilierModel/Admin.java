package mobilierModel;

import java.sql.Date;

public class Admin {
	String nom, prenom, email, motdepasse, image;
	int id, role;
	Date date;
	Object roleId, roleNom;
	
	public Admin() {
		super();
	}
	
	//Admin inscription avec image
	public Admin(String nom, String prenom, String email, String motdepasse, String image, Object roleId) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.motdepasse = motdepasse;
		this.roleId = roleId;
	}
	
	//select tous les admins
	public Admin(int id, String nom, String prenom, String email, String image, Object roleNom , Object roleId) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.image = image;
		this.roleNom = roleNom;
		this.roleId = roleId;
	}
	
	//admin inscription sans image
	public Admin(String nom, String prenom, String email, String motdepasse, Object roleId) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.motdepasse = motdepasse;
		this.roleId = roleId;
	}
	
	// modifier admin profile aec image
	public Admin(String nom, String prenom, String email, String image, int role, int id) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.image = image;
		this.role=role;
		this.id = id;
	}
	
	//modifier admin profile sans image
	public Admin(String nom, String prenom, String email, int role, int id) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.role = role;
		this.id = id;
	}
	
	//modifier mot de passe admin
	public Admin(String email, String motdepasse) {
		super();
		this.email = email;
		this.motdepasse = motdepasse;
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMotdepasse() {
		return motdepasse;
	}
	public void setMotdepasse(String motdepasse) {
		this.motdepasse = motdepasse;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Object getRoleId() {
		return roleId;
	}
	public void setRoleId(Object roleId) {
		this.roleId = roleId;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public Object getRoleNom() {
		return roleNom;
	}
	public void setRoleNom(Object roleNom) {
		this.roleNom = roleNom;
	}
	
}

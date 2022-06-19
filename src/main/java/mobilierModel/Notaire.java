package mobilierModel;

public class Notaire {
	String nom, prenom, cin, telephone, email, motdepasse, image;
	int id;
	
	public Notaire() {
		super();
	}
	
	//count tous les notaires
	public Notaire(int id) {
		super();
		this.id = id;
	}
	
	//modifier notaire profile avec image
	public Notaire(String nom, String prenom, String cin, String telephone, String email, String image, int id) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.telephone = telephone;
		this.email = email;
		this.image = image;
		this.id = id;
	}

	//modifier notaire profile sans image
	public Notaire(String nom, String prenom, String cin, String telephone, String email, int id) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.telephone = telephone;
		this.email = email;
		this.id = id;
	}

	// select tous les notaires
	public Notaire(int id, String nom, String prenom, String cin, String telephone, String email, String image) {
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.telephone = telephone;
		this.email = email;
		this.image = image;
	}
	
	//notaire inscription avec image
	public Notaire(String nom, String prenom, String cin, String telephone, String email, String motdepasse, String image) {
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.telephone = telephone;
		this.email = email;
		this.motdepasse = motdepasse;
		this.image = image;
	}
	
	//notaire inscription sans image
	public Notaire(String nom, String prenom, String cin, String telephone, String email, String motdepasse) {
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.telephone = telephone;
		this.email = email;
		this.motdepasse = motdepasse;
	}
	
	//modifier mot de passe notaire
	public Notaire(String email, String motdepasse) {
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
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
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

}

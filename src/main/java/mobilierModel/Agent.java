package mobilierModel;

public class Agent {
	String nom, prenom, cin, email, motdepasse, image;
	int id;
	public Agent() {
		super();
	}
	
	// count tous les agents
	public Agent(int id) {
		super();
		this.id = id;
	}
	
	//modifier agent avec image
	public Agent(String nom, String prenom, String email, String cin, String image, int id) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.cin = cin;
		this.image = image;
		this.id = id;
	}
	
	//select tous les agents
	public Agent(int id, String nom, String prenom, String email, String cin, String image) {
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.email = email;
		this.image = image;
	}
	
	//inscription agent sans image
	public Agent(String nom, String prenom, String email, String cin, String motdepasse, String image) {
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.email = email;
		this.motdepasse = motdepasse;
		this.image = image;
	}
	
	//modifier agent sans image
	public Agent(String nom, String prenom, String email, String cin, int id) {
		this.nom = nom;
		this.prenom = prenom;
		this.cin = cin;
		this.email = email;
		this.id = id;
	}
	
	//inscription agent sans image
	public Agent(String nom, String prenom, String email, String cin, String motdepasse) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.cin = cin;
		this.motdepasse = motdepasse;
	}
	
	//modifier mot de passe agent
	public Agent(String email, String motdepasse) {
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
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
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

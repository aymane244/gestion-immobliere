package mobilierModel;

public class Client {
	String nom, prenom, email, telephone, motdepasse, image;
	int id, count;
	
	public Client() {
		super();
	}
	
	//count tous les clients
	public Client(String nom, int count) {
		super();
		this.nom = nom;
		this.count = count;
	}

	//select tous les clients
	public Client(int id, String nom, String prenom, String email, String telephone, String image) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.telephone = telephone;
		this.image = image;
	}
	
	//modifier client avec image
	public Client(String nom, String prenom, String email, String telephone, String image, int id) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.telephone = telephone;
		this.image = image;
		this.id = id;
	}
	
	//modifier client sans image
	public Client(String nom, String prenom, String email, String telephone, int id) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.telephone = telephone;
		this.id = id;
	}
	
	//client inscription avec image
	public Client(String nom, String prenom, String email, String telephone, String motdepasse, String image) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.telephone = telephone;
		this.motdepasse = motdepasse;
		this.image = image;
	}
	
	//client inscription sans image
	public Client(String nom, String prenom, String email, String telephone, String motdepasse) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.telephone = telephone;
		this.motdepasse = motdepasse;
	}
	
	//modifier mot de passe client
	public Client(String email, String motdepasse) {
		super();
		this.email = email;
		this.motdepasse = motdepasse;
	}
	
	public Client(String email) {
		super();
		this.email = email;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
    
}

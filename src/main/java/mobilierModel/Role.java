package mobilierModel;

public class Role {
	int id;
	String nom;
	
	public Role() {
		super();
	}
	
	// count tous les roles
	public Role(int id) {
		super();
		this.id = id;
	}
	
	//ajouter un role
	public Role(String nom) {
		super();
		this.nom = nom;
	}
	
	// modifier les roles et select tous les roles
	public Role(int id, String nom) {
		super();
		this.id = id;
		this.nom = nom;
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
	
}

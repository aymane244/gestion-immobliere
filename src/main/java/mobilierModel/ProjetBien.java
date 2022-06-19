package mobilierModel;

public class ProjetBien {
	int id, prix, prixMetre, chambre, projet;
	String nom, type;
	Object projetId = new Projet();
	Object etat = new Projet();
	Object description = new Projet();
	Object date = new Projet();
	Object image = new Projet();
	Object ajout = new Projet();
	Object unite = new Projet();
	Object nomProjet = new Projet();
	Object ville = new Projet();
	
	public ProjetBien() {
		super();
	}
	
	//selecct tous les bien avec leurs projets
	public ProjetBien(Object projetId, Object etat, Object description, Object date, Object image, Object nomProjet, Object ajout, 
			Object unite, Object ville, int id, int prix, int prixMetre, int chambre, int projet, String nom, String type) {
		super();
		this.projetId = projetId;
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.image = image;
		this.nomProjet = nomProjet;
		this.ajout = ajout;
		this.unite = unite;
		this.ville = ville;
		this.id = id;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.projet = projet;
		this.nom = nom;
		this.type = type;
	}
	
	//modifier le bien et le projet avec image
	public ProjetBien(Object etat, Object description, Object date, Object image, Object unite, Object nomProjet, 
			Object ville, String nom, int prix, int prixMetre, int chambre, String type, int id) {
		super();
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.image = image;
		this.unite = unite;
		this.nomProjet = nomProjet;
		this.ville = ville;
		this.nom = nom;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.type = type;
		this.id = id;
	}
	
	//modifier le bien et le projet sans image
	public ProjetBien(Object etat, Object description, Object date, Object unite, Object nomProjet, Object ville, String nom, int prix,
			int prixMetre, int chambre, String type, int id) {
		super();
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.unite = unite;
		this.nomProjet = nomProjet;
		this.ville = ville;
		this.nom = nom;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.type = type;
		this.id = id;
	}
	
	// ajouter bien du projet
	public ProjetBien(String nom, int prix, int prixMetre, int chambre, String type, int projet) {
		super();
		this.nom = nom;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.type = type;
		this.projet = projet;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public int getPrixMetre() {
		return prixMetre;
	}
	public void setPrixMetre(int prixMetre) {
		this.prixMetre = prixMetre;
	}
	public int getChambre() {
		return chambre;
	}
	public void setChambre(int chambre) {
		this.chambre = chambre;
	}
	public int getProjet() {
		return projet;
	}
	public void setProjet(int projet) {
		this.projet = projet;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Object getProjetId() {
		return projetId;
	}
	public void setProjetId(Object projetId) {
		this.projetId = projetId;
	}
	public Object getEtat() {
		return etat;
	}
	public void setEtat(Object etat) {
		this.etat = etat;
	}
	public Object getDescription() {
		return description;
	}
	public void setDescription(Object description) {
		this.description = description;
	}
	public Object getDate() {
		return date;
	}
	public void setDate(Object date) {
		this.date = date;
	}
	public Object getImage() {
		return image;
	}
	public void setImage(Object image) {
		this.image = image;
	}
	public Object getAjout() {
		return ajout;
	}
	public void setAjout(Object ajout) {
		this.ajout = ajout;
	}
	public Object getUnite() {
		return unite;
	}
	public void setUnite(Object unite) {
		this.unite = unite;
	}
	public Object getNomProjet() {
		return nomProjet;
	}
	public void setNomProjet(Object nomProjet) {
		this.nomProjet = nomProjet;
	}
	public Object getVille() {
		return ville;
	}
	public void setVille(Object ville) {
		this.ville = ville;
	}
	
}

package mobilierModel;

public class ProgrammeBien {
	int id, prix, prixMetre, chambre, programme;
	String nom, type;
	Object programmeID, etat, description, date, image, nomProgramme, ajout, unite, ville;
	
	public ProgrammeBien() {
		super();
	}

	// ajouter bien du programme
	public ProgrammeBien(String nom, int prix, int prixMetre, int chambre, String type, int programme) {
		super();
		this.nom = nom;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.type = type;
		this.programme = programme;
	}
	
	//select tous les biens de=u programme
	public ProgrammeBien(Object programmeID, Object etat, Object description, Object date, Object image, Object nomProgramme, Object ajout, 
			Object unite, Object ville, int id, int prix, int prixMetre, int chambre, int programme, String nom, String type) {
		super();
		this.programmeID = programmeID;
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.image = image;
		this.nomProgramme = nomProgramme;
		this.ajout = ajout;
		this.unite = unite;
		this.ville = ville;
		this.id = id;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.programme = programme;
		this.nom = nom;
		this.type = type;
	}
	
	//modifier programme et le bien sans image
	public ProgrammeBien(int id, Object etat, Object description, Object date, Object nomProgramme, Object unite, Object ville, 
			String nom, int prix, int prixMetre, int chambre, String type) {
		super();
		this.id = id;
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.nomProgramme = nomProgramme;
		this.unite = unite;
		this.ville = ville;
		this.nom = nom;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.type = type;
	}
	
	//modifier le programme et le bien avec image
	public ProgrammeBien(int id, Object etat, Object description, Object date, Object image, Object nomProgramme, Object unite, Object ville, 
			String nom, int prix, int prixMetre, int chambre, String type) {
		super();
		this.id = id;
		this.etat = etat;
		this.description = description;
		this.date = date;
		this.image = image;
		this.nomProgramme = nomProgramme;
		this.unite = unite;
		this.ville = ville;
		this.nom = nom;
		this.prix = prix;
		this.prixMetre = prixMetre;
		this.chambre = chambre;
		this.type = type;
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
	public int getProgramme() {
		return programme;
	}
	public void setProgramme(int programme) {
		this.programme = programme;
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
	public Object getDescription() {
		return description;
	}
	public void setDescription(Object description) {
		this.description = description;
	}
	public Object getEtat() {
		return etat;
	}
	public void setEtat(Object etat) {
		this.etat = etat;
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
	public Object getNomProgramme() {
		return nomProgramme;
	}
	public void setNomProgramme(Object nomProgramme) {
		this.nomProgramme = nomProgramme;
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
	public Object getVille() {
		return ville;
	}
	public void setVille(Object ville) {
		this.ville = ville;
	}
	public Object getProgrammeID() {
		return programmeID;
	}
	public void setProgrammeID(Object programmeID) {
		this.programmeID = programmeID;
	}
	
}

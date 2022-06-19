package mobilierModel;

import java.util.Date;

public class Bien {
	int id, prix, count;
	String nom, type, adresse, superficie, chambres, syndic, garage, description, image;
	Date date;
	
	public Bien() {
		super();
	}
	
	//select tous les biens
	public Bien(int id, String nom, String type, String adresse, String superficie, String chambres,
			String syndic, Date date, String garage, String description, String image, int prix) {
		super();
		this.id = id;
		this.nom = nom;
		this.type = type;
		this.adresse = adresse;
		this.superficie = superficie;
		this.chambres = chambres;
		this.syndic = syndic;
		this.garage = garage;
		this.description = description;
		this.image = image;
		this.date = date;
		this.prix = prix;
	}
	
	//modifier bien avec image
	public Bien(int id, String nom, String type, String adresse, String superficie, String chambres,
			String syndic, String garage, String description, String image, int prix) {
		super();
		this.id=id;
		this.nom = nom;
		this.type = type;
		this.adresse = adresse;
		this.superficie = superficie;
		this.chambres = chambres;
		this.syndic = syndic;
		this.garage = garage;
		this.description = description;
		this.image = image;
		this.prix = prix;
	}
	
	//ajouter bien
	public Bien(String nom, String type, String adresse, String superficie, String chambres,
			String syndic, String garage, String description, String image, int prix) {
		super();
		this.nom = nom;
		this.type = type;
		this.adresse = adresse;
		this.superficie = superficie;
		this.chambres = chambres;
		this.syndic = syndic;
		this.garage = garage;
		this.description = description;
		this.image = image;
		this.prix = prix;
	}
	
	//modifier bien sans image
	public Bien(int id, String nom, String type, String adresse, String superficie, String chambres,
			String syndic, String garage, String description, int prix) {
		super();
		this.id=id;
		this.nom = nom;
		this.type = type;
		this.adresse = adresse;
		this.superficie = superficie;
		this.chambres = chambres;
		this.syndic = syndic;
		this.garage = garage;
		this.description = description;
		this.prix = prix;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getSuperficie() {
		return superficie;
	}
	public void setSuperficie(String superficie) {
		this.superficie = superficie;
	}
	public String getChambres() {
		return chambres;
	}
	public void setChambres(String chambres) {
		this.chambres = chambres;
	}
	public String getSyndic() {
		return syndic;
	}
	public void setSyndic(String syndic) {
		this.syndic = syndic;
	}
	public String getGarage() {
		return garage;
	}
	public void setGarage(String garage) {
		this.garage = garage;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}

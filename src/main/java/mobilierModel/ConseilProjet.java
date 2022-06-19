package mobilierModel;

public class ConseilProjet {
	int id, client, projet, notaire;
	String message;
	Object projetId, projetNom, projetBien, bienId, clientNom, clientPrenom, clientId, notaireNom, notairePrenom, notaireId;
	
	//ajouter conseil notaire
	public ConseilProjet(String message, int id) {
		super();
		this.message = message;
		this.id = id;
	}
	
	public ConseilProjet() {
		super();
	}
	
	//envoie demande client
	public ConseilProjet(int notaire, int client, int projet) {
		super();
		this.notaire = notaire;
		this.client = client;
		this.projet = projet;
	}
	
	//select tous les conseils projet
	public ConseilProjet(int id, int projet, int client, int notaire, String message, Object projetNom,
			Object projetBien, Object projetId, Object clientNom, Object clientPrenom, Object clientId, Object notaireNom,
			Object notairePrenom, Object notaireId) {
		super();
		this.id = id;
		this.client = client;
		this.projet = projet;
		this.notaire = notaire;
		this.message = message;
		this.projetId = projetId;
		this.projetNom = projetNom;
		this.projetBien = projetBien;
		this.clientNom = clientNom;
		this.clientPrenom = clientPrenom;
		this.clientId = clientId;
		this.notaireNom = notaireNom;
		this.notairePrenom = notairePrenom;
		this.notaireId = notaireId;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getClient() {
		return client;
	}
	public void setClient(int client) {
		this.client = client;
	}

	public int getProjet() {
		return projet;
	}
	public void setProjet(int projet) {
		this.projet = projet;
	}
	public int getNotaire() {
		return notaire;
	}
	public void setNotaire(int notaire) {
		this.notaire = notaire;
	}
	public Object getProjetId() {
		return projetId;
	}
	public void setProjetId(Object projetId) {
		this.projetId = projetId;
	}
	public Object getProjetNom() {
		return projetNom;
	}
	public void setProjetNom(Object projetNom) {
		this.projetNom = projetNom;
	}
	public Object getProjetBien() {
		return projetBien;
	}
	public void setProjetBien(Object projetBien) {
		this.projetBien = projetBien;
	}
	public Object getClientNom() {
		return clientNom;
	}
	public void setClientNom(Object clientNom) {
		this.clientNom = clientNom;
	}
	public Object getClientPrenom() {
		return clientPrenom;
	}
	public void setClientPrenom(Object clientPrenom) {
		this.clientPrenom = clientPrenom;
	}
	public Object getClientId() {
		return clientId;
	}
	public void setClientId(Object clientId) {
		this.clientId = clientId;
	}
	public Object getNotaireNom() {
		return notaireNom;
	}
	public void setNotaireNom(Object notaireNom) {
		this.notaireNom = notaireNom;
	}
	public Object getNotairePrenom() {
		return notairePrenom;
	}
	public void setNotairePrenom(Object notairePrenom) {
		this.notairePrenom = notairePrenom;
	}
	public Object getNotaireId() {
		return notaireId;
	}
	public void setNotaireId(Object notaireId) {
		this.notaireId = notaireId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	public Object getBienId() {
		return bienId;
	}
	public void setBienId(Object bienId) {
		this.bienId = bienId;
	}
}

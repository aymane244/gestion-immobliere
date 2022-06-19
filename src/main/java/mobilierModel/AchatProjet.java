package mobilierModel;

import java.util.Date;

public class AchatProjet {
	int id, projet, client;
	Date date;
	String confirmation, document;
	int count;
	Object projetId, projetNom, bienId, bienNom, bienType, bienPrix, clientId, clientNom, clientPrenom;
	
	public AchatProjet() {
		super();
	}
	
	//select tous les biens du projet
	public AchatProjet(int id, Date date, String confirmation, String document, int projet, int client, Object bienNom, Object bienId, 
			Object projetNom, Object clientNom, Object clientPrenom) {
		super();
		this.id = id;
		this.date = date;
		this.confirmation = confirmation;
		this.document = document;
		this.projet = projet;
		this.client = client;
		this.bienNom = bienNom;
		this.bienId = bienId;
		this.projetNom = projetNom;
		this.clientNom = clientNom;
		this.clientPrenom = clientPrenom;
	}
	
	//count tous les biens du projet
	public AchatProjet(int count) {
		super();
		this.count = count;
	}
	
	//Ajouter achat bien du projet
	public AchatProjet(int projet, int client) {
		super();
		this.projet = projet;
		this.client = client;
	}
	
	//modifier confirmation d'achat d'un bien d'un projet
	public AchatProjet(String confirmation, int id) {
		super();
		this.confirmation = confirmation;
		this.id = id;
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
	public String getConfirmation() {
		return confirmation;
	}
	public void setConfirmation(String confirmation) {
		this.confirmation = confirmation;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getProjet() {
		return projet;
	}
	public void setProjet(int projet) {
		this.projet = projet;
	}
	public int getClient() {
		return client;
	}
	public void setClient(int client) {
		this.client = client;
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
	public Object getClientId() {
		return clientId;
	}
	public void setClientId(Object clientId) {
		this.clientId = clientId;
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

	public Object getBienType() {
		return bienType;
	}

	public void setBienType(Object bienType) {
		this.bienType = bienType;
	}

	public Object getBienPrix() {
		return bienPrix;
	}

	public void setBienPrix(Object bienPrix) {
		this.bienPrix = bienPrix;
	}

}

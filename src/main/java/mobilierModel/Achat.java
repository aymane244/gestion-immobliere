package mobilierModel;


import java.util.Date;

public class Achat {
	int id, count, bien, client;
	Date date;
	String confirmation, nomClient, document;
	Object clientId, clientNom, clientPrenom, bienId, bienNom, bienType;
	
	public Achat() {
		super();
	}
	
	//modifier Achat Confirmation client
	public Achat(String confirmation, int id) {
		super();
		this.confirmation = confirmation;
		this.id = id;
	}
	
	//Ajouter nouvelle achat
	public Achat(int bien, int client) {
		super();
		this.bien = bien;
		this.client = client;
	}
	
	// Select tous les biens achetés
	public Achat(int id, Date date, Object bienType, Object bienNom, String confirmation, Object clientNom, Object clientPrenom, 
			String document, int bien, int client, Object bienId, Object clientId) {
		super();
		this.id = id;
		this.date = date;
		this.bienType = bienType;
		this.bienNom = bienNom;
		this.confirmation = confirmation;
		this.clientNom = clientNom;
		this.clientPrenom = clientPrenom;
		this.document = document;
		this.bien = bien;
		this.client = client;
		this.bienId = bienId;
		this.clientId = clientId;
	}

	public Achat(int count) {
		super();
		this.count = count;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getConfirmation() {
		return confirmation;
	}

	public void setConfirmation(String confirmation) {
		this.confirmation = confirmation;
	}

	public String getNomClient() {
		return nomClient;
	}

	public void setNomClient(String nomClient) {
		this.nomClient = nomClient;
	}
	

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
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
	public int getBien() {
		return bien;
	}
	public void setBien(int bien) {
		this.bien = bien;
	}
	public int getClient() {
		return client;
	}
	public void setClient(int client) {
		this.client = client;
	}
	
}

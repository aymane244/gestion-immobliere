package mobilierModel;

public class ConseilProgramme {
	int id, notaire, client, programme;
	String message;
	Object programmeNom, bienNom, bienId, programmeId, clientNom, clientPrenom, clientId, notaireNom, notairePrenom, notaireId;
	
	public ConseilProgramme() {
		super();
	}
	
	//ajouter conseil notaire
	public ConseilProgramme(String message, int id) {
		super();
		this.message = message;
		this.id = id;
	}
	
	//select tous les conseils programme
	public ConseilProgramme(int id, int programme, int client, int notaire, String message, Object programmeNom, Object bienNom,
			Object programmeId, Object clientNom, Object clientPrenom, Object clientId,
			Object notaireNom, Object notairePrenom, Object notaireId) {
		super();
		this.id = id;
		this.programme = programme;
		this.client = client;
		this.notaire = notaire;
		this.message = message;
		this.programmeNom = programmeNom;
		this.bienNom = bienNom;
		this.programmeId = programmeId;
		this.clientNom = clientNom;
		this.clientPrenom = clientPrenom;
		this.clientId = clientId;
		this.notaireNom = notaireNom;
		this.notairePrenom = notairePrenom;
		this.notaireId = notaireId;
	}
	
	//envoie de demande conseil client
	public ConseilProgramme(int notaire, int client, int programme) {
		super();
		this.notaire = notaire;
		this.client = client;
		this.programme = programme;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNotaire() {
		return notaire;
	}
	public void setNotaire(int notaire) {
		this.notaire = notaire;
	}
	public int getClient() {
		return client;
	}
	public void setClient(int client) {
		this.client = client;
	}
	public int getProgramme() {
		return programme;
	}
	public void setProgramme(int programme) {
		this.programme = programme;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getProgrammeNom() {
		return programmeNom;
	}
	public void setProgrammeNom(Object programmeNom) {
		this.programmeNom = programmeNom;
	}
	public Object getProgrammeId() {
		return programmeId;
	}
	public void setProgrammeId(Object programmeId) {
		this.programmeId = programmeId;
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
	public Object getBienNom() {
		return bienNom;
	}
	public void setBienNom(Object bienNom) {
		this.bienNom = bienNom;
	}
	public Object getBienId() {
		return bienId;
	}
	public void setBienId(Object bienId) {
		this.bienId = bienId;
	}
	
}

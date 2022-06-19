package mobilierModel;

import java.util.Date;

public class AchatProgramme {
	int id, client, programme;
	Date date;
	String confirmation, document;
	int count;
	Object programmeId, programmeNom, bienId, bienNom, bienType, bienPrix, clientId, clientNom, clientPrenom;
	
	public AchatProgramme() {
		super();
	}
	
	//select tous les biens du programme
	public AchatProgramme(int id, Date date, String confirmation, String document, int client, int programme, Object programmeNom, 
			Object bienNom, Object bienId, Object clientNom, Object clientPrenom) {
		super();
		this.id = id;
		this.date = date;
		this.confirmation = confirmation;
		this.document = document;
		this.client = client;
		this.programme = programme;
		this.programmeNom = programmeNom;
		this.bienNom = bienNom;
		this.bienId = bienId;
		this.clientNom = clientNom;
		this.clientPrenom = clientPrenom;
	}
	
	//modifier la confirmation d'achat d'un bien du programme
	public AchatProgramme(String confirmation, int id) {
		super();
		this.confirmation = confirmation;
		this.id = id;
	}
	
	// Ajouter achat et count le nombre total des biens programme
	public AchatProgramme(int programme, int client) {
		super();
		this.programme = programme;
		this.client = client;
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
	public Object getProgrammeId() {
		return programmeId;
	}
	public void setProgrammeId(Object programmeId) {
		this.programmeId = programmeId;
	}
	public Object getProgrammeNom() {
		return programmeNom;
	}
	public void setProgrammeNom(Object programmeNom) {
		this.programmeNom = programmeNom;
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

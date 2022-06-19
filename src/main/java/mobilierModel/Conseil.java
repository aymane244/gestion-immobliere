package mobilierModel;

public class Conseil {
	
	int id, count, bienId, clientId, notaireId;
	String conseil;
	Object bienNom, biensId, clientNom, clientPrenom, clientsId, notaireNom, notairePrenom, notairesId;
	
	public Conseil() {
		super();
	}
	
	//ajouter un message pour un bien notaire
	public Conseil(String conseil, int id) {
		super();
		this.conseil = conseil;
		this.id = id;
	}

	//select tous les conseils bien
	public Conseil(int id, int bienId, int clientId, int notaireId, String conseil, Object bienNom, Object biensId, Object clientNom, Object clientPrenom, Object clientsId
			, Object notaireNom, Object notairePrenom, Object notairesId) {
		super();
		this.id = id;
		this.bienId = bienId;
		this.clientId = clientId;
		this.notaireId = notaireId;
		this.conseil = conseil;
		this.bienNom = bienNom;
		this.biensId = biensId;
		this.clientNom = clientNom;
		this.clientPrenom = clientPrenom;
		this.clientsId = clientsId;
		this.notaireNom = notaireNom;
		this.notairePrenom = notairePrenom;
		this.notairesId = notairesId;
	}
	
	//select conseil message
	public Conseil(String conseil, int bienId, int clientId, int id) {
		super();
		this.conseil = conseil;
		this.bienId = bienId;
		this.clientId = clientId;
		this.id = id;
	}
	
	// envoie de demande de conseil client
	public Conseil(int bienId, int clientId, int notaireId) {
		super();
		this.bienId = bienId;
		this.clientId = clientId;
		this.notaireId = notaireId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getConseil() {
		return conseil;
	}
	public void setConseil(String conseil) {
		this.conseil = conseil;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getBienId() {
		return bienId;
	}

	public void setBienId(int bienId) {
		this.bienId = bienId;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public int getNotaireId() {
		return notaireId;
	}

	public void setNotaireId(int notaireId) {
		this.notaireId = notaireId;
	}

	public Object getBienNom() {
		return bienNom;
	}

	public void setBienNom(Object bienNom) {
		this.bienNom = bienNom;
	}

	public Object getBiensId() {
		return biensId;
	}

	public void setBiensId(Object biensId) {
		this.biensId = biensId;
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

	public Object getClientsId() {
		return clientsId;
	}

	public void setClientsId(Object clientsId) {
		this.clientsId = clientsId;
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

	public Object getNotairesId() {
		return notairesId;
	}

	public void setNotairesId(Object notairesId) {
		this.notairesId = notairesId;
	}
	
}

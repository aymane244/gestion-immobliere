package mobilierModel;

public class DocumentProgramme {
	String document;
	int id;
	
	//modifier achat ajouter document client
	public DocumentProgramme(String document, int id) {
		super();
		this.document = document;
		this.id = id;
	}
	
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}

package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mobilierModel.Achat;
import mobilierModel.AchatProgramme;
import mobilierModel.AchatProjet;
import mobilierModel.Document;
import mobilierModel.DocumentProgramme;
import mobilierModel.DocumentProjet;

public class AchatDao {
	Connection conn;
	public AchatDao(Connection conn) {
		this.conn = conn;
	}
	//insert achat du bien
	public boolean insertAchat(Achat achat) {
		boolean set =false;
		Date date = new Date();
		java.sql.Date achatDate = new java.sql.Date(date.getTime());
		String sql ="INSERT INTO achat (achat_ajout, achat_bien, achat_client) VALUES (?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setDate(1, achatDate);
			ps.setObject(2, achat.getBien());
			ps.setObject(3, achat.getClient());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//select achats
	public List<Achat> selectAll(){
		List<Achat> achats = new ArrayList<>();
		String sql ="SELECT * FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id INNER JOIN client ON achat.achat_client=client.clt_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("achat_id");
				Date date = result.getDate("achat_ajout");
				String type = result.getString("bien_type");
				String nom = result.getString("bien_nom");
				String conf = result.getString("achat_confirmation");
				String nomClient = result.getString("clt_nom");
				String prenomClient = result.getString("clt_prenom");
				String document = result.getString("achat_document");
				int bienId = result.getInt("achat_bien");
				int clientId = result.getInt("achat_client");
				int bien = result.getInt("bien_id");
				int client = result.getInt("clt_id");
				achats.add(new Achat(id, date, type, nom, conf, nomClient, prenomClient, document, bienId, clientId, bien, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	//update achat bien
	public boolean updateBien(Achat achat) {
		boolean set = false;
		String sql = "UPDATE achat SET achat_confirmation=? WHERE achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, achat.getConfirmation());
			ps.setInt(2, achat.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//select achat by id
	public Achat selectAchat(int id) {
		Achat achat = null;
		String sql ="SELECT * FROM achat INNER JOIN biens ON achat.achat_bien = biens.bien_id INNER JOIN client ON achat.achat_client = client.clt_id "
				+ "WHERE achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				achat = new Achat();
				achat.setBienNom(result.getObject("bien_nom"));
				achat.setBienType(result.getObject("bien_type"));
				achat.setBien(result.getInt("achat_bien"));
				achat.setClientNom(result.getObject("clt_nom"));
				achat.setClientPrenom(result.getObject("clt_prenom"));
				achat.setClient(result.getInt("achat_client"));
				achat.setId(result.getInt("achat_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achat;
	}
	public List<Achat> selectAchatCompare() {
		List<Achat> achats = new ArrayList<>();
		String sql = "SELECT * FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id INNER JOIN client ON achat.achat_client=client.clt_id"
				;
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int bien = result.getInt("achat_bien");
				int client = result.getInt("achat_client");
				achats.add(new Achat(bien, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	//select achats
	public List <Achat> selectBiens() {
		List <Achat> achats = new ArrayList<>();
		String sql ="SELECT * FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id INNER JOIN client ON achat.achat_client=client.clt_id"
				+ " WHERE bien_type='Maisons' OR bien_type='Appartement' OR bien_type='Villas' OR bien_type='Riyads'";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("achat_id");
				Date date = result.getDate("achat_ajout");
				String type = result.getString("bien_type");
				String nom = result.getString("bien_nom");
				String conf = result.getString("achat_confirmation");
				String nomClient = result.getString("clt_nom");
				String prenomClient = result.getString("clt_prenom");
				String document = result.getString("achat_document");
				int bienId = result.getInt("achat_bien");
				int clientId = result.getInt("achat_client");
				int bien = result.getInt("bien_id");
				int client = result.getInt("clt_id");
				achats.add(new Achat(id, date, type, nom, conf, nomClient, prenomClient, document, bienId, clientId, bien, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public List <Achat> countBiens() {
		List <Achat> achats = new ArrayList<>();
		String sql ="SELECT achat_client, count(achat_bien) FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id "
				+ "WHERE bien_type='Maisons' OR bien_type='Appartement' OR bien_type='Villas' OR bien_type='Riyads' GROUP BY achat_client";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(achat_bien)");
				int client = result.getInt("achat_client");
				achats.add(new Achat(count, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public List <Achat> countBiensAll() {
		List <Achat> achats = new ArrayList<>();
		String sql ="SELECT achat_client, COUNT(achat_bien) FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id WHERE bien_type='Maisons' OR "
				+ "bien_type='Appartement' OR bien_type='Villas' OR bien_type='Riyads'";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(achat_bien)");
				achats.add(new Achat(count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public List <Achat> selectTerrains() {
		List <Achat> achats = new ArrayList<>();
		String sql ="SELECT * FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id INNER JOIN client ON "
				+ "achat.achat_client=client.clt_id WHERE bien_type='Terrain'";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("achat_id");
				Date date = result.getDate("achat_ajout");
				String type = result.getString("bien_type");
				String nom = result.getString("bien_nom");
				String conf = result.getString("achat_confirmation");
				String nomClient = result.getString("clt_nom");
				String prenomClient = result.getString("clt_prenom");
				String document = result.getString("achat_document");
				int bienId = result.getInt("achat_bien");
				int clientId = result.getInt("achat_client");
				int bien = result.getInt("bien_id");
				int client = result.getInt("clt_id");
				achats.add(new Achat(id, date, type, nom, conf, nomClient, prenomClient, document, bienId, clientId, bien, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public List <Achat> countTerrainsAll() {
		List <Achat> achats = new ArrayList<>();
		String sql ="SELECT achat_client, COUNT(achat_nom) from achat INNER JOIN biens ON achat.achat_bien=biens.bien_id WHERE bien_type='Terrain'";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("COUNT(achat_nom)");
				achats.add(new Achat(count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public List <Achat> selectCommerces() {
		List <Achat> achats = new ArrayList<>();
		String sql ="SELECT * FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id INNER JOIN client ON achat.achat_client=client.clt_id WHERE bien_type='Bureaux & commerce'";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("achat_id");
				Date date = result.getDate("achat_ajout");
				String type = result.getString("bien_type");
				String nom = result.getString("bien_nom");
				String conf = result.getString("achat_confirmation");
				String nomClient = result.getString("clt_nom");
				String prenomClient = result.getString("clt_prenom");
				String document = result.getString("achat_document");
				int bienId = result.getInt("achat_bien");
				int clientId = result.getInt("achat_client");
				int bien = result.getInt("bien_id");
				int client = result.getInt("clt_id");
				achats.add(new Achat(id, date, type, nom, conf, nomClient, prenomClient, document, bienId, clientId, bien, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public List <Achat> countCommercesAll() {
		List <Achat> achats = new ArrayList<>();
		String sql ="SELECT achat_client, COUNT(achat_nom) FROM achat INNER JOIN biens ON achat.achat_bien=biens.bien_id WHERE "
				+ "bien_type='Bureaux & commerce'";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("COUNT(achat_nom)");
				achats.add(new Achat(count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	//delete achat
	public boolean delete(int id) {
		boolean set = false;
		String sql = "DELETE FROM achat WHERE achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			set = ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean insertAchatProgramme(AchatProgramme achat) {
		boolean set =false;
		Date date = new Date();
		java.sql.Date achatDate = new java.sql.Date(date.getTime());
		String sql ="INSERT INTO achatprogramme (achat_ajout, achat_programme, achat_client) VALUES (?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setDate(1, achatDate);
			ps.setObject(2, achat.getProgramme());
			ps.setObject(3, achat.getClient());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean updateProgramme(AchatProgramme achat) {
		boolean set = false;
		String sql = "update achatprogramme set achat_confirmation=? where achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, achat.getConfirmation());
			ps.setInt(2, achat.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List <AchatProgramme> selectProgrammes() {
		List <AchatProgramme> achats = new ArrayList<>();
		String sql ="SELECT * FROM achatprogramme INNER JOIN bienprogramme ON achatprogramme.achat_programme=bienprogramme.bien_id "
				+ "INNER JOIN programmes ON bienprogramme.bien_programme=programmes.pro_id INNER JOIN client "
				+ "ON achatprogramme.achat_client=client.clt_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("achat_id");
				Date date = result.getDate("achat_ajout");
				String conf = result.getString("achat_confirmation");
				String document = result.getString("achat_document");
				int clientId = result.getInt("achat_client");
				int programmeId = result.getInt("achat_programme");
				String nom = result.getString("pro_nom");
				String bienNom = result.getString("bien_nom");
				int bienId = result.getInt("bien_id");
				String nomClient = result.getString("clt_nom");
				String prenomClient = result.getString("clt_prenom");
				achats.add(new AchatProgramme(id, date, conf, document, clientId, programmeId, nom, bienNom, bienId, nomClient, prenomClient));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	//select achatprogramme by id
	public AchatProgramme selectAchatProgramme(int id) {
		AchatProgramme achat = null;
		String sql ="SELECT * FROM achatprogramme INNER JOIN bienprogramme ON achatprogramme.achat_programme=bienprogramme.bien_id "
				+ "INNER JOIN programmes ON bienprogramme.bien_programme=programmes.pro_id INNER JOIN client ON "
				+ "achatprogramme.achat_client=client.clt_id WHERE achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				achat = new AchatProgramme();
				achat.setProgrammeNom(result.getObject("pro_nom"));
				achat.setBienNom(result.getObject("bien_nom"));
				achat.setProgramme(result.getInt("achat_programme"));
				achat.setClientNom(result.getObject("clt_nom"));
				achat.setClientPrenom(result.getObject("clt_prenom"));
				achat.setClient(result.getInt("achat_client"));
				achat.setId(result.getInt("achat_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achat;
	}
	public List <AchatProgramme> countProgrammeAll() {
		List <AchatProgramme> programmes = new ArrayList<>();
		String sql ="select achat_client, count(achat_programme) from achatprogramme";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(achat_programme)");
				int client = result.getInt("achat_client");
				programmes.add(new AchatProgramme(count, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return programmes;
	}
	public boolean deleteProgramme(int id) {
		boolean set = false;
		String sql = "delete from achatprogramme where achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			set = ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<AchatProgramme> selectAchatProgrammeCompare() {
		List<AchatProgramme> achats = new ArrayList<>();
		String sql = "SELECT * FROM achatprogramme INNER JOIN programmes ON achatprogramme.achat_programme=programmes.pro_id INNER JOIN client ON achatprogramme.achat_client=client.clt_id"
				;
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int progarmme = result.getInt("achat_programme");
				int client = result.getInt("achat_client");
				achats.add(new AchatProgramme(progarmme, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public boolean insertAchatProjet(AchatProjet achat) {
		boolean set =false;
		Date date = new Date();
		java.sql.Date achatDate = new java.sql.Date(date.getTime());
		String sql ="insert into achatprojet (achat_ajout, achat_projet, achat_client) values "
				+ "(?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setDate(1, achatDate);
			ps.setObject(2, achat.getProjet());
			ps.setObject(3, achat.getClient());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//select achatprojet by id
	public AchatProjet selectAchatProjet(int id) {
		AchatProjet achat = null;
		String sql ="SELECT * FROM achatprojet INNER JOIN bienprojet ON achatprojet.achat_projet=bienprojet.bien_id "
				+ "INNER JOIN projets ON bienprojet.bien_projet=projets.pro_id INNER JOIN client ON achatprojet.achat_client=client.clt_id "
				+ "WHERE achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				achat = new AchatProjet();
				achat.setProjetNom(result.getObject("pro_nom"));
				achat.setBienNom(result.getObject("bien_nom"));
				achat.setProjet(result.getInt("achat_projet"));
				achat.setClientNom(result.getObject("clt_nom"));
				achat.setClientPrenom(result.getObject("clt_prenom"));
				achat.setClient(result.getInt("achat_client"));
				achat.setId(result.getInt("achat_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achat;
	}
	public boolean updateProjet(AchatProjet achat) {
		boolean set = false;
		String sql = "update achatprojet set achat_confirmation=? where achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, achat.getConfirmation());
			ps.setInt(2, achat.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List <AchatProjet> selectProjet() {
		List <AchatProjet> achats = new ArrayList<>();
		String sql ="SELECT * FROM achatprojet INNER JOIN bienprojet ON achatprojet.achat_projet=bienprojet.bien_id INNER JOIN projets"
				+ " ON bienprojet.bien_projet=projets.pro_id INNER JOIN client ON achatprojet.achat_client=client.clt_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("achat_id");
				Date date = result.getDate("achat_ajout");
				String conf = result.getString("achat_confirmation");
				String document = result.getString("achat_document");
				int projetId = result.getInt("achat_projet");
				int clientId = result.getInt("achat_client");
				String bienNom = result.getString("bien_nom");
				int bienId = result.getInt("bien_id");
				String projetNom = result.getString("pro_nom");
				String clientNom = result.getString("clt_nom");
				String clientPrenom = result.getString("clt_prenom");
				achats.add(new AchatProjet(id, date, conf, document, projetId
						, clientId, bienNom, bienId, projetNom, clientNom, clientPrenom));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
	public List <AchatProjet> countProjetAll() {
		List <AchatProjet> projets = new ArrayList<>();
		String sql ="select achat_client, count(achat_projet) from achatprojet";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(achat_projet)");
				projets.add(new AchatProjet(count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return projets;
	}
	public boolean deleteProjet(int id) {
		boolean set = false;
		String sql = "delete from achatprojet where achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			set = ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean updateAchat(Document achat) {
		boolean set = false;
		String sql = "update achat set achat_document=? where achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, achat.getDocument());
			ps.setInt(2, achat.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean updateAchatProgramme(DocumentProgramme achat) {
		boolean set = false;
		String sql = "update achatprogramme set achat_document=? where achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, achat.getDocument());
			ps.setInt(2, achat.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean updateAchatProjet(DocumentProjet achat) {
		boolean set = false;
		String sql = "update achatprojet set achat_document=? where achat_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, achat.getDocument());
			ps.setInt(2, achat.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<AchatProjet> selectAchatProjetCompare() {
		List<AchatProjet> achats = new ArrayList<>();
		String sql = "SELECT * FROM achatprojet INNER JOIN bienprojet ON achatprojet.achat_projet=bienprojet.bien_id "
				+ "INNER JOIN client ON achatprojet.achat_client=client.clt_id"
				;
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int projet = result.getInt("achat_projet");
				int client = result.getInt("achat_client");
				achats.add(new AchatProjet(projet, client));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return achats;
	}
}

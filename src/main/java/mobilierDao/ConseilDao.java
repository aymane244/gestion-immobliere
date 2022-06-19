package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mobilierModel.Conseil;
import mobilierModel.ConseilProgramme;
import mobilierModel.ConseilProjet;

public class ConseilDao {
	Connection conn;
	public ConseilDao(Connection conn) {
		this.conn = conn;
	}
	public boolean insertConseil(Conseil conseil) {
		boolean set =false;
		String sql ="insert into conseil (con_bien, con_client, con_notaire) values (?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, conseil.getBienId());
			ps.setInt(2, conseil.getClientId());
			ps.setInt(3, conseil.getNotaireId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<Conseil> selectAll() {
		List<Conseil> conseils = new ArrayList<>();
		String sql = "SELECT * FROM conseil INNER JOIN biens ON conseil.con_bien = biens.bien_id INNER JOIN client ON "
				+ "conseil.con_client = client.clt_id INNER JOIN notaire ON conseil.con_notaire = notaire.not_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("con_id");
				int bien = result.getInt("con_bien");
				int client = result.getInt("con_client");
				int notaire = result.getInt("con_notaire");
				String message = result.getString("con_conseil");
				String bienNom = result.getString("bien_nom");
				int bienId = result.getInt("bien_id");
				String clientNom = result.getString("clt_nom");
				String clientPrenom = result.getString("clt_prenom");
				int clientId = result.getInt("clt_id");
				String notaireNom = result.getString("not_nom");
				String notairePrenom = result.getString("not_prenom");
				int notaireId = result.getInt("not_id");
				conseils.add(new Conseil(id, bien, client, notaire, message, bienNom, bienId, clientNom, clientPrenom, clientId, notaireNom, 
						notairePrenom, notaireId));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseils;
	}
	public Conseil selectConseil(int id) {
		Conseil conseil = null;
		String sql ="SELECT * FROM conseil INNER JOIN biens ON conseil.con_bien = biens.bien_id WHERE con_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				conseil = new Conseil();
				conseil.setId(result.getInt("con_id"));
				conseil.setBienNom(result.getString("bien_nom"));
				conseil.setConseil(result.getString("con_conseil"));
				conseil.setId(result.getInt("con_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseil;
	}
	public boolean updateConseil(Conseil conseil) {
		boolean set = false;
		String sql = "update conseil set con_conseil=? where con_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, conseil.getConseil());
			ps.setInt(2, conseil.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean delete(int id) {
		boolean set = false;
		String sql = "delete from conseil where con_id=?";
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
	public List<Conseil> selectConseil() {
		List<Conseil> conseils = new ArrayList<>();
		String sql = "SELECT * FROM conseil INNER JOIN biens ON conseil.con_bien=biens.bien_id INNER JOIN client "
				+ "ON conseil.con_client=client.clt_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				String message = result.getString("con_conseil");
				int bien = result.getInt("con_bien");
				int client = result.getInt("con_client");
				int id = result.getInt("con_id");
				conseils.add(new Conseil(message, bien, client, id));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseils;
	}
	public Conseil selectConseils(Object bien, int client) {
		Conseil conseil = null;
		String sql = "SELECT * FROM conseil INNER JOIN biens ON conseil.con_bien=biens.bien_id INNER JOIN client "
				+ "ON conseil.con_client=client.clt_id WHERE con_bien=? AND con_client=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setObject(1, bien);
			ps.setInt(2, client);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				conseil = new Conseil();
				conseil.setBienId(result.getInt("con_bien"));
				conseil.setClientId(result.getInt("con_client"));
				conseil.setId(result.getInt("con_id"));
				conseil.setConseil(result.getString("con_conseil"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseil;
	}

	public boolean insertConseilProjet(ConseilProjet conseil) {
		boolean set =false;
		String sql ="insert into conseilprojet (con_notaire, con_client, con_projet) values (?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, conseil.getNotaire());
			ps.setInt(2, conseil.getClient());
			ps.setInt(3, conseil.getProjet());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<ConseilProjet> selectAllProjet() {
		List<ConseilProjet> conseils = new ArrayList<>();
		String sql = "SELECT * FROM conseilprojet INNER JOIN bienprojet ON conseilprojet.con_projet = bienprojet.bien_id INNER JOIN client ON "
				+ "conseilprojet.con_client = client.clt_id INNER JOIN notaire ON conseilprojet.con_notaire = notaire.not_id"
				+ " INNER JOIN projets ON bienprojet.bien_projet=projets.pro_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("con_id");
				int projet = result.getInt("con_projet");
				int client = result.getInt("con_client");
				int notaire = result.getInt("con_notaire");
				String message = result.getString("con_message");
				String projetNom = result.getString("pro_nom");
				String projetBien = result.getString("bien_nom");
				int projetId = result.getInt("pro_id");
				String clientNom = result.getString("clt_nom");
				String clientPrenom = result.getString("clt_prenom");
				int clientId = result.getInt("clt_id");
				String notaireNom = result.getString("not_nom");
				String notairePrenom = result.getString("not_prenom");
				int notaireId = result.getInt("not_id");
				conseils.add(new ConseilProjet(id, projet, client, notaire, message, projetNom, projetBien, projetId, clientNom, clientPrenom, clientId, notaireNom, 
						notairePrenom, notaireId));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseils;
	}
	public ConseilProjet selectConseilProjet(int id) {
		ConseilProjet conseil = null;
		String sql ="SELECT * FROM conseilprojet INNER JOIN bienprojet ON conseilprojet.con_projet=bienprojet.bien_id INNER JOIN projets "
				+ "ON bienprojet.bien_projet=projets.pro_id WHERE con_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				conseil = new ConseilProjet();
				conseil.setId(result.getInt("con_id"));
				conseil.setProjetNom(result.getString("pro_nom"));
				conseil.setMessage(result.getString("con_message"));
				conseil.setProjetBien(result.getString("bien_nom"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseil;
	}
	public boolean updateConseilProjet(ConseilProjet conseil) {
		boolean set = false;
		String sql = "update conseilprojet set con_message=? where con_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, conseil.getMessage());
			ps.setInt(2, conseil.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean deleteProjet(int id) {
		boolean set = false;
		String sql = "delete from conseilprojet where con_id=?";
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
	public ConseilProjet selectConseilsProjet(Object bien, int client) {
		ConseilProjet conseil = null;
		String sql = "SELECT * FROM conseilprojet INNER JOIN bienprojet ON conseilprojet.con_projet=bienprojet.bien_id "
				+ "INNER JOIN client ON conseilprojet.con_client=client.clt_id WHERE con_projet=? AND con_client=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setObject(1, bien);
			ps.setInt(2, client);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				conseil = new ConseilProjet();
				conseil.setBienId(result.getInt("con_projet"));
				conseil.setClientId(result.getInt("con_client"));
				conseil.setId(result.getInt("con_id"));
				conseil.setMessage(result.getString("con_message"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseil;
	}
	public boolean insertConseilProgramme(ConseilProgramme conseil) {
		boolean set =false;
		String sql ="insert into conseilprogramme (con_notaire, con_client, con_programme) values (?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, conseil.getNotaire());
			ps.setInt(2, conseil.getClient());
			ps.setInt(3, conseil.getProgramme());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<ConseilProgramme> selectAllProgramme() {
		List<ConseilProgramme> conseils = new ArrayList<>();
		String sql = "SELECT * FROM conseilprogramme INNER JOIN bienprogramme ON conseilprogramme.con_programme = bienprogramme.bien_id "
				+ "INNER JOIN client ON conseilprogramme.con_client = client.clt_id INNER JOIN notaire ON "
				+ "conseilprogramme.con_notaire = notaire.not_id INNER JOIN programmes ON bienprogramme.bien_programme=programmes.pro_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("con_id");
				int programme = result.getInt("con_programme");
				int client = result.getInt("con_client");
				int notaire = result.getInt("con_notaire");
				String message = result.getString("con_message");
				String programmeNom = result.getString("pro_nom");
				String Biennom = result.getString("bien_nom");
				int programmeId = result.getInt("pro_id");
				String clientNom = result.getString("clt_nom");
				String clientPrenom = result.getString("clt_prenom");
				int clientId = result.getInt("clt_id");
				String notaireNom = result.getString("not_nom");
				String notairePrenom = result.getString("not_prenom");
				int notaireId = result.getInt("not_id");
				conseils.add(new ConseilProgramme(id, programme, client, notaire, message, programmeNom, Biennom, programmeId, 
						clientNom, clientPrenom, clientId, notaireNom, notairePrenom, notaireId));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseils;
	}
	public ConseilProgramme selectConseilProgramme(int id) {
		ConseilProgramme conseil = null;
		String sql ="SELECT * FROM conseilprogramme INNER JOIN bienprogramme ON conseilprogramme.con_programme=bienprogramme.bien_id "
				+ "INNER JOIN programmes ON bienprogramme.bien_programme=programmes.pro_id WHERE con_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				conseil = new ConseilProgramme();
				conseil.setId(result.getInt("con_id"));
				conseil.setProgrammeNom(result.getString("pro_nom"));
				conseil.setMessage(result.getString("con_message"));
				conseil.setId(result.getInt("con_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseil;
	}
	public boolean updateConseilProgramme(ConseilProgramme conseil) {
		boolean set = false;
		String sql = "update conseilprogramme set con_message=? where con_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, conseil.getMessage());
			ps.setInt(2, conseil.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean deleteProgramme(int id) {
		boolean set = false;
		String sql = "delete from conseilprogramme where con_id=?";
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
	public ConseilProgramme selectConseilsProgramme(Object bien, int client) {
		ConseilProgramme conseil = null;
		String sql = "SELECT * FROM conseilprogramme INNER JOIN bienprogramme ON conseilprogramme.con_programme=bienprogramme.bien_id "
				+ "INNER JOIN client ON conseilprogramme.con_client=client.clt_id WHERE con_programme=? AND con_client=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setObject(1, bien);
			ps.setInt(2, client);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				conseil = new ConseilProgramme();
				conseil.setBienId(result.getInt("con_programme"));
				conseil.setClientId(result.getInt("con_client"));
				conseil.setId(result.getInt("con_id"));
				conseil.setMessage(result.getString("con_message"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conseil;
	}
}

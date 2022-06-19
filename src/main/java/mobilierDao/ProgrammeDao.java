package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mobilierModel.Programme;
import mobilierModel.ProgrammeBien;

public class ProgrammeDao {
	Connection conn;
	public ProgrammeDao(Connection conn) {
		this.conn = conn;
	}
	//insert programme
		public boolean insert(Programme programme) {
			boolean set = false;
			Date date = new Date();
			java.sql.Date programmeDate = new java.sql.Date(date.getTime());
			String sql = "insert into programmes (pro_etat, pro_description, pro_date, "
					+ "pro_image, pro_nom, pro_ajout, pro_unite, pro_ville) values(?,?,?,?,?,?,?,?)";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, programme.getEtat());
				ps.setString(2, programme.getDescription());
				ps.setString(3, programme.getDate());
				ps.setString(4, programme.getImage());
				ps.setString(5, programme.getNom());
				ps.setDate(6, programmeDate);
				ps.setString(7, programme.getUnite());
				ps.setString(8, programme.getVille());
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean insert(ProgrammeBien bien) {
			boolean set = false;
			String sql = "insert into bienprogramme (bien_nom, bien_prix, bien_prix_metre, bien_chambres, bien_type, bien_programme) "
					+ "values(?,?,?,?,?,?)";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, bien.getNom());
				ps.setInt(2, bien.getPrix());
				ps.setInt(3, bien.getPrixMetre());
				ps.setInt(4, bien.getChambre());
				ps.setString(5, bien.getType());
				ps.setInt(6, bien.getProgramme());
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//select tous les programmes
		public List<Programme> selectAll() {
		List<Programme> programmes = new ArrayList<>();
		String sql = "select * from programmes";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("pro_id");
				String etat = result.getString("pro_etat");
				String description = result.getString("pro_description");
				String date = result.getString("pro_date");
				String image = result.getString("pro_image");
				String nom = result.getString("pro_nom");
				Date dateAjout = result.getDate("pro_ajout");
				String unite = result.getString("pro_unite");
				String ville = result.getString("pro_ville");
				programmes.add(new Programme(id, etat, description, date, image, nom, dateAjout, unite, ville));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return programmes;
		}
		public List<ProgrammeBien> selectAllProgramme() {
		List<ProgrammeBien> programmes = new ArrayList<>();
		String sql = "SELECT * FROM programmes INNER JOIN bienprogramme ON programmes.pro_id=bienprogramme.bien_programme";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("pro_id");
				String etat = result.getString("pro_etat");
				String description = result.getString("pro_description");
				String date = result.getString("pro_date");
				String image = result.getString("pro_image");
				String nom = result.getString("pro_nom");
				Date dateAjout = result.getDate("pro_ajout");
				String unite = result.getString("pro_unite");
				String ville = result.getString("pro_ville");
				int bienId = result.getInt("bien_id");
				int prix = result.getInt("bien_prix");
				int prixMetre = result.getInt("bien_prix_metre");
				int chambre = result.getInt("bien_chambres");
				String nomResd = result.getString("bien_nom");
				String type = result.getString("bien_type");
				int programme = result.getInt("bien_programme");
				programmes.add(new ProgrammeBien(id, etat, description, date, image, nom, dateAjout, unite, ville, bienId, prix, prixMetre, chambre,
						programme, nomResd, type));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return programmes;
		}
		//select programme by id
		public Programme selectProgramme(int id) {
			Programme programme = null;
			String sql ="select * from programmes where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet result = ps.executeQuery();
				if(result.next()) {
					programme = new Programme();
					programme.setEtat(result.getString("pro_etat"));
					programme.setDescription(result.getString("pro_description"));
					programme.setDate(result.getString("pro_date"));
					programme.setImage(result.getString("pro_image"));
					programme.setNom(result.getString("pro_nom"));
					programme.setUnite(result.getString("pro_unite"));
					programme.setVille(result.getString("pro_ville"));
					programme.setId(result.getInt("pro_id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return programme;
		}
		public ProgrammeBien selectBiens(int id) {
			ProgrammeBien programme = null;
			String sql ="SELECT * FROM programmes INNER JOIN bienprogramme ON programmes.pro_id=bien_programme WHERE bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet result = ps.executeQuery();
				if(result.next()) {
					programme = new ProgrammeBien();
					programme.setEtat(result.getString("pro_etat"));
					programme.setDescription(result.getString("pro_description"));
					programme.setDate(result.getString("pro_date"));
					programme.setImage(result.getString("pro_image"));
					programme.setNomProgramme(result.getString("pro_nom"));
					programme.setUnite(result.getString("pro_unite"));
					programme.setVille(result.getString("pro_ville"));
					programme.setProgrammeID(result.getInt("pro_id"));
					programme.setId(result.getInt("bien_id"));
					programme.setNom(result.getString("bien_nom"));
					programme.setPrix(result.getInt("bien_prix"));
					programme.setPrixMetre(result.getInt("bien_prix_metre"));
					programme.setChambre(result.getInt("bien_chambres"));
					programme.setType(result.getString("bien_type"));
					programme.setProgramme(result.getInt("bien_programme"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return programme;
		}
		//update programme without image
		public boolean updateProgramme(Programme programme) {
			boolean set = false;
			String sql = "update programmes set pro_etat=?, pro_description=?, pro_date=?, "
					+ "pro_nom=?, pro_unite=?, pro_ville=? where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, programme.getEtat());
				ps.setString(2, programme.getDescription());
				ps.setString(3, programme.getDate());
				ps.setString(4, programme.getNom());
				ps.setString(5, programme.getUnite());
				ps.setString(6, programme.getVille());
				ps.setInt(7, programme.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//update programme with image
		public boolean updateProgrammeImg(Programme programme) {
			boolean set = false;
			String sql = "update programmes set pro_etat=?, pro_description=?, pro_date=?, "
					+ "pro_image=?, pro_nom=?, pro_unite=?, pro_ville=? where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, programme.getEtat());
				ps.setString(2, programme.getDescription());
				ps.setString(3, programme.getDate());
				ps.setString(4, programme.getImage());
				ps.setString(5, programme.getNom());
				ps.setString(6, programme.getUnite());
				ps.setString(7, programme.getVille());
				ps.setInt(8, programme.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean updateProgrammeBien(ProgrammeBien programme) {
			boolean set = false;
			String sql = "UPDATE programmes INNER JOIN bienprogramme ON programmes.pro_id=bienprogramme.bien_projet SET pro_etat=?, "
					+ "pro_description=?, pro_date=?, pro_nom=?, pro_unite=?, pro_ville=?, bien_nom=?, bien_prix=?, bien_prix_metre=?, "
					+ "bien_chambres=?, bien_type=? WHERE bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setObject(1, programme.getEtat());
				ps.setObject(2, programme.getDescription());
				ps.setObject(3, programme.getDate());
				ps.setObject(4, programme.getNomProgramme());
				ps.setObject(5, programme.getUnite());
				ps.setObject(6, programme.getVille());
				ps.setString(7, programme.getNom());
				ps.setInt(8, programme.getPrix());
				ps.setInt(9, programme.getPrixMetre());
				ps.setInt(10, programme.getChambre());
				ps.setString(11, programme.getType());
				ps.setInt(12, programme.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean updateProgrammeBienImg(ProgrammeBien programme) {
			boolean set = false;
			String sql = "UPDATE programmes INNER JOIN bienprogramme ON programmes.pro_id=bienprogramme.bien_programme SET pro_etat=?, "
					+ "pro_description=?, pro_date=?, pro_nom=?, pro_unite=?, pro_ville=?, pro_image=?, bien_nom=?, bien_prix=?, "
					+ "bien_prix_metre=?, bien_chambres=?, bien_type=? WHERE bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setObject(1, programme.getEtat());
				ps.setObject(2, programme.getDescription());
				ps.setObject(3, programme.getDate());
				ps.setObject(4, programme.getNomProgramme());
				ps.setObject(5, programme.getUnite());
				ps.setObject(6, programme.getVille());
				ps.setObject(7, programme.getImage());
				ps.setString(8, programme.getNom());
				ps.setInt(9, programme.getPrix());
				ps.setInt(10, programme.getPrixMetre());
				ps.setInt(11, programme.getChambre());
				ps.setString(12, programme.getType());
				ps.setInt(13, programme.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//delete programme
		public boolean delete(int id) {
			boolean set = false;
			String sql = "delete from programmes where pro_id=?";
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
		public boolean deleteBien(int id) {
			boolean set = false;
			String sql = "delete from bienprogramme where bien_id=?";
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
		// Count programmes
		public Programme countAll() {
			Programme programme = null;
			String sql = "select count(pro_id) from programmes";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					programme = new Programme();
					programme.setCount(result.getInt("count(pro_id)"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return programme;
		}
		public ProgrammeBien countAllBiens() {
			ProgrammeBien programme = null;
			String sql = "select count(bien_id) from bienprogramme";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					programme = new ProgrammeBien();
					programme.setId(result.getInt("count(bien_id)"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return programme;
		}
}

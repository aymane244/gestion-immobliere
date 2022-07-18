package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mobilierModel.Bien;

public class BiensDao {
	Connection conn;
	public BiensDao(Connection conn) {
		this.conn = conn;
	}
	//insert bien
		public boolean insert(Bien bien) {
			boolean set = false;
			Date date = new Date();
			java.sql.Date bienDate = new java.sql.Date(date.getTime());
			String sql = "insert into biens (bien_nom, bien_type, bien_addresse, bien_superficie, bien_chambres, bien_syndic, bien_ajout,"
					+ "bien_garage, bien_description, bien_image, bien_prix) values(?,?,?,?,?,?,?,?,?,?,?)";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, bien.getNom());
				ps.setString(2, bien.getType());
				ps.setString(3, bien.getAdresse());
				ps.setString(4, bien.getSuperficie());
				ps.setString(5, bien.getChambres());
				ps.setString(6, bien.getSyndic());
				ps.setDate(7, bienDate);
				ps.setString(8, bien.getGarage());
				ps.setString(9, bien.getDescription());
				ps.setString(10, bien.getImage());
				ps.setInt(11, bien.getPrix());
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//select tous les biens
		public List<Bien> selectAll() {
			List<Bien> biens = new ArrayList<>();
			String sql = "select * from biens";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int id = result.getInt("bien_id");
					String nom = result.getString("bien_nom");
					String type = result.getString("bien_type");
					String adresse = result.getString("bien_addresse");
					String superficie = result.getString("bien_superficie");
					String chambres = result.getString("bien_chambres");
					String syndic = result.getString("bien_syndic");
					Date date = result.getDate("bien_ajout");
					String garage = result.getString("bien_garage");
					String description = result.getString("bien_description");
					String image = result.getString("bien_image");
					int prix = result.getInt("bien_prix");
					biens.add(new Bien(id, nom, type, adresse, superficie, chambres, syndic, date, garage, description, image, prix));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return biens;
		}
		public List<Bien> selectAllBiens() {
			List<Bien> biens = new ArrayList<>();
			String sql = "select * from biens where bien_type = 'Appartement' or bien_type = 'Maisons' or bien_type = 'Riyads' or bien_type = 'Villas'";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int id = result.getInt("bien_id");
					String nom = result.getString("bien_nom");
					String type = result.getString("bien_type");
					String adresse = result.getString("bien_addresse");
					String superficie = result.getString("bien_superficie");
					String chambres = result.getString("bien_chambres");
					String syndic = result.getString("bien_syndic");
					Date date = result.getDate("bien_ajout");
					String garage = result.getString("bien_garage");
					String description = result.getString("bien_description");
					String image = result.getString("bien_image");
					int prix = result.getInt("bien_prix");
					biens.add(new Bien(id, nom, type, adresse, superficie, chambres, syndic, date, garage, description, image, prix));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return biens;
		}
		public Bien countAllBiens() {
			Bien biens = null;
			String sql = "select count(bien_id), bien_id, bien_type from biens where bien_type = 'Appartement' or bien_type = 'Maisons' or bien_type = 'Riyads' or bien_type = 'Villas'";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					biens = new Bien();
					biens.setCount(result.getInt("count(bien_id)"));
					biens.setId(result.getInt("bien_id"));
					biens.setType(result.getString("bien_type"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return biens;
		}
		public List<Bien> selectAllTerrains() {
			List<Bien> biens = new ArrayList<>();
			String sql = "select * from biens where bien_type = 'Terrain'";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int id = result.getInt("bien_id");
					String nom = result.getString("bien_nom");
					String type = result.getString("bien_type");
					String adresse = result.getString("bien_addresse");
					String superficie = result.getString("bien_superficie");
					String chambres = result.getString("bien_chambres");
					String syndic = result.getString("bien_syndic");
					Date date = result.getDate("bien_ajout");
					String garage = result.getString("bien_garage");
					String description = result.getString("bien_description");
					String image = result.getString("bien_image");
					int prix = result.getInt("bien_prix");
					biens.add(new Bien(id, nom, type, adresse, superficie, chambres, syndic, date, garage, description, image, prix));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return biens;
		}
		public Bien countAllTerrains() {
			Bien biens = null;
			String sql = "select count(bien_id) from biens where bien_type = 'Terrain'";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					biens = new Bien();
					biens.setCount(result.getInt("count(bien_id)"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return biens;
		}
		public List<Bien> selectAllCommerce() {
			List<Bien> biens = new ArrayList<>();
			String sql = "select * from biens where bien_type = 'Bureaux & commerce'";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int id = result.getInt("bien_id");
					String nom = result.getString("bien_nom");
					String type = result.getString("bien_type");
					String adresse = result.getString("bien_addresse");
					String superficie = result.getString("bien_superficie");
					String chambres = result.getString("bien_chambres");
					String syndic = result.getString("bien_syndic");
					Date date = result.getDate("bien_ajout");
					String garage = result.getString("bien_garage");
					String description = result.getString("bien_description");
					String image = result.getString("bien_image");
					int prix = result.getInt("bien_prix");
					biens.add(new Bien(id, nom, type, adresse, superficie, chambres, syndic, date, garage, description, image, prix));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return biens;
		}
		public Bien countAllCommerce() {
			Bien biens = null;
			String sql = "select count(bien_id) from biens where bien_type = 'Bureaux & commerce'";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					biens = new Bien();
					biens.setCount(result.getInt("count(bien_id)"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return biens;
		}
		//select bien by id
		public Bien selectBien(int id) {
			Bien bien = null;
			String sql ="select * from biens where bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet result = ps.executeQuery();
				if(result.next()) {
					bien = new Bien();
					bien.setNom(result.getString("bien_nom"));
					bien.setAdresse(result.getString("bien_addresse"));
					bien.setChambres(result.getString("bien_chambres"));
					bien.setDescription(result.getString("bien_description"));
					bien.setGarage(result.getString("bien_garage"));
					bien.setImage(result.getString("bien_image"));
					bien.setSuperficie(result.getString("bien_superficie"));
					bien.setSyndic(result.getString("bien_syndic"));
					bien.setType(result.getString("bien_type"));
					bien.setPrix(result.getInt("bien_prix"));
					bien.setId(result.getInt("bien_id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return bien;
		}
		//update bien without image
		public boolean updateBien(Bien bien) {
			boolean set = false;
			String sql = "update biens set bien_nom=?, bien_type=?, bien_addresse=?, bien_superficie=?, bien_syndic=?, bien_garage=?,"
					+ "bien_description=?, bien_prix=? where bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, bien.getNom());
				ps.setString(2, bien.getType());
				ps.setString(3, bien.getAdresse());
				ps.setString(4, bien.getSuperficie());
				ps.setString(5, bien.getSyndic());
				ps.setString(6, bien.getGarage());
				ps.setString(7, bien.getDescription());
				ps.setInt(8, bien.getPrix());
				ps.setInt(9, bien.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean updateBienImg(Bien bien) {
			boolean set = false;
			String sql = "update biens set bien_nom=?, bien_type=?, bien_addresse=?, bien_superficie=?, bien_syndic=?, bien_garage=?,"
					+ "bien_description=?, bien_image=? where bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, bien.getNom());
				ps.setString(2, bien.getType());
				ps.setString(3, bien.getAdresse());
				ps.setString(4, bien.getSuperficie());
				ps.setString(5, bien.getSyndic());
				ps.setString(6, bien.getGarage());
				ps.setString(7, bien.getDescription());
				ps.setString(8, bien.getImage());
				ps.setInt(9, bien.getPrix());
				ps.setInt(10, bien.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//delete bien
		public boolean delete(int id) {
			boolean set = false;
			String sql = "delete from biens where bien_id=?";
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
}

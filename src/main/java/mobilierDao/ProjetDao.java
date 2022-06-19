package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mobilierModel.Projet;
import mobilierModel.ProjetBien;

public class ProjetDao {
	Connection conn;
	public ProjetDao(Connection conn) {
		this.conn = conn;
	}
	//insert projet
		public boolean insert(Projet projet) {
			boolean set = false;
			Date date = new Date();
			java.sql.Date projetDate = new java.sql.Date(date.getTime());
			String sql = "insert into projets (pro_etat, pro_description, pro_date, "
					+ "pro_image, pro_nom, pro_ajout, pro_unite, pro_ville) values(?,?,?,?,?,?,?,?)";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, projet.getEtat());
				ps.setString(2, projet.getDescription());
				ps.setString(3, projet.getDate());
				ps.setString(4, projet.getImage());
				ps.setString(5, projet.getNom());
				ps.setDate(6, projetDate);
				ps.setString(7, projet.getUnite());
				ps.setString(8, projet.getVille());
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean insert(ProjetBien bien) {
			boolean set = false;
			String sql = "insert into bienprojet (bien_nom, bien_prix, bien_prix_metre, bien_chambres, bien_type, bien_projet) values(?,?,?,?,?,?)";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, bien.getNom());
				ps.setInt(2, bien.getPrix());
				ps.setInt(3, bien.getPrixMetre());
				ps.setInt(4, bien.getChambre());
				ps.setString(5, bien.getType());
				ps.setInt(6, bien.getProjet());
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//select tous les projets
		public List<Projet> selectAllProjet() {
		List<Projet> projets = new ArrayList<>();
		String sql = "SELECT * FROM projets";
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
				projets.add(new Projet(id, etat, description, date, image, nom, dateAjout, unite, ville));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return projets;
		}
		public List<ProjetBien> selectAll() {
		List<ProjetBien> projets = new ArrayList<>();
		String sql = "SELECT * FROM projets INNER JOIN bienprojet ON projets.pro_id=bienprojet.bien_projet";
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
				int projet = result.getInt("bien_projet");
				projets.add(new ProjetBien(id, etat, description, date, image, nom, dateAjout, unite, ville, bienId, prix, prixMetre, chambre,
						projet, nomResd, type));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return projets;
		}
		//select projet by id
		public Projet selectProjet(int id) {
			Projet projet = null;
			String sql ="select * from projets where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet result = ps.executeQuery();
				if(result.next()) {
					projet = new Projet();
					projet.setEtat(result.getString("pro_etat"));
					projet.setDescription(result.getString("pro_description"));
					projet.setDate(result.getString("pro_date"));
					projet.setImage(result.getString("pro_image"));
					projet.setNom(result.getString("pro_nom"));
					projet.setUnite(result.getString("pro_unite"));
					projet.setVille(result.getString("pro_ville"));
					projet.setId(result.getInt("pro_id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return projet;
		}
		public ProjetBien selectBiens(int id) {
			ProjetBien projet = null;
			String sql ="SELECT * FROM projets INNER JOIN bienprojet ON projets.pro_id=bien_projet WHERE bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet result = ps.executeQuery();
				if(result.next()) {
					projet = new ProjetBien();
					projet.setEtat(result.getString("pro_etat"));
					projet.setDescription(result.getString("pro_description"));
					projet.setDate(result.getString("pro_date"));
					projet.setImage(result.getString("pro_image"));
					projet.setNomProjet(result.getString("pro_nom"));
					projet.setUnite(result.getString("pro_unite"));
					projet.setVille(result.getString("pro_ville"));
					projet.setProjetId(result.getInt("pro_id"));
					projet.setId(result.getInt("bien_id"));
					projet.setNom(result.getString("bien_nom"));
					projet.setPrix(result.getInt("bien_prix"));
					projet.setPrixMetre(result.getInt("bien_prix_metre"));
					projet.setChambre(result.getInt("bien_chambres"));
					projet.setType(result.getString("bien_type"));
					projet.setProjet(result.getInt("bien_projet"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return projet;
		}
		//update projet without image
		public boolean updateProjet(Projet projet) {
			boolean set = false;
			String sql = "update projets set pro_etat=?, pro_description=?, pro_date=?, "
					+ "pro_nom=?, pro_unite=?, pro_ville=? where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, projet.getEtat());
				ps.setString(2, projet.getDescription());
				ps.setString(3, projet.getDate());
				ps.setString(4, projet.getNom());
				ps.setString(5, projet.getUnite());
				ps.setString(6, projet.getVille());
				ps.setInt(7, projet.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean updateProjetBien(ProjetBien projet) {
			boolean set = false;
			String sql = "UPDATE projets INNER JOIN bienprojet ON projets.pro_id=bienprojet.bien_projet SET pro_etat=?, "
					+ "pro_description=?, pro_date=?, pro_nom=?, pro_unite=?, pro_ville=?, bien_nom=?, bien_prix=?, bien_prix_metre=?, "
					+ "bien_chambres=?, bien_type=? WHERE bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setObject(1, projet.getEtat());
				ps.setObject(2, projet.getDescription());
				ps.setObject(3, projet.getDate());
				ps.setObject(4, projet.getNomProjet());
				ps.setObject(5, projet.getUnite());
				ps.setObject(6, projet.getVille());
				ps.setString(7, projet.getNom());
				ps.setInt(8, projet.getPrix());
				ps.setInt(9, projet.getPrixMetre());
				ps.setInt(10, projet.getChambre());
				ps.setString(11, projet.getType());
				ps.setInt(12, projet.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean updateProjetBienImg(ProjetBien projet) {
			boolean set = false;
			String sql = "UPDATE projets INNER JOIN bienprojet ON projets.pro_id=bienprojet.bien_projet SET pro_etat=?, "
					+ "pro_description=?, pro_date=?, pro_nom=?, pro_unite=?, pro_ville=?, pro_image=?, bien_nom=?, bien_prix=?, "
					+ "bien_prix_metre=?, bien_chambres=?, bien_type=? WHERE bien_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setObject(1, projet.getEtat());
				ps.setObject(2, projet.getDescription());
				ps.setObject(3, projet.getDate());
				ps.setObject(4, projet.getNomProjet());
				ps.setObject(5, projet.getUnite());
				ps.setObject(6, projet.getVille());
				ps.setObject(7, projet.getImage());
				ps.setString(8, projet.getNom());
				ps.setInt(9, projet.getPrix());
				ps.setInt(10, projet.getPrixMetre());
				ps.setInt(11, projet.getChambre());
				ps.setString(12, projet.getType());
				ps.setInt(13, projet.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public boolean updateProjetImg(Projet projet) {
			boolean set = false;
			String sql = "update projets set pro_etat=?, pro_description=?, pro_date=?, "
					+ "pro_image=?, pro_nom=?, pro_unite=? pro_ville=? where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, projet.getEtat());
				ps.setString(2, projet.getDescription());
				ps.setString(3, projet.getDate());
				ps.setString(4, projet.getImage());
				ps.setString(5, projet.getNom());
				ps.setString(6, projet.getUnite());
				ps.setString(7, projet.getVille());
				ps.setInt(8, projet.getId());
				ps.executeUpdate();
				set =true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//delete projet
		public boolean delete(int id) {
			boolean set = false;
			String sql = "delete from bienprojet where bien_id=?";
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
		// Count projets
		public ProjetBien countAll() {
			ProjetBien projet = null;
			String sql = "select count(bien_id) from bienprojet";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					projet = new ProjetBien();
					projet.setId(result.getInt("count(bien_id)"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return projet;
		}
}

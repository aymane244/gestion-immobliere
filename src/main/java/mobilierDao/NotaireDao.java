package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mobilierModel.Notaire;

public class NotaireDao {
	Connection conn;
	public NotaireDao (Connection conn){
		this.conn = conn;
	}
	//notaire insert insert
	public boolean insert(Notaire notaire) {
		boolean set = false;
		String sql = "insert into notaire (not_nom, not_prenom, not_cin, not_telephone, not_email, not_motdepasse, "
					+ "not_image) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, notaire.getNom());
			ps.setString(2, notaire.getPrenom());
			ps.setString(3, notaire.getCin());
			ps.setString(4, notaire.getTelephone());
			ps.setString(5, notaire.getEmail());
			ps.setString(6, notaire.getMotdepasse());
			ps.setString(7, notaire.getImage());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//login notaire
	public Notaire select(String cin, String motdepasse) {
		Notaire notaire = null;
		String sql = "select * from notaire where not_cin=? and not_motdepasse=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, cin);
			ps.setString(2, motdepasse);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				notaire = new Notaire();
				notaire.setId(result.getInt("not_id"));
				notaire.setNom(result.getString("not_nom"));
				notaire.setPrenom(result.getString("not_prenom"));
				notaire.setCin(result.getString("not_cin"));
				notaire.setEmail(result.getString("not_email"));
				notaire.setTelephone(result.getString("not_telephone"));
				notaire.setMotdepasse(result.getString("not_motdepasse"));
				notaire.setImage(result.getString("not_image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notaire;
	}
	//check notaire email
	public Notaire checkEmail(String email) {
		Notaire notaire = null;
		String sql = "select not_email from notaire where not_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				notaire = new Notaire();
				notaire.setEmail(result.getString("not_email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notaire;
	}
	//notaire check cin
	public Notaire checkCin(String cin) {
		Notaire notaire = null;
		String sql = "select not_cin from notaire where not_cin=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, cin);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				notaire = new Notaire();
				notaire.setEmail(result.getString("not_cin"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notaire;
	}
	//update notaire password
	public boolean update(Notaire notaire) {
		boolean set = false;
		String sql = "update notaire set not_motdepasse=? where not_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, notaire.getMotdepasse());
			ps.setString(2, notaire.getEmail());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean updateProfile(Notaire notaire) {
		boolean set = false;
		String sql = "update notaire set not_nom=?, not_prenom=?, not_cin=?, not_telephone=?, not_email=? where not_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, notaire.getNom());
			ps.setString(2, notaire.getPrenom());
			ps.setString(3, notaire.getCin());
			ps.setString(4, notaire.getTelephone());
			ps.setString(5, notaire.getEmail());
			ps.setInt(6, notaire.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public boolean updateProfileImage(Notaire notaire) {
		boolean set = false;
		String sql = "update notaire set not_nom=?, not_prenom=?, not_cin=?, not_telephone=?, not_email=?, not_image=? where not_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, notaire.getNom());
			ps.setString(2, notaire.getPrenom());
			ps.setString(3, notaire.getCin());
			ps.setString(4, notaire.getTelephone());
			ps.setString(5, notaire.getEmail());
			ps.setString(6, notaire.getImage());
			ps.setInt(7, notaire.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<Notaire> selectAll() {
		List<Notaire> notaires = new ArrayList<>();
		String sql = "select * from notaire";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("not_id");
				String nom = result.getString("not_nom");
				String prenom = result.getString("not_prenom");
				String cin = result.getString("not_cin");
				String telephone = result.getString("not_telephone");
				String email = result.getString("not_email");
				String image = result.getString("not_image");
				notaires.add(new Notaire(id, nom, prenom, cin, telephone, email, image));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notaires;
	}
	public List <Notaire> countNotaire() {
		List <Notaire> notaires = new ArrayList<>();
		String sql ="select count(not_id) from notaire";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(not_id)");
				notaires.add(new Notaire(count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notaires;
	}
	public Notaire selectNotaire(int id) {
		Notaire notaire = null;
		String sql ="select * from notaire where not_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				notaire = new Notaire();
				notaire.setNom(result.getString("not_nom"));
				notaire.setPrenom(result.getString("not_prenom"));
				notaire.setEmail(result.getString("not_email"));
				notaire.setCin(result.getString("not_cin"));
				notaire.setTelephone(result.getString("not_telephone"));
				notaire.setImage(result.getString("not_image"));
				notaire.setId(result.getInt("not_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notaire;
	}
	public boolean delete(int id) {
		boolean set = false;
		String sql = "delete from notaire where not_id=?";
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

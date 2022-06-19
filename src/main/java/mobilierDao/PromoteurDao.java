package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mobilierModel.Promoteur;


public class PromoteurDao {
	Connection conn;
	public PromoteurDao (Connection conn){
		this.conn = conn;
	}
	//promoteur insert
	public boolean insert(Promoteur promoteur) {
		boolean set = false;
		String sql = "insert into promoteur (pro_nom, pro_prenom, pro_cin, pro_telephone, pro_email, pro_motdepasse, "
					+ "pro_image) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, promoteur.getNom());
			ps.setString(2, promoteur.getPrenom());
			ps.setString(3, promoteur.getCin());
			ps.setString(4, promoteur.getTelephone());
			ps.setString(5, promoteur.getEmail());
			ps.setString(6, promoteur.getMotdepasse());
			ps.setString(7, promoteur.getImage());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//login promoteur
	public Promoteur select(String cin, String motdepasse) {
		Promoteur promoteur = null;
		String sql = "select * from promoteur where pro_cin=? and pro_motdepasse=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, cin);
			ps.setString(2, motdepasse);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				promoteur = new Promoteur();
				promoteur.setId(result.getInt("pro_id"));
				promoteur.setNom(result.getString("pro_nom"));
				promoteur.setPrenom(result.getString("pro_prenom"));
				promoteur.setCin(result.getString("pro_cin"));
				promoteur.setEmail(result.getString("pro_email"));
				promoteur.setTelephone(result.getString("pro_telephone"));
				promoteur.setMotdepasse(result.getString("pro_motdepasse"));
				promoteur.setImage(result.getString("pro_image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return promoteur;
	}
	//check promoteur email
	public Promoteur checkEmail(String email) {
		Promoteur promoteur = null;
		String sql = "select pro_email from promoteur where pro_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				promoteur = new Promoteur();
				promoteur.setEmail(result.getString("pro_email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return promoteur;
	}
	//promoteur check cin
	public Promoteur checkCin(String cin) {
		Promoteur promoteur = null;
		String sql = "select pro_cin from promoteur where pro_cin=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, cin);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				promoteur = new Promoteur();
				promoteur.setEmail(result.getString("pro_cin"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return promoteur;
	}
	//update promoteur password
	public boolean update(Promoteur promoteur) {
		boolean set = false;
		String sql = "update promoteur set pro_motdepasse=? where pro_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, promoteur.getMotdepasse());
			ps.setString(2, promoteur.getEmail());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//update promoteur profile without image
		public boolean updateProfile(Promoteur promoteur) {
			boolean set = false;
			String sql = "update promoteur set pro_nom=?, pro_prenom=?, pro_cin=?, pro_telephone=?, pro_email=? where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, promoteur.getNom());
				ps.setString(2, promoteur.getPrenom());
				ps.setString(3, promoteur.getCin());
				ps.setString(4, promoteur.getTelephone());
				ps.setString(5, promoteur.getEmail());
				ps.setInt(6, promoteur.getId());
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		//Update promoteur with image
		public boolean updateProfileImage(Promoteur promoteur) {
			boolean set = false;
			String sql = "update promoteur set pro_nom=?, pro_prenom=?, pro_cin=?, pro_telephone=?, pro_email=?, pro_image=? where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, promoteur.getNom());
				ps.setString(2, promoteur.getPrenom());
				ps.setString(3, promoteur.getCin());
				ps.setString(4, promoteur.getTelephone());
				ps.setString(5, promoteur.getEmail());
				ps.setString(6, promoteur.getImage());
				ps.setInt(7, promoteur.getId());
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public List <Promoteur> countPromoteur() {
			List <Promoteur> promoteurs = new ArrayList<>();
			String sql ="select count(pro_id) from promoteur";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int count = result.getInt("count(pro_id)");
					promoteurs.add(new Promoteur(count));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return promoteurs;
		}
		public List<Promoteur> selectAll() {
			List<Promoteur> promoteurs = new ArrayList<>();
			String sql = "SELECT * FROM promoteur";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int id = result.getInt("pro_id");
					String nom = result.getString("pro_nom");
					String prenom = result.getString("pro_prenom");
					String email = result.getString("pro_email");
					String image = result.getString("pro_image");
					String cin = result.getString("pro_cin");
					String telephone = result.getString("pro_telephone");
					promoteurs.add(new Promoteur(id, nom, prenom, cin, telephone, email, image));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return promoteurs;
		}
		public Promoteur selectPromoteur(int id) {
			Promoteur promoteur = null;
			String sql ="select * from promoteur where pro_id=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet result = ps.executeQuery();
				if(result.next()) {
					promoteur = new Promoteur();
					promoteur.setNom(result.getString("pro_nom"));
					promoteur.setPrenom(result.getString("pro_prenom"));
					promoteur.setEmail(result.getString("pro_email"));
					promoteur.setTelephone(result.getString("pro_telephone"));
					promoteur.setCin(result.getString("pro_cin"));
					promoteur.setImage(result.getString("pro_image"));
					promoteur.setId(result.getInt("pro_id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return promoteur;
		}
		public boolean delete(int id) {
			boolean set = false;
			String sql = "delete from promoteur where pro_id=?";
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

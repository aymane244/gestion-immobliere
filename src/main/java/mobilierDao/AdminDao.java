package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mobilierModel.Admin;

public class AdminDao {
	Connection conn;
	public AdminDao(Connection conn){
		this.conn = conn;
	}
	//admin insert
	public boolean insert(Admin admin) {
		boolean set = false;
		Date date = new Date();
		java.sql.Date adminDate = new java.sql.Date(date.getTime());
		String sql = "insert into admin (adm_nom, adm_prenom, adm_email, adm_motdepasse, adm_image, adm_date, admin_role) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, admin.getNom());
			ps.setString(2, admin.getPrenom());
			ps.setString(3, admin.getEmail());
			ps.setString(4, admin.getMotdepasse());
			ps.setString(5, admin.getImage());
			ps.setDate(6, adminDate);
			ps.setObject(7, admin.getRoleId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//login admin
	public Admin select(String email, String motdepasse) {
		Admin admin = null;
		String sql = "select * from admin inner join role on admin.admin_role=role.rol_id where adm_email=? and adm_motdepasse=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, motdepasse);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				admin = new Admin();
				admin.setId(result.getInt("adm_id"));
				admin.setNom(result.getString("adm_nom"));
				admin.setPrenom(result.getString("adm_prenom"));
				admin.setEmail(result.getString("adm_email"));
				admin.setMotdepasse(result.getString("adm_motdepasse"));
				admin.setImage(result.getString("adm_image"));
				admin.setDate(result.getDate("adm_date"));
				admin.setRole(result.getInt("admin_role"));
				admin.setRoleId(result.getString("rol_nom"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}
	//check admin email
	public Admin check(String email) {
		Admin admin = null;
		String sql = "select adm_email from admin where adm_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				admin = new Admin();
				admin.setEmail(result.getString("adm_email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}
	//update admin password
	public boolean update(Admin admin) {
		boolean set = false;
		String sql = "update admin set adm_password=? where adm_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, admin.getMotdepasse());
			ps.setString(2, admin.getEmail());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//update admin profile without image
	public boolean updateProfile(Admin admin) {
		boolean set = false;
		String sql = "update admin set adm_nom=?, adm_prenom=?, adm_email=?, admin_role=? where adm_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, admin.getNom());
			ps.setString(2, admin.getPrenom());
			ps.setString(3, admin.getEmail());
			ps.setInt(4, admin.getRole());
			ps.setInt(5, admin.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//Update admin with image
	public boolean updateProfileImage(Admin admin) {
		boolean set = false;
		String sql = "update admin set adm_nom=?, adm_prenom=?, adm_email=?, amd_image=?, admin_role=? where adm_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, admin.getNom());
			ps.setString(2, admin.getPrenom());
			ps.setString(3, admin.getEmail());
			ps.setString(4, admin.getImage());
			ps.setInt(5, admin.getRole());
			ps.setInt(6, admin.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<Admin> selectAll() {
		List<Admin> admins = new ArrayList<>();
		String sql = "SELECT * FROM admin INNER JOIN role ON admin.admin_role=role.rol_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("adm_id");
				String nom = result.getString("adm_nom");
				String prenom = result.getString("adm_prenom");
				String email = result.getString("adm_email");
				String image = result.getString("adm_image");
				Object roleNom = result.getString("rol_nom");
				int roleId = result.getInt("rol_id");
				admins.add(new Admin(id, nom, prenom, email, image, roleNom, roleId));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admins;
	}
	public Admin selectAdmin(int id) {
		Admin admin = null;
		String sql ="SELECT * FROM admin INNER JOIN role ON admin.admin_role=role.rol_id WHERE adm_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				admin = new Admin();
				admin.setNom(result.getString("adm_nom"));
				admin.setPrenom(result.getString("adm_prenom"));
				admin.setEmail(result.getString("adm_email"));
				admin.setImage(result.getString("adm_image"));
				admin.setRoleNom(result.getObject("rol_nom"));
				admin.setRole(result.getInt("admin_role"));
				admin.setId(result.getInt("adm_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return admin;
	}
	public boolean delete(int id) {
		boolean set = false;
		String sql = "delete from admin where adm_id=?";
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

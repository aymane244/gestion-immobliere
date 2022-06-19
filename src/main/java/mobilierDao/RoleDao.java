package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mobilierModel.Role;

public class RoleDao {
	Connection conn;
	public RoleDao(Connection conn){
		this.conn = conn;
	}
	public List<Role> selectAll() {
		List<Role> roles = new ArrayList<>();
		String sql = "select * from role";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("rol_id");
				String nom = result.getString("rol_nom");
				roles.add(new Role(id, nom));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return roles;
	}
	public List <Role> countRole() {
		List <Role> roles = new ArrayList<>();
		String sql ="select count(rol_id) from role";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(rol_id)");
				roles.add(new Role(count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return roles;
	}
	public boolean insert(Role role) {
		boolean set =false;
		String sql ="INSERT INTO role (rol_nom) VALUES (?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setObject(1, role.getNom());
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
		String sql = "delete from role where rol_id=?";
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
	public Role selectRole(int id) {
		Role role = null;
		String sql ="select * from role where rol_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				role = new Role();
				role.setNom(result.getString("rol_nom"));
				role.setId(result.getInt("rol_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return role;
	}
	public boolean update(Role role) {
		boolean set = false;
		try {
			String sql= "update role set rol_nom=? WHERE rol_id=?";
			PreparedStatement ps = this.conn.prepareStatement(sql);	
			ps =this.conn.prepareStatement(sql);
			ps.setString(1, role.getNom());
			ps.setInt(2, role.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
}

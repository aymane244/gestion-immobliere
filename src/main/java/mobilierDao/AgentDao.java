package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mobilierModel.Agent;

public class AgentDao {
	Connection conn;
	public AgentDao(Connection conn){
		this.conn = conn;
	}
	//agent insert
	public boolean insert(Agent agent) {
		boolean set = false;
		String sql = "insert into agent (agt_nom, agt_prenom, agt_email, agt_cin, agt_password, agt_image) values(?,?,?,?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, agent.getNom());
			ps.setString(2, agent.getPrenom());
			ps.setString(3, agent.getEmail());
			ps.setString(4, agent.getCin());
			ps.setString(5, agent.getMotdepasse());
			ps.setString(6, agent.getImage());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//login agent
	public Agent select(String email, String motdepasse) {
		Agent agent = null;
		String sql = "select * from agent where agt_email=? and agt_password=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, motdepasse);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				agent = new Agent();
				agent.setId(result.getInt("agt_id"));
				agent.setNom(result.getString("agt_nom"));
				agent.setPrenom(result.getString("agt_prenom"));
				agent.setEmail(result.getString("agt_email"));
				agent.setCin(result.getString("agt_cin"));
				agent.setMotdepasse(result.getString("agt_password"));
				agent.setImage(result.getString("agt_image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agent;
	}
	//check agent email
	public Agent checkEmail(String email) {
		Agent agent = null;
		String sql = "select agt_email from agent where agt_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				agent = new Agent();
				agent.setEmail(result.getString("agt_email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agent;
	}
	//agent check cin
	public Agent checkCin(String cin) {
		Agent agent = null;
		String sql = "select agt_cin from agent where agt_cin=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, cin);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				agent = new Agent();
				agent.setEmail(result.getString("agt_cin"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agent;
	}
	//update agent password
	public boolean update(Agent agent) {
		boolean set = false;
		String sql = "update agent set agt_password=? where agt_email=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, agent.getMotdepasse());
			ps.setString(2, agent.getEmail());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//update agent profile without image
	public boolean updateProfile(Agent agent) {
		boolean set = false;
		String sql = "update agent set agt_nom=?, agt_prenom=?, agt_email=?, agt_cin=? where agt_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, agent.getNom());
			ps.setString(2, agent.getPrenom());
			ps.setString(3, agent.getEmail());
			ps.setString(4, agent.getCin());
			ps.setInt(5, agent.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//Update agent with image
	public boolean updateProfileImage(Agent agent) {
		boolean set = false;
		String sql = "update agent set agt_nom=?, agt_prenom=?, agt_email=?, agt_cin=?, agt_image=? where agt_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, agent.getNom());
			ps.setString(2, agent.getPrenom());
			ps.setString(3, agent.getEmail());
			ps.setString(4, agent.getCin());
			ps.setString(5, agent.getImage());
			ps.setInt(6, agent.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List <Agent> countAgent() {
		List <Agent> agents = new ArrayList<>();
		String sql ="select count(agt_id) from agent";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(agt_id)");
				agents.add(new Agent(count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agents;
	}
	public List<Agent> selectAll() {
		List<Agent> agents = new ArrayList<>();
		String sql = "SELECT * FROM agent";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("agt_id");
				String nom = result.getString("agt_nom");
				String prenom = result.getString("agt_prenom");
				String email = result.getString("agt_email");
				String image = result.getString("agt_image");
				String cin = result.getString("agt_cin");
				agents.add(new Agent(id, nom, prenom, email, cin, image));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agents;
	}
	public Agent selectAgent(int id) {
		Agent agent = null;
		String sql ="select * from agent where agt_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				agent = new Agent();
				agent.setNom(result.getString("agt_nom"));
				agent.setPrenom(result.getString("agt_prenom"));
				agent.setEmail(result.getString("agt_email"));
				agent.setCin(result.getString("agt_cin"));
				agent.setImage(result.getString("agt_image"));
				agent.setId(result.getInt("agt_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agent;
	}
	public boolean delete(int id) {
		boolean set = false;
		String sql = "delete from agent where agt_id=?";
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

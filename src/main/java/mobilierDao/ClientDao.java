package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mobilierModel.*;

public class ClientDao {
	Connection conn;
	public ClientDao(Connection conn) {
		this.conn = conn;
	}
	//client inscription
	public boolean insert(Client clients) {
		boolean set =false;
		try{
			String sql ="insert into client (clt_nom, clt_prenom, clt_email, clt_telephone, clt_password, clt_image)"+
						"values(?,?,?,?,?,?)";
			PreparedStatement ps = this.conn.prepareStatement(sql);	
			ps.setString(1, clients.getNom());
			ps.setString(2, clients.getPrenom());
			ps.setString(3, clients.getEmail());
			ps.setString(4, clients.getTelephone());
			ps.setString(5, clients.getMotdepasse());
			ps.setString(6, clients.getImage());
			ps.executeUpdate();
			set =true;	
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return set;
	}
	//client login
	public Client select(String email, String motdepasse) {
		Client client = null;
		try{
			String sql = "select * from client where clt_email=? and clt_password=?";
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, motdepasse);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				client = new Client();
				client.setId(result.getInt("clt_id"));
				client.setNom(result.getString("clt_nom"));
				client.setPrenom(result.getString("clt_prenom"));
				client.setEmail(result.getString("clt_email"));
				client.setTelephone(result.getString("clt_telephone"));
				client.setMotdepasse(result.getString("clt_password"));
				client.setImage(result.getString("clt_image"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return client;
	}
	//select tous les clients
	public List<Client> selectAll() {
		List<Client> clients = new ArrayList<>();
		String sql = "select * from client";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("clt_id");
				String nom = result.getString("clt_nom");
				String prenom = result.getString("clt_prenom");
				String email = result.getString("clt_email");
				String telephone = result.getString("clt_telephone");
				String image = result.getString("clt_image");
				clients.add(new Client(id, nom, prenom, email, telephone, image));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clients;
	}
	//select client by id
	public Client selectClient(int id) {
		Client client = null;
		String sql ="select * from client where clt_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				client = new Client();
				client.setNom(result.getString("clt_nom"));
				client.setPrenom(result.getString("clt_prenom"));
				client.setEmail(result.getString("clt_email"));
				client.setTelephone(result.getString("clt_telephone"));
				client.setImage(result.getString("clt_image"));
				client.setId(result.getInt("clt_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;
	}
	//client check with email already exists
	public Client check(String email) {
		Client client = null;
		String sql = "select clt_email from client where clt_email=?";
		PreparedStatement ps;
		try {
			ps = this.conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				client = new Client();
				client.setEmail(result.getString("clt_email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;
	}
	//client update password
	public boolean update(Client client) {
		boolean set = false;
		try {
			String sql= "update client set clt_password=? WHERE clt_email=?";
			PreparedStatement ps = this.conn.prepareStatement(sql);	
			ps =this.conn.prepareStatement(sql);
			ps.setString(1, client.getMotdepasse());
			ps.setString(2, client.getEmail());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//update client profile without image
	public boolean updateProfile(Client client) {
		boolean set = false;
		String sql = "update client set clt_nom=?, clt_prenom=?, clt_email=?, clt_telephone=? where clt_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, client.getNom());
			ps.setString(2, client.getPrenom());
			ps.setString(3, client.getEmail());
			ps.setString(4, client.getTelephone());
			ps.setInt(5, client.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//Update client with image
	public boolean updateProfileImage(Client client) {
		boolean set = false;
		String sql = "update client set clt_nom=?, clt_prenom=?, clt_email=?, clt_telephone=?, clt_image=? where clt_id=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, client.getNom());
			ps.setString(2, client.getPrenom());
			ps.setString(3, client.getEmail());
			ps.setString(4, client.getTelephone());
			ps.setString(5, client.getImage());
			ps.setInt(6, client.getId());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List <Client> countClient() {
		List <Client> clients = new ArrayList<>();
		String sql ="select clt_nom, count(clt_id) from client";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(clt_id)");
				String client = result.getString("clt_nom");
				clients.add(new Client(client, count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clients;
	}
	public boolean delete(int id) {
		boolean set = false;
		String sql = "delete from client where clt_id=?";
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

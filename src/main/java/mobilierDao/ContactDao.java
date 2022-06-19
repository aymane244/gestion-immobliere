package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mobilierModel.Contact;

public class ContactDao {
	Connection conn;
	public ContactDao(Connection conn) {
		this.conn = conn;
	}
	public boolean insertContact(Contact contact) {
		boolean set = false;
		Date date = new Date();
		java.sql.Date dateContact = new java.sql.Date(date.getTime()); 
		String sql = "insert into contact (con_nom, con_email, con_sujet, con_message, con_ajout) values(?,?,?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, contact.getNom());
			ps.setString(2, contact.getEmail());
			ps.setString(3, contact.getSujet());
			ps.setString(4, contact.getMessage());
			ps.setDate(5, dateContact);
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public List<Contact> selectAll() {
		List<Contact> contacts = new ArrayList<>();
		String sql = "select * from contact";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				String nom = result.getString("con_nom");
				String email = result.getString("con_email");
				String sujet = result.getString("con_sujet");
				String message = result.getString("con_message");
				Date date = result.getDate("con_ajout");
				int id = result.getInt("con_id");
				contacts.add(new Contact(nom, email, sujet, message, date, id));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contacts;
	}
	public List <Contact> countContact() {
		List <Contact> contacts = new ArrayList<>();
		String sql ="select con_nom, count(con_id) from contact";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(con_id)");
				String client = result.getString("con_nom");
				contacts.add(new Contact(client, count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contacts;
	}
	public boolean delete(int id) {
		boolean set = false;
		String sql = "delete from contact where con_id=?";
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

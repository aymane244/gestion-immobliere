package mobilierDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mobilierModel.Reservation;
import mobilierModel.ReservationProgramme;
import mobilierModel.ReservationProjet;

public class ReservationDao {
	Connection conn;
	public ReservationDao(Connection conn) {
		this.conn = conn;
	}
	//reservation insert
	public boolean insertReservation(Reservation reservation) {
		boolean set = false;
		Date date = new Date();
		java.sql.Date reservationDate = new java.sql.Date(date.getTime());
		String sql="insert into reservation (res_nom, res_email, res_phone, res_date, res_heure, res_ajout, res_bien) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, reservation.getNom());
			ps.setString(2, reservation.getEmail());
			ps.setString(3, reservation.getPhone());
			ps.setString(4, reservation.getDate());
			ps.setString(5, reservation.getHeure());
			ps.setDate(6, reservationDate);
			ps.setInt(7, reservation.getBien());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	//check date and bien id
	public Reservation checkReservation(String date, String heure, int bienId) {
		Reservation reservation = null;
		String sql = "select res_date, res_heure, res_bien from reservation where res_date=? and res_heure=? and res_bien=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, date);
			ps.setString(2, heure);
			ps.setInt(3, bienId);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				reservation = new Reservation();
				reservation.setDate(result.getString("res_date"));
				reservation.setHeure(result.getString("res_heure"));
				reservation.setBien(result.getInt("res_bien"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservation;
	}
	//select reservations
	public List<Reservation> selectAll(){
		List<Reservation> reservations = new ArrayList<>();
		String sql ="SELECT * FROM reservation INNER JOIN biens ON reservation.res_bien = biens.bien_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("res_id");
				String nom = result.getString("res_nom");
				String email = result.getString("res_email");
				String phone = result.getString("res_phone");
				String date = result.getString("res_date");
				String heure = result.getString("res_heure");
				int bien = result.getInt("res_bien");
				Object bienNom = result.getObject("bien_nom");
				reservations.add(new Reservation(id, nom, email, phone, date, heure, bien, bienNom));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservations;
	}
	public List <Reservation> countreservation() {
		List <Reservation> reservations = new ArrayList<>();
		String sql ="select res_nom, count(res_id) from reservation";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(res_id)");
				String client = result.getString("res_nom");
				reservations.add(new Reservation(client, count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservations;
	}
	public boolean deleteRes(int id) {
		boolean set = false;
		String sql = "delete from reservation where res_id=?";
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
	//reservation Programme insert
	public boolean insertReservationProgramme(ReservationProgramme reservation) {
		boolean set = false;
		Date date = new Date();
		java.sql.Date reservationDate = new java.sql.Date(date.getTime());
		String sql="INSERT INTO reservationprogramme (res_nom, res_email, res_phone, res_date, res_heure, res_ajout, res_programme"
				+ ") VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, reservation.getNom());
			ps.setString(2, reservation.getEmail());
			ps.setString(3, reservation.getPhone()); 
			ps.setString(4, reservation.getDate());
			ps.setString(5, reservation.getHeure());
			ps.setDate(6, reservationDate);
			ps.setInt(7, reservation.getProgramme());
			ps.executeUpdate();
			set = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return set;
	}
	public ReservationProgramme checkReservationProgramme(String date, String heure, int programmeId) {
		ReservationProgramme reservation = null;
		String sql = "select res_date, res_heure, res_programme from reservationprogramme where res_date=? and res_heure=? and res_programme=?";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, date);
			ps.setString(2, heure);
			ps.setInt(3, programmeId);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				reservation = new ReservationProgramme();
				reservation.setDate(result.getString("res_date"));
				reservation.setHeure(result.getString("res_heure"));
				reservation.setProgramme(result.getInt("res_programme"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservation;
	}
	public List<ReservationProgramme> selectAllProgramme(){
		List<ReservationProgramme> reservations = new ArrayList<>();
		String sql ="SELECT * FROM reservationprogramme INNER JOIN programmes ON reservationprogramme.res_programme = programmes.pro_id";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int id = result.getInt("res_id");
				String nom = result.getString("res_nom");
				String email = result.getString("res_email");
				String phone = result.getString("res_phone");
				String date = result.getString("res_date");
				String heure = result.getString("res_heure");
				int programme = result.getInt("res_programme");
				String nomProgramme = result.getString("pro_nom");
				reservations.add(new ReservationProgramme(id, nom, email, phone, date, heure, programme, nomProgramme));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservations;
	}
	public List <ReservationProgramme> countResProgramme() {
		List <ReservationProgramme> reservations = new ArrayList<>();
		String sql ="select res_nom, count(res_id) from reservationprogramme";
		try {
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				int count = result.getInt("count(res_id)");
				String client = result.getString("res_nom");
				reservations.add(new ReservationProgramme(client, count));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservations;
	}
	public boolean deleteResProgramme(int id) {
		boolean set = false;
		String sql = "delete from reservationprogramme where res_id=?";
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
	//reservation Projet insert
		public boolean insertReservationProjet(ReservationProjet reservation) {
			boolean set = false;
			Date date = new Date();
			java.sql.Date reservationDate = new java.sql.Date(date.getTime());
			String sql="insert into reservationprojet (res_nom, res_email, res_phone, res_date, res_heure, res_projet, res_ajout, "
					+ ") values (?,?,?,?,?,?,?)";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, reservation.getNom());
				ps.setString(2, reservation.getEmail());
				ps.setString(3, reservation.getPhone());
				ps.setString(4, reservation.getDate());
				ps.setString(5, reservation.getHeure());
				ps.setInt(6, reservation.getProjet());
				ps.setDate(7, reservationDate);
				ps.executeUpdate();
				set = true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return set;
		}
		public ReservationProjet checkReservationProjet(String date, String heure, int projetId) {
			ReservationProjet reservation = null;
			String sql = "select res_date, res_heure, res_projet from reservationprojet where res_date=? and res_heure=? and res_projet=?";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ps.setString(1, date);
				ps.setString(2, heure);
				ps.setInt(3, projetId);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					reservation = new ReservationProjet();
					reservation.setDate(result.getString("res_date"));
					reservation.setHeure(result.getString("res_heure"));
					reservation.setProjet(result.getInt("res_projet"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return reservation;
		}
		public List<ReservationProjet> selectAllProjet(){
			List<ReservationProjet> reservations = new ArrayList<>();
			String sql ="SELECT * FROM reservationprojet INNER JOIN projets ON reservationprojet.res_projet = projets.pro_id";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int id = result.getInt("res_id");
					String nom = result.getString("res_nom");
					String email = result.getString("res_email");
					String phone = result.getString("res_phone");
					String date = result.getString("res_date");
					String heure = result.getString("res_heure");
					int projet = result.getInt("res_projet");
					Object nomProjet = result.getString("pro_nom");
					reservations.add(new ReservationProjet(id, nom, email, phone, date, heure, projet, nomProjet));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return reservations;
		}
		public List <ReservationProjet> countResProjet() {
			List <ReservationProjet> reservations = new ArrayList<>();
			String sql ="select res_nom, count(res_id) from reservationprojet";
			try {
				PreparedStatement ps = this.conn.prepareStatement(sql);
				ResultSet result = ps.executeQuery();
				while(result.next()) {
					int count = result.getInt("count(res_id)");
					String client = result.getString("res_nom");
					reservations.add(new ReservationProjet(client, count));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return reservations;
		}
		public boolean deleteResProjet(int id) {
			boolean set = false;
			String sql = "delete from reservationprojet where res_id=?";
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

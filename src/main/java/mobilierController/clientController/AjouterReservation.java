package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ReservationDao;
import mobilierModel.Reservation;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterReservation
 */
@WebServlet("/AjouterReservation")
public class AjouterReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom_res");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String date = request.getParameter("date");
		String heure = request.getParameter("heure");
		int bien = Integer.parseInt(request.getParameter("id_reservation"));
		ReservationDao db = new ReservationDao(ConnectionDB.getConnection());
		Reservation datecheck = db.checkReservation(date, heure, bien);
		response.setContentType("text/html");  
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    LocalDate dateNow = LocalDate.now();
	    LocalDate dateCast = LocalDate.parse(date, formatter);
	    int compareResult = dateNow.compareTo(dateCast);
		if(datecheck != null) {
			HttpSession sessionError = request.getSession();
			response.sendRedirect("bien.jsp?id="+bien); 
			sessionError.setAttribute("reservation_fail","Heure réservée veuillez choisire une autre");
		}else if(compareResult > 0) {
			HttpSession sessionError = request.getSession();
			response.sendRedirect("bien.jsp?id="+bien); 
			sessionError.setAttribute("reservation_fail","Date invalide veuillez choisir une date valide");
		}else {
			Reservation reservation = new Reservation(nom, email, phone, date, heure, bien);
			db.insertReservation(reservation);
			HttpSession sessionError = request.getSession();
			response.sendRedirect("bien.jsp?id="+bien); 
			sessionError.setAttribute("reservation_success","Réservation effectué avec succès");
		}
	}

}

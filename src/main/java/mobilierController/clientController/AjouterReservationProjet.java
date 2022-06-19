package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ReservationDao;
import mobilierModel.ReservationProjet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterReservationProjet
 */
@WebServlet("/AjouterReservationProjet")
public class AjouterReservationProjet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterReservationProjet() {
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
		String nom = request.getParameter("nom_res_projet");
		String email = request.getParameter("email_projet");
		String phone = request.getParameter("phone_projet");
		String date = request.getParameter("date_projet");
		String heure = request.getParameter("heure_projet");
		int projet = Integer.parseInt(request.getParameter("id_reservation_projet"));
		ReservationDao db = new ReservationDao(ConnectionDB.getConnection());
		ReservationProjet datecheck = db.checkReservationProjet(date, heure, projet);
		response.setContentType("text/html");  
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    LocalDate dateNow = LocalDate.now();
	    LocalDate dateCast = LocalDate.parse(date, formatter);
	    int compareResult = dateNow.compareTo(dateCast);
		if(datecheck != null) {
			HttpSession sessionError = request.getSession();
			response.sendRedirect("projet.jsp?id="+projet); 
			sessionError.setAttribute("reservation_fail_projet","Heure réservée veuillez choisire une autre");
		}else if(compareResult > 0) {
			HttpSession sessionError = request.getSession();
			response.sendRedirect("projet.jsp?id="+projet); 
			sessionError.setAttribute("reservation_fail_projet","Date invalide veuillez choisir une date valide");
		}else {
			ReservationProjet reservation = new ReservationProjet(nom, email, phone, date, heure, projet);
			db.insertReservationProjet(reservation);
			HttpSession sessionError = request.getSession();
			response.sendRedirect("projet.jsp?id="+projet); 
			sessionError.setAttribute("reservation_success_projet","Réservation effectué avec succès");
		}
	}

}

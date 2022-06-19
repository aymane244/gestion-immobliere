package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ReservationDao;
import mobilierModel.ReservationProgramme;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterReservationProgramme
 */
@WebServlet("/AjouterReservationProgramme")
public class AjouterReservationProgramme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterReservationProgramme() {
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
		String nom = request.getParameter("nom_res_programme");
		String email = request.getParameter("email_programme");
		String phone = request.getParameter("phone_programme");
		String date = request.getParameter("date_programme");
		String heure = request.getParameter("heure_programme");
		int programme = Integer.parseInt(request.getParameter("id_reservation_programme"));
		ReservationDao db = new ReservationDao(ConnectionDB.getConnection());
		ReservationProgramme datecheck = db.checkReservationProgramme(date, heure, programme);
		response.setContentType("text/html");  
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    LocalDate dateNow = LocalDate.now();
	    LocalDate dateCast = LocalDate.parse(date, formatter);
	    int compareResult = dateNow.compareTo(dateCast);
		if(datecheck != null) {
			HttpSession sessionError = request.getSession();
			response.sendRedirect("programme.jsp?id="+programme); 
			sessionError.setAttribute("reservation_fail_programme","Heure réservée veuillez choisire une autre");
		}else if(compareResult > 0) {
			HttpSession sessionError = request.getSession();
			response.sendRedirect("programme.jsp?id="+programme); 
			sessionError.setAttribute("reservation_fail_programme","Date invalide veuillez choisir une date valide");
		}else {
			ReservationProgramme reservation = new ReservationProgramme(nom, email, phone, date, heure, programme);
			db.insertReservationProgramme(reservation);
			HttpSession sessionError = request.getSession();
			response.sendRedirect("programme.jsp?id="+programme); 
			sessionError.setAttribute("reservation_success_programme","Réservation effectué avec succès");
		}
	}

}

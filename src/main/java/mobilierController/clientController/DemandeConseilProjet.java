package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ConseilDao;
import mobilierModel.ConseilProjet;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class DemandeConseilProjet
 */
@WebServlet("/DemandeConseilProjet")
public class DemandeConseilProjet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemandeConseilProjet() {
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
		int projet = Integer.parseInt(request.getParameter("projet"));
		int notaire = Integer.parseInt(request.getParameter("notaire"));
		int client = Integer.parseInt(request.getParameter("client"));
		ConseilDao db = new ConseilDao(ConnectionDB.getConnection());
		ConseilProjet conseil = new ConseilProjet(notaire, client, projet);
		db.insertConseilProjet(conseil);
		response.setContentType("text/html");  
		HttpSession session = request.getSession();
		response.sendRedirect("client/dashboard.jsp"); 
		session.setAttribute("success_clt_conseil_proj","demande conseil envoyé avec succès");
	}

}

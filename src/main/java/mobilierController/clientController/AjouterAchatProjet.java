package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.AchatDao;
import mobilierModel.AchatProjet;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterAchatProjet
 */
@WebServlet("/AjouterAchatProjet")
public class AjouterAchatProjet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterAchatProjet() {
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
		int projet = Integer.parseInt(request.getParameter("id_projet"));
		int client = Integer.parseInt(request.getParameter("id_client_projet"));
		AchatDao db = new AchatDao(ConnectionDB.getConnection());
		AchatProjet achat = new AchatProjet(projet, client);
		db.insertAchatProjet(achat);
		response.setContentType("text/html");  
		response.setContentType("text/html");  
		HttpSession sessionError = request.getSession();
		response.sendRedirect("programme.jsp?id="+projet); 
		sessionError.setAttribute("achat_projet","Achat effectué avec succès");
	}

}

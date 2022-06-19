package mobilierController.promoteurController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ProjetDao;
import mobilierModel.ProjetBien;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterBienProjet
 */
@WebServlet("/AjouterBienProjet")
public class AjouterBienProjet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterBienProjet() {
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
		String nom = request.getParameter("nom");
		int prix = Integer.parseInt(request.getParameter("prix"));
		int prix_metre = Integer.parseInt(request.getParameter("prix_metre"));
		int chambre = Integer.parseInt(request.getParameter("chambre"));
		String type = request.getParameter("type");
		response.setContentType("text/html");
		ProjetDao db = new ProjetDao(ConnectionDB.getConnection());
		ProjetBien biens = new ProjetBien(nom, prix, prix_metre, chambre, type, projet);
		db.insert(biens);
		HttpSession session = request.getSession();
		response.sendRedirect("promoteur/projets.jsp"); 
		session.setAttribute("success_pro_bienproj","Bien ajouté avec succès");
	}

}

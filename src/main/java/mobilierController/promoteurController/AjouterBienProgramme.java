package mobilierController.promoteurController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ProgrammeDao;
import mobilierModel.ProgrammeBien;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterBienProgramme
 */
@WebServlet("/AjouterBienProgramme")
public class AjouterBienProgramme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterBienProgramme() {
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
		int programme = Integer.parseInt(request.getParameter("projet"));
		String nom = request.getParameter("nom");
		int prix = Integer.parseInt(request.getParameter("prix"));
		int prix_metre = Integer.parseInt(request.getParameter("prix_metre"));
		int chambre = Integer.parseInt(request.getParameter("chambre"));
		String type = request.getParameter("type");
		response.setContentType("text/html");
		ProgrammeDao db = new ProgrammeDao(ConnectionDB.getConnection());
		ProgrammeBien biens = new ProgrammeBien(nom, prix, prix_metre, chambre, type, programme);
		db.insert(biens);
		HttpSession session = request.getSession();
		response.sendRedirect("promoteur/programmes.jsp"); 
		session.setAttribute("success_pro_bienprog","Bien ajouté avec succès");
	}

}

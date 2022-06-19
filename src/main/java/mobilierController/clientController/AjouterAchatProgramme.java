package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.AchatDao;
import mobilierModel.AchatProgramme;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterAchatProgramme
 */
@WebServlet("/AjouterAchatProgramme")
public class AjouterAchatProgramme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterAchatProgramme() {
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
		int id_programme = Integer.parseInt(request.getParameter("id_programme"));
		int client = Integer.parseInt(request.getParameter("client_id_programme"));
		AchatDao db = new AchatDao(ConnectionDB.getConnection());
		AchatProgramme achat = new AchatProgramme(id_programme, client);
		db.insertAchatProgramme(achat);
		response.setContentType("text/html");  
		HttpSession sessionError = request.getSession();
		response.sendRedirect("programme.jsp?id="+id_programme); 
		sessionError.setAttribute("achat_programme","Achat effectué avec succès");
	}

}

package mobilierController.adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.RoleDao;
import mobilierModel.Role;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterRole
 */
@WebServlet("/AjouterRole")
public class AjouterRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterRole() {
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
		String nom = request.getParameter("nom");
		response.setContentType("text/html");  
	    RoleDao db = new RoleDao(ConnectionDB.getConnection());
	    Role role = new Role(nom);
	    db.insert(role);
		HttpSession session = request.getSession();
		response.sendRedirect("admin/dashboard.jsp"); 
		session.setAttribute("msgdash","Role ajouter avec succès");
	}

}

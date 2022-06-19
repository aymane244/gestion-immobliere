package mobilierController.adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.AdminDao;
import mobilierModel.Admin;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class Adminmotedepasse
 */
@WebServlet("/Adminmotedepasse")
public class Adminmotedepasse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adminmotedepasse() {
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
		String email = request.getParameter("email");
		String motdepasse = request.getParameter("motdepasse");
		
		response.setContentType("text/html");
		
		AdminDao db = new AdminDao(ConnectionDB.getConnection());
		Admin adminCheck = db.check(email);
		if(adminCheck != null) {
			Admin admin = new Admin (email, motdepasse);
			db.update(admin);
			HttpSession session = request.getSession();
			response.sendRedirect("admin.jsp");
			session.setAttribute("success_pwd","Mot de passe a été bien modifié");

		}else {
			HttpSession session = request.getSession();
			response.sendRedirect("admin/motdepasse.jsp");
			session.setAttribute("fail_pwd","Email n'existe pas");

		}
	}

}

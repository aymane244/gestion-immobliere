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
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		AdminDao db = new AdminDao(ConnectionDB.getConnection());
		Admin admin = db.select(email, motdepasse);
		response.setContentType("text/html");  
		HttpSession session = request.getSession();
		
		if(admin != null) {
			session.setAttribute("adminlogin", admin);
			response.sendRedirect("admin/dashboard.jsp");
		}else {
			session.invalidate(); 
			HttpSession sessionError = request.getSession();
			response.sendRedirect("admin.jsp");
			sessionError.setAttribute("fail_log","Email ou mot de passe incorrecte");
		}
	}

}

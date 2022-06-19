package mobilierController.clientController;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Database.ConnectionDB;
import mobilierModel.*;
import mobilierDao.*;
/**
 * Servlet implementation class ClientLogin
 */
@WebServlet("/ClientLogin")
public class ClientLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientLogin() {
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
		
		ClientDao db = new ClientDao(ConnectionDB.getConnection());
		Client clients = db.select(email, motdepasse);
		
		response.setContentType("text/html");  
		HttpSession session = request.getSession();
		if(clients != null) {
			session.setAttribute("clientlogin", clients);
			response.sendRedirect("client/dashboard.jsp");
		}else {
			session.invalidate(); 
			HttpSession sessionError = request.getSession();
			response.sendRedirect("client/connexion.jsp"); 
			sessionError.setAttribute("fail_clt_log","Email ou mot de passe incorrecte");
		}
	}
}

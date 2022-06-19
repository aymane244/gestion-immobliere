package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ClientDao;
import mobilierModel.Client;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class ClientMotedepasse
 */
@WebServlet("/ClientMotedepasse")
public class ClientMotedepasse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientMotedepasse() {
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
		
		ClientDao db = new ClientDao(ConnectionDB.getConnection());
		Client clientCheck = db.check(email);
		if(clientCheck != null) {
			Client clients = new Client (email, motdepasse);
			db.update(clients);
			HttpSession session = request.getSession();
			response.sendRedirect("client/connexion.jsp"); 
			session.setAttribute("success_clt_pwd","Mot de passe modifié");
		}else {
			HttpSession session = request.getSession();
			response.sendRedirect("client/motdepasse.jsp"); 
			session.setAttribute("fail_clt_pwd","Email n'existe pas");
		}
	}
}

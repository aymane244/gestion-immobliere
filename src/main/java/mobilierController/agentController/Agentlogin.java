package mobilierController.agentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.AgentDao;
import mobilierModel.Agent;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class Agentlogin
 */
@WebServlet("/Agentlogin")
public class Agentlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Agentlogin() {
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
		AgentDao db = new AgentDao(ConnectionDB.getConnection());
		Agent agent = db.select(email, motdepasse);
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		if(agent != null) {
			session.setAttribute("agentlogin", agent);
			response.sendRedirect("agent/dashboard.jsp");
		}else{
			session.invalidate();
			HttpSession sessionError = request.getSession();
			response.sendRedirect("agent/connexion.jsp"); 
			sessionError.setAttribute("fail_agt","Email ou mot de passe incorrecte");
		}
	}

}

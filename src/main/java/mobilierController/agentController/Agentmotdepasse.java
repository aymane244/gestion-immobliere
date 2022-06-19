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
 * Servlet implementation class Agentmotdepasse
 */
@WebServlet("/Agentmotedepasse")
public class Agentmotdepasse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Agentmotdepasse() {
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
		AgentDao db = new AgentDao(ConnectionDB.getConnection());
		Agent agentcheck = db.checkEmail(email);
		if(agentcheck != null) {
			Agent agent = new Agent(email, motdepasse);
			db.update(agent);
			HttpSession sessionError = request.getSession();
			response.sendRedirect("agent/connexion.jsp"); 
			sessionError.setAttribute("success_agt_pwd","Mot de passe modifié avec succès");
		}else{
			HttpSession sessionError = request.getSession();
			response.sendRedirect("agent/motdepasse.jsp"); 
			sessionError.setAttribute("fail_agt_pwd","Email incorrecte");
		}
	}

}

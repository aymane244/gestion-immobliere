package mobilierController.agentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.AgentDao;
import mobilierModel.Agent;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class AgentInscription
 */
@MultipartConfig
@WebServlet("/AgentInscription")
public class AgentInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgentInscription() {
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
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String cin = request.getParameter("cin");
		String motdepasse = request.getParameter("motdepasse");
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/agent/"+image;
		response.setContentType("text/html");
		AgentDao db = new AgentDao(ConnectionDB.getConnection());
		Agent agentCheckEmail = db.checkEmail(email);
		Agent agentCheckCin = db.checkCin(cin);
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		if(agentCheckEmail != null) {
			HttpSession session = request.getSession();
			response.sendRedirect("agent/inscription.jsp");
			session.setAttribute("fail_agt","Email existe déjà");
		}else if(agentCheckCin != null){
			HttpSession session = request.getSession();
			response.sendRedirect("agent/inscription.jsp"); 
			session.setAttribute("fail_agt","CIN existe déjà");
		}else {
			if(image == "") {
				Agent agent = new Agent(nom, prenom, email, cin, motdepasse);
				db.insert(agent);
				HttpSession session = request.getSession();
				response.sendRedirect("agent/connexion.jsp"); 
				session.setAttribute("success_agt","Inscription réussite");
			}else {
				if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
					HttpSession session = request.getSession();
					response.sendRedirect("agent/inscription.jsp"); 
					session.setAttribute("fail_agt","Image invalide merci de choisir une autre");
				}else {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = file.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
					Agent agent = new Agent(nom, prenom, email, cin, motdepasse, image);
					db.insert(agent);
					HttpSession session = request.getSession();
					response.sendRedirect("agent/connexion.jsp"); 
					session.setAttribute("success_agt","Inscription réussite");
				}
			}
		}
	}

}

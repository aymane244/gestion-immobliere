package mobilierController.adminController;

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
 * Servlet implementation class ModifierAgent
 */
@MultipartConfig
@WebServlet("/ModifierAgent")
public class ModifierAgent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierAgent() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		response.setContentType("text/html");
		AgentDao db = new AgentDao(ConnectionDB.getConnection());
		if(image == "") {
			Agent agent = new Agent (nom, prenom, email, cin, id);
			db.updateProfile(agent);
			HttpSession session = request.getSession();
			response.sendRedirect("admin/agents.jsp"); 
			session.setAttribute("success_agt_mod","Profile modifi� avec succ�s");
		}else {
			if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
				HttpSession session = request.getSession();
				response.sendRedirect("admin/modifier-agent.jsp");
				session.setAttribute("fail_agt_mod","Image invalide merci de choisir une autre");
			}else {
				String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/agent/"+image;
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				Agent agentImage = new Agent(nom, prenom, email, cin, image, id);
				db.updateProfileImage(agentImage);
				HttpSession session = request.getSession();
				response.sendRedirect("admin/agents.jsp"); 
				session.setAttribute("success_agt_mod","Profile modifi� avec succ�s");

			}
		}
	}

}

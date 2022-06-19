package mobilierController.agentController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.ClientDao;
import mobilierModel.Client;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterClientAgent
 */
@MultipartConfig
@WebServlet("/AjouterClientAgent")
public class AjouterClientAgent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterClientAgent() {
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
		String prenom = request.getParameter("prenom"); //From the form's names
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		String motdepasse = request.getParameter("motdepasse");
		
		//get image from input form
			Part file =request.getPart("image");
			String image =file.getSubmittedFileName();
		//end getting input form
		String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/client/"+image;
		response.setContentType("text/html");  
	    ClientDao db = new ClientDao(ConnectionDB.getConnection());
	    Client clientCheck = db.check(email);
	    //String extensions[] = {"png", "jpg", "jpeg"};
	    String imageExtension = image.substring(image.lastIndexOf('.')+1);
	    if(clientCheck != null) {
			HttpSession session = request.getSession();
			response.sendRedirect("agent/ajouter-client.jsp"); 
			session.setAttribute("fail_clt","Email existe déjà");
	    }else{
	    	if(image == "") {
				Client clients = new Client(nom, prenom, email, telephone, motdepasse);
				db.insert(clients);
				HttpSession session = request.getSession();
				response.sendRedirect("agent/clients.jsp"); 
				session.setAttribute("success_clt","Client ajouter avec succès");
			}else{
				if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
					HttpSession session = request.getSession();
					response.sendRedirect("agent/ajouter-client.jsp");
					session.setAttribute("fail_clt","Image invalide merci de choisir une autre");
				}else{
					//upload image into the file
						FileOutputStream fos = new FileOutputStream(path);
						InputStream is = file.getInputStream();
						byte[] data = new byte[is.available()];
						is.read(data);
						fos.write(data);
						fos.close();
					//end upload
					Client clients = new Client(nom, prenom, email, telephone, motdepasse, image);
					db.insert(clients); 
					HttpSession session = request.getSession();
					response.sendRedirect("agent/clients.jsp");	
					session.setAttribute("success_clt","Client ajouter avec succès");
				}
			}
	    }
	}

}

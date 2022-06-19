package mobilierController.clientController;

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
 * Servlet implementation class ModifierProfileClient
 */
@MultipartConfig
@WebServlet("/ModifierProfileClient")
public class ModifierProfileClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierProfileClient() {
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
		String telephone = request.getParameter("telephone");
		int id = Integer.parseInt(request.getParameter("id"));
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		response.setContentType("text/html");
		ClientDao db = new ClientDao(ConnectionDB.getConnection());
		if(image == "") {
			Client client = new Client (nom, prenom, email, telephone, id);
			db.updateProfile(client);
			HttpSession session = request.getSession();
			response.sendRedirect("agent/dashboard"); 
			session.setAttribute("success_clt_mod","Profile modifié avec succès");
		}else {
			if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
				HttpSession session = request.getSession();
				response.sendRedirect("agent/modifier-profile.jsp?id="+id); 
				session.setAttribute("fail_clt_mod","Image invalide merci de choisir une autre");
			}else {
				String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/client/"+image;
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				Client clientImage = new Client(nom, prenom, email, telephone, image, id);
				db.updateProfileImage(clientImage);
				HttpSession session = request.getSession();
				response.sendRedirect("agent/dashboard"); 
				session.setAttribute("success_clt_mod","Profile modifié avec succès");
			}
		}
	}

}

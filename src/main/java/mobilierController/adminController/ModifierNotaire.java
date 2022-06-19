package mobilierController.adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.NotaireDao;
import mobilierModel.Notaire;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class ModifierNotaire
 */
@MultipartConfig
@WebServlet("/ModifierNotaire")
public class ModifierNotaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierNotaire() {
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
		String cin = request.getParameter("cin");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		int id = Integer.parseInt(request.getParameter("id"));
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		response.setContentType("text/html");
		NotaireDao db = new NotaireDao(ConnectionDB.getConnection());
		Notaire checknotaire = new Notaire();
		if(checknotaire != null) {
			if(image == "") {
				Notaire notaire = new Notaire(nom, prenom, cin, phone, email, id);
				db.updateProfile(notaire);
				HttpSession session = request.getSession();
				response.sendRedirect("admin/notaires.jsp"); 
				session.setAttribute("success_not_mod","Profile modifié avec succès");
			}else {
				if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
					HttpSession session = request.getSession();
					response.sendRedirect("admin/modifier-notaire.jsp");
					session.setAttribute("fail_not_mod","Image invalide merci de choisir une autre");
				}else {
					String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/notaire/"+image;
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = file.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
					Notaire notaireImage = new Notaire(nom, prenom, cin, phone, email, image, id);
					db.updateProfileImage(notaireImage);
					HttpSession session = request.getSession();
					response.sendRedirect("admin/notaires.jsp"); 
					session.setAttribute("success_not_mod","Profile modifié avec succès");
				}
			}
		}
	}

}

package mobilierController.adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.PromoteurDao;
import mobilierModel.Promoteur;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class ModifierPromoteur
 */
@MultipartConfig
@WebServlet("/ModifierPromoteur")
public class ModifierPromoteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierPromoteur() {
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
		PromoteurDao db = new PromoteurDao(ConnectionDB.getConnection());
		Promoteur checkpromoteur = new Promoteur();
		if(checkpromoteur != null) {
			if(image == "") {
				Promoteur promoteur = new Promoteur(nom, prenom, cin, phone, email, id);
				db.updateProfile(promoteur);
				HttpSession session = request.getSession();
				response.sendRedirect("admin/promoteurs.jsp"); 
				session.setAttribute("success_pro_mod","Profile modifié avec succès");
			}else {
				if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
					HttpSession session = request.getSession();
					response.sendRedirect("admin/modifier-promoteur.jsp");
					session.setAttribute("fail_pro_mod","Image invalide merci de choisir une autre");
				}else {
					String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/promoteur/"+image;
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = file.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
					Promoteur promoteurImage = new Promoteur(nom, prenom, cin, phone, email, image, id);
					db.updateProfileImage(promoteurImage);
					HttpSession session = request.getSession();
					response.sendRedirect("admin/promoteurs.jsp"); 
					session.setAttribute("success_pro_mod","Profile modifié avec succès");
				}
			}
			
		}
	}

}

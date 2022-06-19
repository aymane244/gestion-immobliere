package mobilierController.promoteurController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.ProjetDao;
import mobilierModel.ProjetBien;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class ModifierProjet
 */
@MultipartConfig
@WebServlet("/ModifierProjet")
public class ModifierProjet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierProjet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String titre = request.getParameter("titre");
		String nom = request.getParameter("nom");
		int prix = Integer.parseInt(request.getParameter("prix"));
		int prix_metre = Integer.parseInt(request.getParameter("prix_metre"));
		int chambre = Integer.parseInt(request.getParameter("chambre"));
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		String etat = request.getParameter("etat");
		String unite = request.getParameter("unite");
		String ville = request.getParameter("ville");
		String description = request.getParameter("description");
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		response.setContentType("text/html");
		ProjetDao db = new ProjetDao(ConnectionDB.getConnection());
		if(image == "") {
			ProjetBien projet = new ProjetBien(etat, description, date, unite, titre, ville, nom, prix, prix_metre, chambre, type, id);
			db.updateProjetBien(projet);
			HttpSession session = request.getSession();
			response.sendRedirect("promoteur/projets.jsp"); 
			session.setAttribute("success_pro_mod_proj","Projet modifié avec succès");
		}else {
			if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
				request.getRequestDispatcher("promoteur/modifier-bien.jsp?id="+id).include(request, response);
				HttpSession session = request.getSession();
				response.sendRedirect("promoteur/modifier-projet.jsp?id="+id); 
				session.setAttribute("fail_pro_mod_proj","Image invalide merci de choisir une autre");
			}else {
				String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/promoteur/assets/"+image;
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				ProjetBien projetImg = new ProjetBien(etat, description, date, image, unite, titre, ville, nom, prix, prix_metre, chambre, type, id);
				db.updateProjetBienImg(projetImg);
				HttpSession session = request.getSession();
				response.sendRedirect("promoteur/projets.jsp"); 
				session.setAttribute("success_pro_mod_proj","Projet modifié avec succès");
			}
		}
	}

}

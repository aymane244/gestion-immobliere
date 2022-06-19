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
import mobilierModel.Projet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterProjet
 */
@MultipartConfig
@WebServlet("/AjouterProjet")
public class AjouterProjet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterProjet() {
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
		String etat = request.getParameter("etat");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String titre = request.getParameter("titre");
		String unite = request.getParameter("unite");
		String ville = request.getParameter("ville");
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		response.setContentType("text/html");
		ProjetDao db = new ProjetDao(ConnectionDB.getConnection());
		if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
			HttpSession session = request.getSession();
			response.sendRedirect("promoteur/ajouter-projet.jsp"); 
			session.setAttribute("fail_pro_proj","Image invalide merci de choisir une autre");
		}else {
			String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/promoteur/assets/"+image;
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = file.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			Projet projet = new Projet(etat, description, date, image, titre, unite, ville);
			db.insert(projet);
			HttpSession session = request.getSession();
			response.sendRedirect("promoteur/projets.jsp"); 
			session.setAttribute("success_pro_proj","Projet ajouté avec succès");
		}
	}

}

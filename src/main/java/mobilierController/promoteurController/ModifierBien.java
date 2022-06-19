package mobilierController.promoteurController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.BiensDao;
import mobilierModel.Bien;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class ModifierBien
 */
@MultipartConfig
@WebServlet("/ModifierBien")
public class ModifierBien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierBien() {
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
		String nom = request.getParameter("titre");
		String type = request.getParameter("type");
		String adresse = request.getParameter("adresse");
		String superficie = request.getParameter("superficie");
		String chambre = request.getParameter("chambre");
		String syndique = request.getParameter("syndique");
		String garage = request.getParameter("garage");
		String description = request.getParameter("description");
		int prix = Integer.parseInt(request.getParameter("prix"));
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		response.setContentType("text/html");
		BiensDao db = new BiensDao(ConnectionDB.getConnection());
		if(image == "") {
			Bien bien = new Bien(id, nom, type, adresse, superficie, chambre, syndique, garage, description,prix);
			db.updateBien(bien);
			HttpSession session = request.getSession();
			response.sendRedirect("promoteur/biens.jsp"); 
			session.setAttribute("success_pro_bien_mod","Bien modifié avec succès");
		}else {
			if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
				HttpSession session = request.getSession();
				response.sendRedirect("promoteur/modifier-bien.jsp?id="+id); 
				session.setAttribute("fail_pro_bien_mod","Image invalide merci de choisir une autre");
			}else {
				String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/promoteur/assets/"+image;
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				Bien bienImg = new Bien(id, nom, type, adresse, superficie, chambre, syndique, garage, description, image, prix);
				db.updateBienImg(bienImg);
				HttpSession session = request.getSession();
				response.sendRedirect("promoteur/biens.jsp"); 
				session.setAttribute("success_pro_bien_mod","Bien modifié avec succès");
			}
		}
	}

}

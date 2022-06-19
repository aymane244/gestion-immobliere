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
import java.io.PrintWriter;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterBien
 */
@MultipartConfig
@WebServlet("/AjouterBien")
public class AjouterBien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterBien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		PrintWriter out = response.getWriter();
		BiensDao db = new BiensDao(ConnectionDB.getConnection());
		if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
			request.getRequestDispatcher("promoteur/ajouter-bien.jsp").include(request, response);
			out.print("<div class='container alert alert-danger text-center w-50' role='alert' style='margin-top: -39%;'>"
					+ "Nous nous suportons pas les fichiers de type "+imageExtension+"<br> "
					+ "nous supportons les fichier de type 'jpg','png' et 'jpeg'"
	     			+ "</div>");
		}else {
			String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/promoteur/assets/"+image;
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = file.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			Bien bien = new Bien(nom, type, adresse, superficie, chambre, syndique, garage, description, image, prix);
			db.insert(bien);
			HttpSession session = request.getSession();
			response.sendRedirect("promoteur/biens.jsp"); 
			session.setAttribute("success_pro_bien","Bien ajouté");
			
		}
		
	}

}

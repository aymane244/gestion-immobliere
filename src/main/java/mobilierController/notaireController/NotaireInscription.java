package mobilierController.notaireController;

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
 * Servlet implementation class NotaireInscription
 */
@MultipartConfig
@WebServlet("/NotaireInscription")
public class NotaireInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotaireInscription() {
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
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String cin = request.getParameter("cin");
		String telephone = request.getParameter("phone");
		String email = request.getParameter("email");
		String motdepasse = request.getParameter("motdepasse");
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/notaire/"+image;
		response.setContentType("text/html");
		NotaireDao db = new NotaireDao(ConnectionDB.getConnection());
		Notaire notaireCheckEmail = db.checkEmail(email);
		Notaire notaireCheckCin = db.checkCin(cin);
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		if(notaireCheckEmail != null) {
			HttpSession session = request.getSession();
			response.sendRedirect("notaire/inscription.jsp");
			session.setAttribute("fail_not","Email existe d�j�");
		}else if(notaireCheckCin != null){
			HttpSession session = request.getSession();
			response.sendRedirect("notaire/inscription.jsp"); 
			session.setAttribute("fail_not","CIN existe d�j�");
		}else {
			if(image == "") {
				Notaire notaire = new Notaire(nom, prenom, cin, telephone, email, motdepasse);
				db.insert(notaire);
				HttpSession session = request.getSession();
				response.sendRedirect("notaire/connexion.jsp"); 
				session.setAttribute("success_not","Inscription r�ussite");
			}else {
				if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
					request.getRequestDispatcher("notaire/inscription.jsp").include(request, response);
					HttpSession session = request.getSession();
					response.sendRedirect("notaire/inscription.jsp"); 
					session.setAttribute("fail_not","Image invalide merci de choisir une autre");
				}else {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = file.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
					Notaire notaire = new Notaire(nom, prenom, cin, telephone, email, motdepasse, image);
					db.insert(notaire);
					HttpSession session = request.getSession();
					response.sendRedirect("notaire/connexion.jsp"); 
					session.setAttribute("success_not","Inscription r�ussite");
				}
			}
		}
	}
}

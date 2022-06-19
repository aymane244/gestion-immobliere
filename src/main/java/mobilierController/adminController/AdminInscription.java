package mobilierController.adminController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.AdminDao;
import mobilierModel.Admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class AdminInscription
 */
@MultipartConfig
@WebServlet("/AdminInscription")
public class AdminInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInscription() {
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
		String motdepasse = request.getParameter("motdepasse");
		Object role = request.getParameter("role");
		
		//get image from input form
			Part file =request.getPart("image");
			String image =file.getSubmittedFileName();
		//end getting input form
		String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/admin/"+image;
		response.setContentType("text/html");  
	    AdminDao db = new AdminDao(ConnectionDB.getConnection());
	    Admin adminCheck = db.check(email);
	    //String extensions[] = {"png", "jpg", "jpeg"};
	    String imageExtension = image.substring(image.lastIndexOf('.')+1);
	    if(role == null) {
			HttpSession session = request.getSession();
			response.sendRedirect("admin/inscription.jsp"); 
			session.setAttribute("fail_insc","Veuillez choisir un role");
	    }
	    if(adminCheck != null) {
			HttpSession session = request.getSession();
			response.sendRedirect("admin/inscription.jsp"); 
			session.setAttribute("fail_insc","Email existe déjà");
	    }else{
	    	if(image == "") {
				Admin admin = new Admin(nom, prenom, email, motdepasse, role);
				db.insert(admin);
				HttpSession session = request.getSession();
				response.sendRedirect("admin.jsp"); 
				session.setAttribute("success","Inscription réussite, vous pouvez se connecter");
			}else{
				if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
					HttpSession session = request.getSession();
					response.sendRedirect("admin/inscription.jsp");
					session.setAttribute("fail_insc","Image non valide merci de réessayer avec une autre");
				}else{
					//upload image into the file
						FileOutputStream fos = new FileOutputStream(path);
						InputStream is = file.getInputStream();
						byte[] data = new byte[is.available()];
						is.read(data);
						fos.write(data);
						fos.close();
					//end upload
					Admin admin = new Admin(prenom, nom, email, motdepasse, image, role);
					db.insert(admin); 
					HttpSession session = request.getSession();
					response.sendRedirect("admin.jsp");
					session.setAttribute("success","Inscription réussite, vous pouvez se connecter");
				}
			}
	    }
	}

}

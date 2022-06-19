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
 * Servlet implementation class ModifierProfileAdmin
 */
@MultipartConfig
@WebServlet("/ModifierProfileAdmin")
public class ModifierProfileAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierProfileAdmin() {
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
		int role = Integer.parseInt(request.getParameter("role"));
		int id = Integer.parseInt(request.getParameter("id"));
		Part file = request.getPart("image");
		String image = file.getSubmittedFileName();
		String imageExtension = image.substring(image.lastIndexOf('.')+1);
		response.setContentType("text/html");
		AdminDao db = new AdminDao(ConnectionDB.getConnection());
		if(image == "") {
			Admin admin = new Admin (nom, prenom, email, role, id);
			db.updateProfile(admin);
			HttpSession session = request.getSession();
			response.sendRedirect("admin/admins.jsp"); 
			session.setAttribute("success_adm","Profile modifi� avec succ�s");
		}else {
			if(!imageExtension.equals("png") && !imageExtension.equals("jpg") && !imageExtension.equals("jpeg")) {
				HttpSession session = request.getSession();
				response.sendRedirect("admin/modifier-profile.jsp"); 
				session.setAttribute("fail_adm","Image non valide merci de r�essayer avec une autre");
			}else {
				String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/images/agent/"+image;
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				Admin adminImage = new Admin(nom, prenom, email, image, role, id);
				db.updateProfileImage(adminImage);
				HttpSession session = request.getSession();
				response.sendRedirect("admin/admins.jsp"); 
				session.setAttribute("success_adm","Profile modifi� avec succ�s");
			}
		}
	}

}

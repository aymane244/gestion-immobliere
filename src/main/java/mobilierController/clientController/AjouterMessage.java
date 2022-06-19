package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ContactDao;
import mobilierModel.Contact;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterMessage
 */
@WebServlet("/AjouterMessage")
public class AjouterMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterMessage() {
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
		String email = request.getParameter("email");
		String sujet = request.getParameter("sujet");
		String message = request.getParameter("message");
		ContactDao db = new ContactDao(ConnectionDB.getConnection());
		Contact contact = new Contact(nom, email, sujet, message);
		db.insertContact(contact);
		response.setContentType("text/html");  
		HttpSession sessionError = request.getSession();
		response.sendRedirect("includes/footer.jsp"); 
		sessionError.setAttribute("message","Message envoyé avec succès");
	}
}

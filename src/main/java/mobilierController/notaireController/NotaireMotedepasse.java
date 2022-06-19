package mobilierController.notaireController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.NotaireDao;
import mobilierModel.Notaire;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class NotaireMotedepasse
 */
@WebServlet("/NotaireMotedepasse")
public class NotaireMotedepasse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotaireMotedepasse() {
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
		String email = request.getParameter("email");
		String motdepasse = request.getParameter("motdepasse");
		response.setContentType("text/html");
		NotaireDao db = new NotaireDao(ConnectionDB.getConnection());
		Notaire notaireCheck = db.checkEmail(email);
		if(notaireCheck != null) {
			Notaire notaire = new Notaire(email, motdepasse);
			db.update(notaire);
			HttpSession session = request.getSession();
			response.sendRedirect("notaire/connexion.jsp"); 
			session.setAttribute("success_not_pwd","Mot de passe modifié");
		}else{
			HttpSession session = request.getSession();
			response.sendRedirect("notaire/motdepasse.jsp"); 
			session.setAttribute("fail_not_pwd","Email n'existe pas");
		}
	}
}

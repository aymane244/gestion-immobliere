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
 * Servlet implementation class NotaireLogin
 */
@WebServlet("/NotaireLogin")
public class NotaireLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotaireLogin() {
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
		String cin = request.getParameter("cin");
		String motdepasse = request.getParameter("motdepasse");
		NotaireDao db = new NotaireDao(ConnectionDB.getConnection());
		Notaire notaire = db.select(cin, motdepasse);
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		if(notaire != null) {
			session.setAttribute("notairelogin", notaire);
			response.sendRedirect("notaire/dashboard.jsp");
		}else{
			session.invalidate();
			HttpSession sessionError = request.getSession();
			response.sendRedirect("notaire/connexion.jsp"); 
			sessionError.setAttribute("fail_not_log","Email ou mot de passe incorrecte");
		}
	}
}

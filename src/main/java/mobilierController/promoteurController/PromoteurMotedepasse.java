package mobilierController.promoteurController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.PromoteurDao;
import mobilierModel.Promoteur;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class PromoteurMotedepasse
 */
@WebServlet("/PromoteurMotedepasse")
public class PromoteurMotedepasse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromoteurMotedepasse() {
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
		PromoteurDao db = new PromoteurDao(ConnectionDB.getConnection());
		Promoteur promoteurCheck = db.checkEmail(email);
		if(promoteurCheck != null) {
			Promoteur notaire = new Promoteur(email, motdepasse);
			db.update(notaire);
			HttpSession sessionLog = request.getSession();
			response.sendRedirect("promoteur/connexion.jsp"); 
			sessionLog.setAttribute("success_pro_pwd","Mot de passe modifié");
		}else{
			HttpSession sessionError = request.getSession();
			response.sendRedirect("promoteur/motdepasse.jsp"); 
			sessionError.setAttribute("fail_pro_pwd","Email n'existe pas");
		}
	}
}

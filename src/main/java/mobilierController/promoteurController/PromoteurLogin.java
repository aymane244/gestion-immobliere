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
 * Servlet implementation class PromoteurLogin
 */
@WebServlet("/PromoteurLogin")
public class PromoteurLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromoteurLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//BiensDao dbBien = new BiensDao(ConnectionDB.getConnection());
		//int id =Integer.parseInt(request.getParameter("id"));
		//Bien bien = dbBien.selectBien(id);
		//HttpSession session = request.getSession();
  		//session.setAttribute("bien", bien);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cin = request.getParameter("cin");
		String motdepasse = request.getParameter("motdepasse");
		
		HttpSession session = request.getSession();
		PromoteurDao db = new PromoteurDao(ConnectionDB.getConnection());
		Promoteur promoteur = db.select(cin, motdepasse);
  		
		response.setContentType("text/html");
		if(promoteur != null) {
			session.setAttribute("promoteurlogin", promoteur);
			
			
			response.sendRedirect("promoteur/dashboard.jsp");
		}else{
			session.invalidate();
			HttpSession sessionError = request.getSession();
			response.sendRedirect("promoteur/connexion.jsp"); 
			sessionError.setAttribute("fail_pro_log","Email ou mot de passe incorrecte");
		}
	}

}

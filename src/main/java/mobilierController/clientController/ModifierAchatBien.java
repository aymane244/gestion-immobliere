package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.AchatDao;
import mobilierModel.Achat;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class ModifierAchatBien
 */
@WebServlet("/ModifierAchatBien")
public class ModifierAchatBien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierAchatBien() {
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
		String confirmation = request.getParameter("confirmation_bien");
		int id = Integer.parseInt(request.getParameter("id"));
		AchatDao db = new AchatDao(ConnectionDB.getConnection());
		Achat achat = new Achat(confirmation, id);
		response.setContentType("text/html");
		db.updateBien(achat);
		HttpSession session = request.getSession();
		response.sendRedirect("agent/achat.jsp"); 
		session.setAttribute("success_achat_mod","Achat modifié avec succès");
	}

}

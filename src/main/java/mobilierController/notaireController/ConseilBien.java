package mobilierController.notaireController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mobilierDao.ConseilDao;
import mobilierModel.Conseil;

import java.io.IOException;

import Database.ConnectionDB;

/**
 * Servlet implementation class ConseilBien
 */
@WebServlet("/ConseilBien")
public class ConseilBien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConseilBien() {
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
		String message = request.getParameter("conseil");
		int id =Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html");
		ConseilDao db = new ConseilDao(ConnectionDB.getConnection());
		Conseil conseil = new Conseil(message,  id);
		db.updateConseil(conseil);
		HttpSession session = request.getSession();
		response.sendRedirect("notaire/conseils.jsp"); 
		session.setAttribute("success_not_conseil","Inscription r�ussite");
	}

}

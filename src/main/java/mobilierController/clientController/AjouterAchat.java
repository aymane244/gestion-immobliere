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
 * Servlet implementation class AjouterAchat
 */
@WebServlet("/AjouterAchat")
public class AjouterAchat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterAchat() {
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
		int bien = Integer.parseInt(request.getParameter("id_bien"));
		int client = Integer.parseInt(request.getParameter("id_client"));
		AchatDao db = new AchatDao(ConnectionDB.getConnection());
		Achat achat = new Achat(bien, client);
		db.insertAchat(achat);
		response.setContentType("text/html");  
		HttpSession sessionError = request.getSession();
		response.sendRedirect("index.jsp"); 
		sessionError.setAttribute("achat","Achat effectué avec succès");
	}

}

package mobilierController.clientController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mobilierDao.AchatDao;
import mobilierModel.Document;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import Database.ConnectionDB;

/**
 * Servlet implementation class AjouterDocumentBien
 */
@MultipartConfig
@WebServlet("/AjouterDocumentBien")
public class AjouterDocumentBien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterDocumentBien() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		Part file = request.getPart("document");
		String document = file.getSubmittedFileName();
		String documentExtension = document.substring(document.lastIndexOf('.')+1);
		response.setContentType("text/html");
		AchatDao db = new AchatDao(ConnectionDB.getConnection());
		if(!documentExtension.equals("pdf")) {
			HttpSession sessionError = request.getSession();
			response.sendRedirect("client/dashboard.jsp"); 
			sessionError.setAttribute("document_fail","Fichier invalide merci de choisir un autre");
		}else {
			String path ="C:/Users/hp/eclipse-workspace/projet/src/main/webapp/client/documents/"+document;
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = file.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			Document achat = new Document(document, id);
			db.updateAchat(achat);
			HttpSession sessionError = request.getSession();
			response.sendRedirect("client/dashboard.jsp"); 
			sessionError.setAttribute("document_success","Fichier envoyé avec succès");
		}
	}

}

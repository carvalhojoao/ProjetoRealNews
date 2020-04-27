package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Noticia;
import service.ComentariosService;
import service.NoticiaService;

/**
 * Servlet implementation class EditarExcluir
 */
@WebServlet("/EditarExcluir.do")
public class EditarExcluir extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditarExcluir() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		RequestDispatcher dispacher;

		int id = Integer.parseInt(request.getParameter("action").split("_")[0]);
		String action = request.getParameter("action").split("_")[1];
		NoticiaService service = new NoticiaService();
		ComentariosService serviceComentarios = new ComentariosService();
		ArrayList<Noticia> lista = new ArrayList<Noticia>();
		Noticia modelo = new Noticia();
		
		switch (action) {

		case "abrir":
			modelo = service.carregarNoticia(id);
			request.setAttribute("modelo", modelo);
			dispacher = request.getRequestDispatcher("VisualizarNoticia.jsp");
			dispacher.forward(request, response);
			break;
		case "excluir":
			service.excluir(id);
			break;
		case "editar":
			modelo = service.carregar(id);
			
			request.setAttribute("modelo", modelo);
			dispacher = request.getRequestDispatcher("editarNoticia.jsp");
			dispacher.forward(request, response);
			break;
		default:
			break;
		}
		
		lista = service.listar();
		
		request.setAttribute("lista", lista);
		dispacher = request.getRequestDispatcher("ListaNoticias.jsp");
		dispacher.forward(request, response);
	}

}

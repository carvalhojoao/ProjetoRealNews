package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Comentario;
import model.Noticia;
import service.ComentariosService;
import service.NoticiaService;

/**
 * Servlet implementation class CriarComentario
 */
@WebServlet("/CriarComentario.do")
public class CriarComentario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CriarComentario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		RequestDispatcher dispacher;
		
		Comentario modelo = new Comentario();
		ComentariosService service = new ComentariosService();
		NoticiaService serviceNoticia = new NoticiaService();
		int idNoticia = Integer.parseInt(request.getParameter("idNoticia"));
		modelo.setIdNoticia(idNoticia);
		modelo.setNome(request.getParameter("nome"));
		modelo.setTexto(request.getParameter("texto"));
		
		service.criar(modelo);
		
		Noticia modeloNoticia = serviceNoticia.carregarNoticia(idNoticia);
		request.setAttribute("modelo", modeloNoticia);
		dispacher = request.getRequestDispatcher("VisualizarNoticia.jsp");
		dispacher.forward(request, response);
	}

}

package service;

import java.util.ArrayList;

import dao.NoticiaDAO;
import model.Noticia;

public class NoticiaService {
	NoticiaDAO dao = new NoticiaDAO();
	ComentariosService serviceComentarios = new ComentariosService();
	
	public int criar(Noticia noticia) {
		return dao.criar(noticia);
	}
	
	public void atualizar(Noticia servicoColeta){
		dao.atualizar(servicoColeta);
	}
	
	public void excluir(int id){
		dao.excluir(id);
	}
	
	public Noticia carregar(int id){
		return dao.carregar(id);
	}
	public ArrayList<Noticia> listar(){
		return dao.listar();
	}
	
	public Noticia carregarNoticia(int idNoticia){
		Noticia modelo = new Noticia();
		modelo = carregar(idNoticia);
		modelo.setComentarios(serviceComentarios.listar(idNoticia));
		
		return modelo;
	}
}

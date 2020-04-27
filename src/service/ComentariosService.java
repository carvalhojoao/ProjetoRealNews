package service;

import java.util.ArrayList;

import dao.ComentarioDAO;
import model.Comentario;

public class ComentariosService {
	ComentarioDAO dao = new ComentarioDAO();
	
	public int criar(Comentario comentario) {
		return dao.comentar(comentario);
	}
	
	public ArrayList<Comentario> listar(int idNoticia){
		return dao.listarComentarios(idNoticia);
	}
}

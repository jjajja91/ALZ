package alz.board.service;

import java.util.List;

import alz.board.domain.CommentDTO;

public interface CommentService {

	CommentDTO create();

	CommentDTO readById(Long id);

	List<CommentDTO> readAll();

	CommentDTO updateById(Long id, CommentDTO comment);

	int deleteById(Long id);

}

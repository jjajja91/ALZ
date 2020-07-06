package alz.board.service;

import java.util.List;

import alz.board.domain.CommentDTO;

public interface CommentService {

	CommentDTO create(CommentDTO comment);

	CommentDTO readById(Long id);

	List<CommentDTO> readAll(Long boardId);

	CommentDTO updateById(Long id, CommentDTO comment);

	int deleteById(Long id);

}

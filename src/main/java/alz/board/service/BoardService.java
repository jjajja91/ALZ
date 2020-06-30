package alz.board.service;

import java.util.List;

import alz.board.domain.BoardDTO;
import alz.board.domain.Criteria;

public interface BoardService {
	
	BoardDTO create(BoardDTO board);

	BoardDTO readById(Long id);

	List<BoardDTO> readAll();

	BoardDTO updateById(Long id, BoardDTO board);

	int deleteById(Long id);

	List<BoardDTO> readAll(Criteria cri);

	

}

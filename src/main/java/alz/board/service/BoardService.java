package alz.board.service;

import java.util.List;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.Criteria;

public interface BoardService {
	
	BoardDTO create(BoardDTO board);

	BoardDTO readById(Long id);

	List<BoardDTO> readAll();
	List<BoardDTO> readAll(BoardCriteria cri);

	BoardDTO updateById(Long id, BoardDTO board);
	boolean update(Long id, BoardDTO board);

	int deleteById(Long id);

	int getTotal(BoardCriteria cri);

}

package alz.board.service;

import java.util.List;

import alz.board.domain.BoardDTO;

public interface BoardService {

	//mapper 가져올 것
	
	BoardDTO create(BoardDTO board);

	BoardDTO readById(Long id);

	List<BoardDTO> readAll();

	BoardDTO updateById(Long id, BoardDTO board);

	int deleteById(Long id);

}

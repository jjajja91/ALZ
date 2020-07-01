package alz.board.service;

import java.util.List;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.file.domain.BoardFileDTO;

public interface BoardService {
	
	void create(BoardDTO board);

	BoardDTO readById(Long id);

	List<BoardDTO> readAll();
	List<BoardDTO> readAll(BoardCriteria cri);

	BoardDTO updateById(Long id, BoardDTO board);
	boolean update(Long id, BoardDTO board);

	int deleteById(Long id);

	int getTotal(BoardCriteria cri);
	
	public List<BoardFileDTO> getFileList(Long boardId);

}

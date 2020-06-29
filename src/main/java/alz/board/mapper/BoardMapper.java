package alz.board.mapper;

import java.util.List;

import alz.board.domain.BoardDTO;

public interface BoardMapper {
	
	int insert(BoardDTO board);
	
	BoardDTO selectById(Long id);
	
	List<BoardDTO> selectAll();
	
	int updateById(BoardDTO board);
	
	int deleteById(Long id);

}

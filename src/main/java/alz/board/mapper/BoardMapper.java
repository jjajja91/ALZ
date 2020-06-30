package alz.board.mapper;

import java.util.List;
import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.Criteria;

public interface BoardMapper {
	
	int insert(BoardDTO board);
	
	BoardDTO selectById(Long id);
	
	List<BoardDTO> selectAll();

	List<BoardDTO> selectWithPaging(BoardCriteria cri);
	
	List<BoardDTO> getListWithPaging(Criteria cri);
	
	int updateById(BoardDTO board);
	
	int deleteById(Long id);

	int getTotalCount(BoardCriteria cri);

}

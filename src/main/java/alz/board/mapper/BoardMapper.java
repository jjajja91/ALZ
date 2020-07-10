package alz.board.mapper;

import java.util.List;
import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;

public interface BoardMapper {
	
	int insert(BoardDTO board);
	
	BoardDTO selectById(Long id);
	
	List<BoardDTO> selectAll();

	List<BoardDTO> selectWithPaging(BoardCriteria cri);
	
	int updateById(BoardDTO board);
	
	int deleteById(Long id);

	int getTotalCount(BoardCriteria cri);

	int replyInsert(BoardDTO board);

	int rereplyInsert(BoardDTO board);
	
	int insertReply(BoardDTO board);
}

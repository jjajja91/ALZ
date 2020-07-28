package alz.myPage.mapper;

import java.util.List;

import alz.board.domain.BoardDTO;
import alz.board.domain.CommentDTO;
import alz.myPage.domain.MyPageCriteria;

public interface MyPageMapper {
	
	int insert(BoardDTO board);
	
	BoardDTO selectById(Long id);
	
	List<BoardDTO> selectAll();

	List<BoardDTO> selectWithPaging(MyPageCriteria cri);
	
	List<CommentDTO> commentSelectWithPaging(MyPageCriteria cri);
	
	int updateById(BoardDTO board);
	
	int deleteById(Long id);

	int getTotalCount(MyPageCriteria cri);

	int replyInsert(BoardDTO board);

	int rereplyInsert(BoardDTO board);
	
	int insertReply(BoardDTO board);

	Long getCommentsCnt(Long boardId);

	Long getLikeCnt(Long boardId);

	void addLike();

}

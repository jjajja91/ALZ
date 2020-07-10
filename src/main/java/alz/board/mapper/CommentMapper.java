package alz.board.mapper;

import java.util.List;

import alz.board.domain.CommentDTO;

public interface CommentMapper {
	
	int insert(CommentDTO comment);
	int insert2(CommentDTO comment);
	
	CommentDTO selectById(Long id);
	
	List<CommentDTO> selectAll(Long id);
	
	int updateById(CommentDTO comment);
	
	// 대댓글 입력시 comment_cnt 올려주는 메서드
	int updateCnt(CommentDTO comment);
	
	int deleteById(Long id);

}

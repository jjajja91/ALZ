package alz.board.mapper;

import java.util.List;

import alz.board.domain.CommentDTO;

public interface CommentMapper {
	
	int insert(CommentDTO comment);
	
	CommentDTO selectById(Long id);
	
	List<CommentDTO> selectAll(Long id);
	
	int updateById(CommentDTO comment);
	
	int deleteById(Long id);

}

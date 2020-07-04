package alz.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.board.domain.CommentDTO;
import alz.board.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	
	//mapper 가져와서 사용
	private CommentMapper commentMapper;
	
	@Autowired
	public CommentServiceImpl(CommentMapper commentMapper) {
		this.commentMapper = commentMapper;
	}

	@Override
	public CommentDTO create(CommentDTO comment) {
		int affectedRowCount = commentMapper.insert(comment);
		CommentDTO createdComment = commentMapper.selectById(comment.getId()); 
		return createdComment;
	}

	@Override
	public CommentDTO readById(Long id) {
		CommentDTO comment = commentMapper.selectById(id);
		return comment;
	}

	@Override
	public List<CommentDTO> readAll(Long boardId) {
		List<CommentDTO> list = commentMapper.selectAll(boardId);
		return list;
	}

	@Override
	public CommentDTO updateById(Long id, CommentDTO comment) {
		CommentDTO searchedComment = commentMapper.selectById(id);
		
		searchedComment.setContent(comment.getContent());
		
		return searchedComment;
	}

	@Override
	public int deleteById(Long id) {
		CommentDTO searchedComment = commentMapper.selectById(id);
		int affectedRowCount = commentMapper.deleteById(id);
		return affectedRowCount;
	}

}

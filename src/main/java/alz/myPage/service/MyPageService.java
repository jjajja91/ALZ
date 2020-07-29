package alz.myPage.service;

import java.util.List;

import org.springframework.validation.BindingResult;

import alz.myPage.domain.MyPageCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.CommentDTO;
import alz.board.domain.LikeDTO;
import alz.file.domain.BoardFileDTO;

public interface MyPageService {
	
	BoardDTO readById(Long id);

	List<BoardDTO> readAll();
	List<BoardDTO> readAll(MyPageCriteria cri);
	
	List<CommentDTO> commentReadAll(MyPageCriteria cri);

	List<BoardDTO> likeReadAll(MyPageCriteria cri);

	int deleteById(Long id);

	int getTotal(MyPageCriteria cri);
	
	public List<BoardFileDTO> getFileList(Long boardId);

}

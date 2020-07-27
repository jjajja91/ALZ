package alz.myPage.service;

import java.util.List;

import org.springframework.validation.BindingResult;

import alz.myPage.domain.MyPageCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.LikeDTO;
import alz.file.domain.BoardFileDTO;

public interface MyPageService {
	
	void create(BoardDTO board);

	BoardDTO readById(Long id);

	List<BoardDTO> readAll();
	List<BoardDTO> readAll(MyPageCriteria cri);

	BoardDTO updateById(Long id, BoardDTO board);
	boolean update(Long id, BoardDTO board);

	int deleteById(Long id);

	int getTotal(MyPageCriteria cri);
	
	public List<BoardFileDTO> getFileList(Long boardId);

	Long getCommentsCnt(Long id);

	Long getLikeCnt(Long id);

	void addLike(LikeDTO like);

	boolean isLike(LikeDTO likeDTO);

	boolean removeLike(LikeDTO likeDTO);

}

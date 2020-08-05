package alz.myPage.service;

import java.util.List;

import alz.board.domain.BoardDTO;
import alz.board.domain.CommentDTO;
import alz.lesson.domain.LessonDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.user.domain.UserDTO;

public interface MyPageService {
	
	BoardDTO readById(Long id);

	List<BoardDTO> readAll();
	List<BoardDTO> readAll(MyPageCriteria cri);
	
	List<CommentDTO> commentReadAll(MyPageCriteria cri);

	List<BoardDTO> likeReadAll(MyPageCriteria cri);

	List<LessonDTO> myLessonList(MyPageCriteria cri);
	int getTotal(MyPageCriteria cri);
	
	boolean selectById(UserDTO user);

	List<LessonDTO> finishedLessonList(MyPageCriteria cri);

	List<LessonDTO> refundedLesson(MyPageCriteria cri);

	int deleteAcc(UserDTO user);
	
	
}

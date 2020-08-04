package alz.myPage.mapper;

import java.util.List;

import alz.board.domain.BoardDTO;
import alz.board.domain.CommentDTO;
import alz.lesson.domain.LessonDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.user.domain.UserDTO;

public interface MyPageMapper {
	
	BoardDTO selectById(Long id);
	
	List<BoardDTO> selectAll();

	List<BoardDTO> selectWithPaging(MyPageCriteria cri);
	
	List<CommentDTO> commentSelectWithPaging(MyPageCriteria cri);
	
	List<BoardDTO> likeSelectAll(MyPageCriteria cri);
	
	List<LessonDTO> myLessonList(MyPageCriteria cri);
	
	List<LessonDTO> finishedLessonList(MyPageCriteria cri);
	
	int getTotalCount(MyPageCriteria cri);

	Long getCommentsCnt(Long boardId);

	Long getLikeCnt(Long boardId);

	void addLike();

	UserDTO selectByUserId(UserDTO user);

	int deleteAcc(Long userId);
	
	int updateEnable(Long id);

	List<LessonDTO> refundedLesson(MyPageCriteria cri);



}

package alz.board.mapper;

import java.util.List;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.ReviewDTO;
import alz.board.domain.ReviewOptDTO;
import alz.lesson.domain.LessonDTO;

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

	Long getCommentsCnt(Long boardId);

	Long getLikeCnt(Long boardId);

	void addLike();

	List<ReviewOptDTO> reviewOption(Long id);

	void createReview(BoardDTO board);

	void createReviewRate(BoardDTO board);
	
	Long lessonChk (BoardDTO board);

	int reviewChk(Long merchandiseId);

	ReviewDTO readReview(BoardDTO board);

	LessonDTO getTitle(Long lessonId);

	Long updateReview(BoardDTO Board);

	}

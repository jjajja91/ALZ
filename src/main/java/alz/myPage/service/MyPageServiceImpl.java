package alz.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import alz.board.domain.BoardDTO;
import alz.board.domain.CommentDTO;
import alz.board.mapper.LikeMapper;
import alz.file.mapper.BoardFileMapper;
import alz.lesson.domain.LessonDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.myPage.mapper.MyPageMapper;
import alz.user.domain.UserDTO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MyPageServiceImpl implements MyPageService {

	private MyPageMapper MyPageMapper;
	private PasswordEncoder passwordEncoder;

	@Autowired
	public MyPageServiceImpl(MyPageMapper MyPageMapper, PasswordEncoder passwordEncoder) {
		this.MyPageMapper = MyPageMapper;
		this.passwordEncoder = passwordEncoder;
	}


	@Override
	public BoardDTO readById(Long id) {
		BoardDTO searchBoardWriter = MyPageMapper.selectById(id);
		return searchBoardWriter;
	}

	@Override
	public List<BoardDTO> readAll() {
		List<BoardDTO> myPageList = MyPageMapper.selectAll();
		return myPageList;
	}

	//내가 쓴 글 불러오기
	@Override
	public List<BoardDTO> readAll(MyPageCriteria cri) {
		List<BoardDTO> list = MyPageMapper.selectWithPaging(cri);
		return list;
	}
	
	//내 댓글 불러오기
	@Override
	public List<CommentDTO> commentReadAll(MyPageCriteria cri) {
		List<CommentDTO> list = MyPageMapper.commentSelectWithPaging(cri);
		return list;
	}
	
	//like 불러오기
	@Override
	public List<BoardDTO> likeReadAll(MyPageCriteria cri) {
		List<BoardDTO> list = MyPageMapper.likeSelectAll(cri);
		return list;
	}


	@Override
	public int getTotal(MyPageCriteria cri) {
		int total = MyPageMapper.getTotalCount(cri);
		return total;
	}

    //탈퇴 전 비밀번호 확인 
	@Override
	public boolean selectById(UserDTO user) {
		UserDTO pwdChk = MyPageMapper.selectByUserId(user);
				
		return passwordEncoder.matches(user.getPassword(),pwdChk.getPassword());
	}

	//탈퇴
	@Transactional
	@Override
	public int DeleteAcc(Long id) {
		int deleteAcc = 0;
		deleteAcc += MyPageMapper.deleteAcc(id);
		deleteAcc += MyPageMapper.updateEnable(id);
		return deleteAcc;
	}

	//내 강의 목록
	@Override
	public List<LessonDTO> myLessonList(MyPageCriteria cri) {
		List<LessonDTO> list = MyPageMapper.myLessonList(cri);
		
		return list;
	}


	@Override
	public List<LessonDTO> finishedLessonList(MyPageCriteria cri) {
		List<LessonDTO> list = MyPageMapper.finishedLessonList(cri);
		return list;
	}


	@Override
	public List<LessonDTO> refundedLesson(MyPageCriteria cri) {
		List<LessonDTO> list = MyPageMapper.refundedLesson(cri);
	
		return list;
	}

	



}

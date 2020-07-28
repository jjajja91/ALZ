package alz.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import alz.myPage.domain.MyPageCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.CommentDTO;
import alz.board.domain.LikeDTO;
import alz.myPage.mapper.MyPageMapper;
import alz.board.mapper.LikeMapper;
import alz.file.domain.BoardFileDTO;
import alz.file.mapper.BoardFileMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MyPageServiceImpl implements MyPageService {

	private MyPageMapper MyPageMapper;
	private BoardFileMapper boardFileMapper;
	private LikeMapper likeMapper;

	@Autowired
	public MyPageServiceImpl(MyPageMapper MyPageMapper, BoardFileMapper boardFileMapper, LikeMapper likeMapper) {
		this.MyPageMapper = MyPageMapper;
		this.boardFileMapper = boardFileMapper;
		this.likeMapper = likeMapper;
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



	
	@Transactional
	@Override
	public int deleteById(Long id) {
		boardFileMapper.deleteAll(id);
		int affectedRowCount = MyPageMapper.deleteById(id);

		return affectedRowCount;
	}

	@Override
	public int getTotal(MyPageCriteria cri) {
		int total = MyPageMapper.getTotalCount(cri);
		return total;
	}

	@Override
	public List<BoardFileDTO> getFileList(Long boardId) {
		log.info("get File list by board_id" + boardId);
		return boardFileMapper.findByBoardId(boardId);
	}


}

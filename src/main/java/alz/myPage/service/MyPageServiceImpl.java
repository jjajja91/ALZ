package alz.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import alz.myPage.domain.MyPageCriteria;
import alz.board.domain.BoardDTO;
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

	@Transactional
	@Override
	public void create(BoardDTO board) {
	  if (board.getParentId() == null) {
			MyPageMapper.insert(board);
	} else if (board.getParentId() == 0) {
			MyPageMapper.replyInsert(board);
			MyPageMapper.insertReply(board);
			
		} else  {
			board.setParentId(board.getId());
			MyPageMapper.rereplyInsert(board);
			MyPageMapper.insertReply(board);
			MyPageMapper.insertReply(board);

		}
		if (board.getFileList() == null || board.getFileList().size() <= 0) {
			return;
		}

		board.getFileList().forEach(file -> {
			file.setBoardId(board.getId());
			boardFileMapper.insert(file);
		});

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

	@Override
	public List<BoardDTO> readAll(MyPageCriteria cri) {
		List<BoardDTO> list = MyPageMapper.selectWithPaging(cri);
		
		return list;
	}

	@Override
	public BoardDTO updateById(Long id, BoardDTO board) {
		BoardDTO searchedBoard = MyPageMapper.selectById(id);
		searchedBoard.setTitle(board.getTitle()).setContent(board.getContent());
		int affectedRowCount = MyPageMapper.updateById(searchedBoard);
		return searchedBoard;
	}

	@Override
	public boolean update(Long id, BoardDTO board) {
		log.info("modify....." + board);
		boardFileMapper.deleteAll(id);

		BoardDTO searchedBoard = MyPageMapper.selectById(id);
		searchedBoard.setTitle(board.getTitle()).setContent(board.getContent()).setFileList(board.getFileList());
		boolean modifyResult = MyPageMapper.updateById(searchedBoard) == 1;

		if (modifyResult && board.getFileList() != null && board.getFileList().size() > 0) {
			board.getFileList().forEach(file -> {
				file.setBoardId(id);
				boardFileMapper.insert(file);
			});
		}

		return modifyResult;
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

	@Override
	public Long getCommentsCnt(Long id) {
		return MyPageMapper.getCommentsCnt(id);
	}

	@Override
	public Long getLikeCnt(Long id) {
		return MyPageMapper.getLikeCnt(id);
	}

	@Override
	public void addLike(LikeDTO like) {
		BoardDTO board = new BoardDTO();
		likeMapper.addLike(like);
	}

	@Override
	public boolean isLike(LikeDTO likeDTO) {
		return likeMapper.getLike(likeDTO)==null ? false : true; 
	}

	@Override
	public boolean removeLike(LikeDTO likeDTO) {
		return likeMapper.removeLike(likeDTO)==0 ? false : true;
	}

}

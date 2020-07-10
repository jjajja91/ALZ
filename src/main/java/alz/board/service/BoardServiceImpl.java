package alz.board.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.mapper.BoardMapper;
import alz.file.domain.BoardFileDTO;
import alz.file.mapper.BoardFileMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	private BoardMapper boardMapper;
	private BoardFileMapper boardFileMapper;

	@Autowired
	public BoardServiceImpl(BoardMapper boardMapper, BoardFileMapper boardFileMapper) {
		this.boardMapper = boardMapper;
		this.boardFileMapper = boardFileMapper;
	}

	@Transactional
	@Override
	public void create(BoardDTO board) {
		if (board.getParentId() == null) {
			boardMapper.insert(board);
		} else if (board.getParentId() == 0) {
			boardMapper.replyInsert(board);
			boardMapper.insertReply(board);
			
		} else  {
			board.setParentId(board.getId());
			boardMapper.rereplyInsert(board);
			boardMapper.insertReply(board);
			boardMapper.insertReply(board);

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
		BoardDTO searchBoardWriter = boardMapper.selectById(id);
		return searchBoardWriter;
	}

	@Override
	public List<BoardDTO> readAll() {
		List<BoardDTO> boards = boardMapper.selectAll();

		return boards;
	}

	@Override
	public List<BoardDTO> readAll(BoardCriteria cri) {
		List<BoardDTO> list = boardMapper.selectWithPaging(cri);
		
		return list;
	}

	@Override
	public BoardDTO updateById(Long id, BoardDTO board) {
		BoardDTO searchedBoard = boardMapper.selectById(id);
		searchedBoard.setTitle(board.getTitle()).setContent(board.getContent());
		int affectedRowCount = boardMapper.updateById(searchedBoard);
		return searchedBoard;
	}

	@Override
	public boolean update(Long id, BoardDTO board) {
		log.info("modify....." + board);
		boardFileMapper.deleteAll(id);

		BoardDTO searchedBoard = boardMapper.selectById(id);
		searchedBoard.setTitle(board.getTitle()).setContent(board.getContent()).setFileList(board.getFileList());
		boolean modifyResult = boardMapper.updateById(searchedBoard) == 1;

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
		BoardDTO searchedBoard = boardMapper.selectById(id);
		int affectedRowCount = boardMapper.deleteById(searchedBoard.getId());

		return affectedRowCount;
	}

	@Override
	public int getTotal(BoardCriteria cri) {
		int total = boardMapper.getTotalCount(cri);
		return total;
	}

	@Override
	public List<BoardFileDTO> getFileList(Long boardId) {
		log.info("get File list by board_id" + boardId);
		return boardFileMapper.findByBoardId(boardId);
	}

}

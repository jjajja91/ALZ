package alz.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.board.domain.BoardDTO;
import alz.board.domain.Criteria;
import alz.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	//mapper 媛��졇���꽌 �궗�슜
	
	private BoardMapper boardMapper;
	
	@Autowired
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}

	@Override
	public BoardDTO create(BoardDTO board) {
	int boardRowCnt = boardMapper.insert(board);
	BoardDTO createBoard = boardMapper.selectById(board.getId());
		return createBoard;
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
	public List<BoardDTO> readAll(Criteria cri){
	
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public BoardDTO updateById(Long id, BoardDTO board) {
		BoardDTO searchBoardWriter = boardMapper.selectById(id);
		searchBoardWriter.setTitle(board.getTitle()).setContent(board.getContent())
		.setWrittenAt(board.getWrittenAt());
		int boardRowCnt = boardMapper.updateById(searchBoardWriter);
		return searchBoardWriter;
	}

	@Override
	public int deleteById(Long id) {
		BoardDTO searchBoardWriter = boardMapper.selectById(id);
		int boardRowCnt = boardMapper.deleteById(id);
		
		return boardRowCnt;
	}

}

package alz.board.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.board.domain.BoardDTO;
import alz.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	//mapper 가져와서 사용
	private BoardMapper boardMapper;
	
	@Autowired
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}

	@Override
	public BoardDTO create(BoardDTO board) {
		int affectedRowCount = boardMapper.insert(board);
		BoardDTO createdPost = boardMapper.selectById(board.getId());
		return createdPost;
	}

	@Override
	public BoardDTO readById(Long id) {
		BoardDTO board = boardMapper.selectById(id);
		return board;
	}

	@Override
	public List<BoardDTO> readAll() {
		List<BoardDTO> list = boardMapper.selectAll();
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
	public int deleteById(Long id) {
		BoardDTO searchedBoard = boardMapper.selectById(id);
		int affectedRowCount = boardMapper.deleteById(id);
		
		return affectedRowCount;
	}

}

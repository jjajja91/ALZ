package alz.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import alz.board.domain.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	//mapper 가져와서 사용

	@Override
	public BoardDTO create(BoardDTO board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO readById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO updateById(Long id, BoardDTO board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteById(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

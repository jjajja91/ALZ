package alz.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import alz.board.domain.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {
	
	//mapper 가져와서 사용

	@Override
	public CommentDTO create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentDTO readById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommentDTO> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentDTO updateById(Long id, CommentDTO comment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteById(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

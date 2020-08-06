package alz.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.admin.domain.AdminBoardCriteria;
import alz.admin.mapper.AdminBoardMapper;
import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminBoardServieceImpl implements AdminBoardService {

	private AdminBoardMapper boardMapper;
	
	@Autowired
	public AdminBoardServieceImpl(AdminBoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
	

	@Override
	public List<BoardDTO> readAll(AdminBoardCriteria cri) {
		List<BoardDTO> list = boardMapper.selectWithPaging(cri);
		return list;
	}


	@Override
	public int getTotal(AdminBoardCriteria cri) {
		int total = boardMapper.getTotalCount(cri);
		return total;
	}
	
}

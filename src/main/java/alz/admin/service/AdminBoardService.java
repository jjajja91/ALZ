package alz.admin.service;

import java.util.List;

import alz.admin.domain.AdminBoardCriteria;
import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;

public interface AdminBoardService {
	// 페이징된 게시글 리스트 얻기
	List<BoardDTO> readAll(AdminBoardCriteria cri);

	int getTotal(AdminBoardCriteria cri);
}

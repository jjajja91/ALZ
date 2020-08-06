package alz.admin.mapper;

import java.util.List;

import alz.admin.domain.AdminBoardCriteria;
import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;

public interface AdminBoardMapper {

	List<BoardDTO> selectWithPaging(AdminBoardCriteria cri);
	
	// 페이징을 위한 count(검섹/페이징/게시판타입)
		int getTotalCount(AdminBoardCriteria cri);
}

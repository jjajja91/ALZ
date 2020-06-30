package alz.board.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import alz.board.domain.BoardDTO;
import alz.board.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	

	@Test
	public void testInsert() {
		BoardDTO board = new BoardDTO();
	
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriterId(5L);
		board.setTypeId(3L);
		
        boardMapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testRead() {
		
		BoardDTO board = boardMapper.selectById(5L);
		
		log.info(board);
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		
		
		List<BoardDTO> list = boardMapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getId()));
	}
	

	
}

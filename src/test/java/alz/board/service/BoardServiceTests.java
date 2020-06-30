package alz.board.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import alz.board.domain.BoardCriteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService boardService;
	
	@Test
	public void testSelect() {
		
		boardService.readAll(new BoardCriteria(2, 10)).forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testExist() {
		log.info(boardService);
		assertNotNull(boardService);
	}
}

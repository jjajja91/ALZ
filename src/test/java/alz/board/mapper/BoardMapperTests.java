package alz.board.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.mapper.BoardMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Test
	public void testSearch() {

		BoardCriteria cri = new BoardCriteria();
		cri.setKeyword("NEW");
		cri.setType("TC");

		List<BoardDTO> list = boardMapper.selectWithPaging(cri);

		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testPaging() {
		BoardCriteria cri = new BoardCriteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<BoardDTO> list = boardMapper.selectWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testUpdate() {
		BoardDTO board = new BoardDTO();
		
		board.setId(3L);
		board.setTitle("edit mapping");
		board.setContent("edit content");
		
		int count = boardMapper.updateById(board);
		log.info("update count: " + count);
	}
	
	@Test
	public void testDelete() {
		log.info("delete count: " + boardMapper.deleteById(1L));
	}
	
	@Test
	public void testRead() {
		BoardDTO board = boardMapper.selectById(15L);
		log.info(board);
	}
	
	@Test
	public void testInsert() {
		
		BoardDTO board = new BoardDTO();
		board.setTitle("새글");
		board.setContent("새글내용");
		board.setWriterId(1L);
		board.setTypeId(7L);
		
		boardMapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testGetList() {
		boardMapper.selectAll().forEach(board -> log.info(board));
	}
	
	@Test
	public void testMapper() {
		
		log.info(boardMapper);
	}
}

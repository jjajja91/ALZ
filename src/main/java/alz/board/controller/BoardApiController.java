package alz.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.service.BoardService;

@RestController
@RequestMapping("/boards")
public class BoardApiController {
	
	private BoardService boardService;
	
	@Autowired
	public BoardApiController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@PostMapping
	public ResponseEntity<?> create(@RequestBody BoardDTO board){
		BoardDTO savedBoard = boardService.create(board);
		return ResponseEntity.status(HttpStatus.CREATED).body(savedBoard);
	}
	 
	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id){
		BoardDTO searchedBoard = boardService.readById(id);
		
		return ResponseEntity.status(HttpStatus.OK).body(searchedBoard);
	}
	
	@GetMapping
	public ResponseEntity<?> readAll() {
		List<BoardDTO> boards = boardService.readAll();
		
		return ResponseEntity.status(HttpStatus.OK).body(boards);
	}
	
	// 검색 결과 글목록
	@GetMapping(value = {"/{pageNum}/{amount}/{type}/{keyword}", "/{pageNum}/{amount}/{type}"},
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<?> readAll(@PathVariable String type, 
									@PathVariable(name="keyword", required = false) String keyword,
									@PathVariable Integer pageNum, @PathVariable Integer amount) {
		BoardCriteria cri = new BoardCriteria();
		
		cri.setKeyword(keyword);
		cri.setType(type);
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		
		List<BoardDTO> boards = boardService.readAll(cri);
		
		return ResponseEntity.status(HttpStatus.OK).body(boards);
	}
	
	// 글 수 카운트
	@GetMapping(value = {"/type/{type}/keyword/{keyword}", "type/{type}"},
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public int readAll(@PathVariable String type, 
					@PathVariable(name="keyword", required = false) String keyword) {

		BoardCriteria cri = new BoardCriteria();
		
		if(keyword!=null) {
			cri.setKeyword(keyword);
			cri.setType(type);
		}
		
		int total = boardService.getTotal(cri);
		
		return total;
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody BoardDTO board){
		BoardDTO updatedBoard = boardService.updateById(id, board);
		return ResponseEntity.status(HttpStatus.OK).body(updatedBoard);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = boardService.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body("ok");
	}
	

}

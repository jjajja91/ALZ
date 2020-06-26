package alz.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
		return null;
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id){
		BoardDTO searchedBoard = boardService.readById(id);
		return null;
	}
	
	@GetMapping
	public ResponseEntity<?> readAll() {
		List<BoardDTO> boards = boardService.readAll();
		return null;
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, BoardDTO board){
		BoardDTO updatedBoard = boardService.updateById(id, board);
		return null;
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = boardService.deleteById(id);
		return null;
	}
	

}

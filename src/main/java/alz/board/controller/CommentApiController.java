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
import alz.board.domain.CommentDTO;
import alz.board.service.CommentService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/comments")
@Log4j
public class CommentApiController {
	
	private CommentService commentService;
	
	@Autowired
	public CommentApiController(CommentService commentService) {
		this.commentService = commentService;
	}
	
	@PostMapping
	public ResponseEntity<?> create(@RequestBody CommentDTO comment){
		int affectedRowCount = commentService.create(comment);
		if(affectedRowCount!=1) 
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body("insert comment failed");
		
		return ResponseEntity.status(HttpStatus.CREATED).body("add comment success");
	}
	
	@PostMapping("/reComment")
	public ResponseEntity<?> create2(@RequestBody CommentDTO comment){
		int affectedRowCount = commentService.create2(comment);
		if(affectedRowCount!=1) 
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body("insert comment failed");
		
		return ResponseEntity.status(HttpStatus.CREATED).body("add comment success");
	}
	
	@GetMapping()
	public ResponseEntity<?> readOne(@PathVariable("boardId") Long boardId){
		CommentDTO searchedComment = commentService.readById(boardId);
		return ResponseEntity.status(HttpStatus.OK).body(searchedComment);
	}
	
	@GetMapping(value = "/{boardId}",
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<?> readAll(@PathVariable("boardId") Long boardId) {
		List<CommentDTO> comments = commentService.readAll(boardId);
		return ResponseEntity.status(HttpStatus.OK).body(comments);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody CommentDTO comment){
		CommentDTO updatedComment = commentService.updateById(id, comment);
		return ResponseEntity.status(HttpStatus.OK).body(updatedComment);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = commentService.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body("ok");
	}

}

package alz.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import alz.board.domain.CommentDTO;
import alz.board.service.CommentService;

@RestController
@RequestMapping("/comments")
public class CommentApiController {
	
	private CommentService commentService;
	
	@Autowired
	public CommentApiController(CommentService commentService) {
		this.commentService = commentService;
	}
	
	@PostMapping
	public ResponseEntity<?> create(@RequestBody CommentDTO comment){
		CommentDTO registerComment = commentService.create(comment);
		return ResponseEntity.status(HttpStatus.CREATED).body(registerComment);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id){
		CommentDTO searchedComment = commentService.readById(id);
		return ResponseEntity.status(HttpStatus.OK).body(searchedComment);
	}
	
	@GetMapping()
	public ResponseEntity<?> readAll() {
		List<CommentDTO> comments = commentService.readAll();
		return ResponseEntity.status(HttpStatus.OK).body(comments);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, CommentDTO comment){
		CommentDTO updatedComment = commentService.updateById(id, comment);
		return ResponseEntity.status(HttpStatus.OK).body(updatedComment);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = commentService.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body("ok");
	}

}

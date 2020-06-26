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
		CommentDTO registerComment = commentService.create();
		return null;
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id){
		CommentDTO searchedComment = commentService.readById(id);
		return null;
	}
	
	@GetMapping()
	public ResponseEntity<?> readAll() {
		List<CommentDTO> comments = commentService.readAll();
		return null;
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, CommentDTO comment){
		CommentDTO updatedComment = commentService.updateById(id, comment);
		return null;
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = commentService.deleteById(id);
		return null;
	}

}

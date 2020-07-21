package alz.classes.controller;

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

import alz.classes.domain.ClassDTO;
import alz.classes.domain.ClassRequestDTO;
import alz.classes.service.ClassService;

@RestController
@RequestMapping("/api/classes")
public class ClassApiController {

	private ClassService classService;
	
	@Autowired
	public ClassApiController(ClassService classService) {
		this.classService = classService;
	}
	
	@PostMapping
	public ResponseEntity<?> create(@RequestBody ClassRequestDTO classes){
		ClassDTO openedClass = classService.create(classes);
		return ResponseEntity.status(HttpStatus.CREATED).body(openedClass);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id){
		ClassDTO searchedClass = classService.readById(id);
		return ResponseEntity.status(HttpStatus.OK).body(searchedClass);
	}
	
	@GetMapping
	public ResponseEntity<?> readAll() {
		List<ClassDTO> classes = classService.readAll();
		return ResponseEntity.status(HttpStatus.OK).body(classes);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody ClassDTO classes) {
		ClassDTO updatedClass = classService.updateById(id, classes);
		return ResponseEntity.status(HttpStatus.OK).body(updatedClass);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = classService.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body("ok");
	}
}

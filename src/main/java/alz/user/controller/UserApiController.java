package alz.user.controller;

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

import alz.user.domain.UserDTO;

@RestController
@RequestMapping("/users")
public class UserApiController {

//	private UserService userService;
//	
//	@Autowired
//	public UserApiController(UserService userService) {
//		this.userService = userService;
//	}
//	
	@PostMapping
	public ResponseEntity<?> create(@RequestBody UserDTO user) {
		return null;
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id) {
		return null;
	}
	
	@GetMapping
	public ResponseEntity<?> readAll() {
		return null;
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody UserDTO user) {
		return null;
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id){
		return null;
	}
}

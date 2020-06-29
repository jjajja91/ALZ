package alz.user.controller;

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

import alz.user.domain.UserDTO;
import alz.user.service.UserService;


@RestController
@RequestMapping("/users")
public class UserApiController {
//유저api컨트롤러
	private UserService userService;

	@Autowired
	public UserApiController(UserService userService) {
		this.userService = userService;
	}

	@PostMapping
	public ResponseEntity<?> create(@RequestBody UserDTO user) {
		UserDTO openedUser = userService.create(user);
		return ResponseEntity.status(HttpStatus.CREATED).body(openedUser);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id) {
		UserDTO selectById = userService.readById(id);
		return ResponseEntity.status(HttpStatus.OK).body(selectById);
	}

	@GetMapping
	public ResponseEntity<?> readAll() {
		List<UserDTO> user = userService.readAll();
		return ResponseEntity.status(HttpStatus.OK).body(user);
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody UserDTO user) {
		UserDTO updatedUser = userService.updateById(id, user);
		return ResponseEntity.status(HttpStatus.OK).body(updatedUser);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = userService.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body("ok");
	}
}

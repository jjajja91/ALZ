package alz.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

	private UserService userService;

	@Autowired
	public UserApiController(UserService userService) {
		this.userService = userService;
	}

//	@PostMapping
//	public ResponseEntity<?> create(@RequestBody UserDTO user) {
//		UserDTO openedUser = userService.create(user);
//		return ResponseEntity.status(HttpStatus.CREATED).body(openedUser);
//	}
	
	@PostMapping(value = "/emailChk", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<?> emailChk(@RequestBody UserDTO user) {
		UserDTO foundUser = userService.readByEmail(user.getEmail());
		return ResponseEntity.status(HttpStatus.OK).body(foundUser);
	}
	
	@GetMapping(value = "/nicknameChk/{nickname}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<?> nicknameChk(@PathVariable String nickname) {
		UserDTO user = userService.readByNickname(nickname);
		return ResponseEntity.status(HttpStatus.OK).body(user);
	}
	
//	@GetMapping
//	public ResponseEntity<?> readAll() {
//		List<UserDTO> user = userService.readAll();
//		return ResponseEntity.status(HttpStatus.OK).body(user);
//	}
//
	@PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> updateOne(@RequestBody UserDTO user) {
		UserDTO updatedUser = userService.updateById(user);
		return ResponseEntity.status(HttpStatus.OK).body(updatedUser);
	}
//
//	@DeleteMapping("/{id}")
//	public ResponseEntity<?> deleteOne(@PathVariable UserDTO user) {
//		int affectedRowCount = userService.deleteById(user, null);
//		return ResponseEntity.status(HttpStatus.OK).body("ok");
//	}
}

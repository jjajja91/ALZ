package alz.board.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import alz.board.exceptions.NoUserException;

@ControllerAdvice
public class BoardPageControllerAdvice {
	
	@ExceptionHandler(NoUserException.class)
	public String noUser(NoUserException e) {
		return "user/users/login";
	}

}

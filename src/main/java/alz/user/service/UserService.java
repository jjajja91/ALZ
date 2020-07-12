package alz.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import alz.user.domain.UserDTO;

public interface UserService {

	UserDTO create(UserDTO user);

	UserDTO readById(UserDTO user);

	List<UserDTO> readAll();

	UserDTO updateById(UserDTO user);

	Integer nicknameChk(String nickname) throws Exception;
	Integer emailChk(String email) throws Exception;

	int deleteById(UserDTO user, HttpServletRequest request);

}
package alz.user.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alz.user.domain.UserDTO;

public interface UserService {

	UserDTO create(UserDTO user);

	UserDTO readById(UserDTO user);
	
	UserDTO readByEmail(String email);

	UserDTO readByNickname(String nickname);

	List<UserDTO> readAll();

	UserDTO updateById(UserDTO user);

	int deleteById(UserDTO user, HttpServletRequest request);
	
	int emailChk(String email);
	
	int nicknameChk(String nickname);
	
	UserDTO userInfo(long id);
	UserDTO findId(UserDTO user, HttpServletResponse response) throws IOException;
	UserDTO findpw(UserDTO user);

	String searchId(String email);

//	void asyncService();

}
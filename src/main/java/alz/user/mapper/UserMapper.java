package alz.user.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import alz.user.domain.UserDTO;

public interface UserMapper {

	int insert(UserDTO user);

	UserDTO selectById(UserDTO user);
	
	UserDTO selectByNickname(String nickname);

	UserDTO selectByEmail(String email);

	List<UserDTO> selectAll();

	UserDTO updateById(UserDTO user);

	int deleteById(UserDTO user, HttpServletRequest request);
	
	int emailChk(String email);

	int nicknameChk(String nickname);

}

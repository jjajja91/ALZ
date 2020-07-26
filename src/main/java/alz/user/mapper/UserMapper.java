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

	int updateById(UserDTO user);

	int deleteById(UserDTO user, HttpServletRequest request);
	
	int emailChk(String email);

	int nicknameChk(String nickname);
	
	UserDTO userInfo(Long id);
	UserDTO findId(UserDTO user);
	UserDTO findpw(UserDTO user);
	UserDTO selectedByUser(UserDTO user);

}

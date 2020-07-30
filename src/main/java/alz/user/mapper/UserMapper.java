package alz.user.mapper;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;

import alz.user.domain.UserDTO;

public interface UserMapper {

	int insert(UserDTO user);

	UserDTO selectById(UserDTO user);
	
	UserDTO selectByNickname(String nickname);

	UserDTO selectByEmail(String email);

	List<UserDTO> selectAll();

	int updateById(UserDTO user);

	int emailChk(String email);

	int nicknameChk(String nickname);
	
	UserDTO userInfo(Long id);

	UserDTO selectedByUser(UserDTO user);

	String searchId(String email);
	
	String find_id(@Param("nickname") String nickname, @Param("phoneNumber") String phoneNumber, HttpServletResponse response) throws Exception;

}

package alz.user.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;

import alz.user.domain.UserDTO;

public interface UserMapper {

	int insert(UserDTO user);

	UserDTO selectById(UserDTO user);
	
	UserDTO selectByNickname(String nickname);

	UserDTO selectByEmail(String email);

	UserDTO selectByPhoneNumber(String phoneNumber);

	List<UserDTO> selectAll();

	int updateById(UserDTO user);

	int emailChk(String email);

	int nicknameChk(String nickname);
	
	int phoneNumberChk(String phoneNumber);

	UserDTO userInfo(Long id);

	UserDTO selectedByUser(UserDTO user);

	String searchId(String email);
	
	String find_id(@Param("nickname") String nickname, @Param("phoneNumber") String phoneNumber, HttpServletResponse response) throws Exception;

	public String find_password_email(UserDTO dto); // 비밀번호 찾기

	public void find_password_result(@Param("password") String password, Map<String, Object> map, UserDTO dto) throws Exception; // 비밀번호 변경
	

}

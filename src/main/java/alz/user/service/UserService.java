package alz.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;

import alz.user.domain.UserDTO;

public interface UserService {

	UserDTO create(UserDTO user);

	UserDTO readById(UserDTO user);
	
	UserDTO readByEmail(String email);

	UserDTO readByNickname(String nickname);

	UserDTO readByPhoneNumber(String phoneNumber);

	List<UserDTO> readAll();

	UserDTO updateById(UserDTO user);

	int emailChk(String email);
	
	int nicknameChk(String nickname);
	
	int phoneNumberChk(String phoneNumber);
	
	UserDTO userInfo(long id);
	
	String getKakaoAccessToken (String authorizeCode);

	String searchId(String email);
	
	HashMap<String, Object> getKakaoUserInfo (String accessToken);
	
	String find_id(@Param("nickname") String nickname, @Param("phoneNumber") String phoneNumber, HttpServletResponse response) throws Exception;

	public String find_password_email(UserDTO dto); // 비밀번호 찾기 관련

	public void find_password_result(@Param("password") String password, Map<String, Object> map, UserDTO dto) throws Exception; // 비밀번호 변경
	
	String getNaverAccessToken(String code, String state);

	HashMap<String, Object> getNaverUserInfo(String accessToken);

	boolean duplicateCheck(String email);


//	void asyncService();

}
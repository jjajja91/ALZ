package alz.user.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;

import alz.user.domain.UserDTO;

public interface UserService {

	UserDTO create(UserDTO user);

	UserDTO readById(UserDTO user);
	
	UserDTO readByEmail(String email);

	UserDTO readByNickname(String nickname);

	List<UserDTO> readAll();

	UserDTO updateById(UserDTO user);

	int emailChk(String email);
	
	int nicknameChk(String nickname);
	
	UserDTO userInfo(long id);
	
	String getKakaoAccessToken (String authorizeCode);

	String searchId(String email);
	
	HashMap<String, Object> getKakaoUserInfo (String accessToken);
	
	String find_id(@Param("nickname") String nickname, @Param("phoneNumber") String phoneNumber, HttpServletResponse response) throws Exception;

	String getNaverAccessToken(String code, String state);

	HashMap<String, Object> getNaverUserInfo(String accessToken);

	boolean duplicateCheck(String email);

	String getGoogleAccessToken(String code);

	HashMap<String, Object> getGoogleUserInfo(String accessToken);

//	void asyncService();

}
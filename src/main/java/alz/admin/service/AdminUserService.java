package alz.admin.service;

import java.util.List;

import alz.user.domain.UserDTO;

public interface AdminUserService {

	// 이메일 중복 체크
	boolean emailChk(String email);

	// 닉네임 중복 체크
	boolean nicknameChk(String nickname);

	// 회원 목록
	public List<UserDTO> userList();

	// 회원 입력
	public void insertUser(UserDTO dto);

	// 회원 정보 상세보기
	public UserDTO viewUser(String email);

	// 회원삭제
	public void deleteUser(String email);

	// 회원정보 수정
	public void updateUser(UserDTO dto);

	// 비밀번호 체크
	public boolean checkPw(String email, String password);

	// 회원정보를 찾는 메소드
	List<UserDTO> find_member_info(String email) throws Exception;

	// 강제탈퇴 시킬때 해당 회원이 있는지 체크하는 메소드
	void admin_member_forced_evictionCheck(UserDTO dto) throws Exception;

//	void asyncService();

}
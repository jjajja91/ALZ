package alz.user.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.user.domain.UserDTO;
import alz.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	// mapper 가져와서 사용
	private UserMapper userMapper;

	@Autowired
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
//	@Override
//	public UserDTO findId(UserDTO user) {
//		UserDTO searchedUser = userMapper.findId(user);
//		
//		if (searchedUser == null) {
//			System.out.println("Find Fail!!");
//		} else {
//			System.out.println("Find Success!!");
//		}
//		
//		return searchedUser;
//	}
	
	@Override
	public UserDTO findId(UserDTO user, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		UserDTO dto = userMapper.findId(user);
		
		if (dto == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return dto;
		}
	}
	
	@Override
	public UserDTO findpw(UserDTO user) {
		UserDTO searchedUser = userMapper.findpw(user);
		
		if (searchedUser == null) {
			System.out.println("Find Fail!!");
		} else {
			System.out.println("Find Success!!");
		}
		
		return searchedUser;
	}
	
	@Override
	public UserDTO create(UserDTO user) {
		int affectedRowCount = userMapper.insert(user);
		UserDTO openUser = userMapper.selectById(user); 
		
		if (openUser == null) {
			System.out.println("Create Fail!!");
		} else {
			System.out.println("Create Success!!");
		}
		
		return openUser;
	}

	@Override
	public UserDTO readById(UserDTO user) {
		UserDTO searchedUser = userMapper.selectById(user);
		
		if (searchedUser == null) {
			System.out.println("Login Fail!!");
		} else {
			System.out.println("Login Success!!");
		}
		
		return searchedUser;
	}
	
	@Override
	public UserDTO readByEmail(String email) {
		System.out.println(email);
		UserDTO searchedUser = userMapper.selectByEmail(email);
		
		if (searchedUser == null) {
			System.out.println("Login Fail!!");
		} else {
			System.out.println("Login Success!!");
		}
		
		return searchedUser;
	}
	
	@Override
	public UserDTO readByNickname(String nickname) {
		UserDTO searchedUser = userMapper.selectByNickname(nickname);
		
		if (searchedUser == null) {
			System.out.println("Login Fail!!");
		} else {
			System.out.println("Login Success!!");
		}
		
		return searchedUser;
	}

	@Override
	public int emailChk(String email) {
		return emailChk(email);
	}
	
	@Override
	public int nicknameChk(String nickname) {
		return nicknameChk(nickname);
	}
	
	@Override
	public List<UserDTO> readAll() {
		List<UserDTO> user = userMapper.selectAll();
		return user;
	}

	@Override
	public UserDTO updateById(UserDTO user) {
		UserDTO searchedUser = userMapper.selectById(user);
		searchedUser.setNickname(user.getNickname()).setPassword(user.getPassword())
					.setRole(user.getRole()).setCertificationState(user.getCertificationState())
					.setPhoneNumber(user.getPhoneNumber())
					.setState(user.getState()).setEndAt(user.getEndAt());
		UserDTO affectedRowCount = userMapper.updateById(searchedUser);
		
		if(affectedRowCount == null ) {
			System.out.println("Modify Fail!!");
		} else {
			System.out.println("Modify Success!!");
		}
		
		return searchedUser;
	}

	@Override
	public int deleteById(UserDTO user, HttpServletRequest request) {
		int affectedRowCount = userMapper.deleteById(user, request);
		
		if(affectedRowCount == 0 ) {
			System.out.println("Delete Fail!!");
		} else {
			System.out.println("Delete Success!!");
		}
		
		return affectedRowCount;
	}
}
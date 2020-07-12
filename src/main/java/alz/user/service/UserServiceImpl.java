package alz.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public List<UserDTO> readAll() {
		List<UserDTO> user = userMapper.selectAll();
		return user;
	}

	@Override
	public UserDTO updateById(UserDTO user) {
		UserDTO searchedUser = userMapper.selectById(user);
		searchedUser.setNickname(user.getNickname()).setPassword(user.getPassword())
					.setRole(user.getRole()).setCertificationState(user.getCertificationState())
					.setModifiedAt(user.getModifiedAt()).setIntroduce(user.getIntroduce())
					.setLikeCnt(user.getLikeCnt()).setBoardCnt(user.getBoardCnt())
					.setReservCnt(user.getReservCnt()).setCommentCnt(user.getCommentCnt())
					.setState(user.getState()).setEndAt(user.getEndAt());
		int affectedRowCount = userMapper.updateById(searchedUser);
		
		if(affectedRowCount == 0 ) {
			System.out.println("Modify Fail!!");
		} else {
			System.out.println("Modify Success!!");
		}
		
		return searchedUser;
	}

	@Override
	public int deleteById(UserDTO user, HttpServletRequest request) {
		UserDTO searchedUser = userMapper.selectById(user);
		int affectedRowCount = userMapper.deleteById(user, request);

		
		if(affectedRowCount == 0 ) {
			System.out.println("Delete Fail!!");
		} else {
			System.out.println("Delete Success!!");
		}
		
		return affectedRowCount;
	}
}

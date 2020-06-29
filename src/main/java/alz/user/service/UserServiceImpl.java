package alz.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.user.domain.UserDTO;
import alz.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	// mapper 가져와서 사용함
	private UserMapper userMapper;

	@Autowired
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public UserDTO create(UserDTO user) {
		int affectedRowCount = userMapper.insert(user);
		UserDTO openUser = userMapper.selectById(user.getId());
		return openUser;
	}

	@Override
	public UserDTO readById(Long id) {
		UserDTO searchedUser = userMapper.selectById(id);
		return searchedUser;
	}

	@Override
	public List<UserDTO> readAll() {
		List<UserDTO> user = userMapper.selectAll();
		return user;
	}

	@Override
	public UserDTO updateById(Long id, UserDTO user) {
		UserDTO searchedUser = userMapper.selectById(id);
		searchedUser.setNickName(user.getNickName()).setPassword(user.getPassword())
					.setRole(user.getRole()).setCertificationState(user.getCertificationState())
					.setModifiedAt(user.getModifiedAt()).setIntroduce(user.getIntroduce())
					.setLikeCnt(user.getLikeCnt()).setBoardCnt(user.getBoardCnt())
					.setReservCnt(user.getReservCnt()).setCommentCnt(user.getCommentCnt())
					.setState(user.getState()).setEndAt(user.getEndAt());
		int affectedRowCount = userMapper.updatedById(searchedUser);
		return searchedUser;
	}

	@Override
	public int deleteById(Long id) {
		UserDTO searchedUser = userMapper.selectById(id);
		int affectedRowCount = userMapper.deleteById(id);
		return affectedRowCount;
	}

}

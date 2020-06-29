package alz.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import alz.user.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	//mapper 가져와서 사용
	
	@Override
	public UserDTO create(UserDTO user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDTO readById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserDTO> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDTO updateById(Long id, UserDTO user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteById(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

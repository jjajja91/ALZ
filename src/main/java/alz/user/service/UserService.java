package alz.user.service;

import java.util.List;

import alz.user.domain.UserDTO;

public interface UserService {
	
	// mapper 가져와서 사용하기

	UserDTO create(UserDTO user);

	UserDTO readById(Long id);

	List<UserDTO> readAll();

	UserDTO updateById(Long id, UserDTO user);

	int deleteById(Long id);

}

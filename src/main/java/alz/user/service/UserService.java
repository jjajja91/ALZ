package alz.user.service;

import java.util.List;

import alz.user.domain.UserDTO;

public interface UserService {
//유저서비스
	UserDTO create(UserDTO user);

	UserDTO readById(Long id);

	List<UserDTO> readAll();

	UserDTO updateById(Long id, UserDTO user);

	int deleteById(Long id);

}

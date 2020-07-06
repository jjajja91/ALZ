package alz.user.mapper;

import java.util.List;

import alz.user.domain.UserDTO;

public interface UserMapper {

	int insert(UserDTO user);
	
	UserDTO selectById(Long id);
	
	UserDTO selectByEmail(String email);
	
	List<UserDTO> selectAll();
	
	int updatedById(UserDTO user);
	
	int deleteById(Long id);
	
}

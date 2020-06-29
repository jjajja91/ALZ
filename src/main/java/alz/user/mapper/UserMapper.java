package alz.user.mapper;

import java.util.List;

import alz.user.domain.UserDTO;

public interface UserMapper {
	//유저매퍼
	int insert(UserDTO user);
	
	UserDTO selectById(Long id);
	
	List<UserDTO> selectAll();
	
	int updatedById(UserDTO user);
	
	int deleteById(Long id);
	
}

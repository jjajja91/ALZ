package alz.user.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import alz.user.domain.UserDTO;

public interface UserMapper {

	int insert(UserDTO user);

	UserDTO selectById(UserDTO user);

	List<UserDTO> selectAll();

	int updateById(UserDTO user);

	int deleteById(UserDTO user, HttpServletRequest request);

}

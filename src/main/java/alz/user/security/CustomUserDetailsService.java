package alz.user.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import alz.user.domain.CustomUser;
import alz.user.domain.UserDTO;
import alz.user.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = {@Autowired})
	private UserMapper userMapper;
	

	public UserDetails loadUserByUsername(Long userId) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + userId);
		//userId는 UserMapper.java에서 Long타입인 Id를 의미한다
		UserDTO dto = userMapper.selectById(userId);
		log.warn("queried by member mapper" + dto);
		return dto == null ? null : new CustomUser(dto);
	}
}
package alz.user.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import alz.user.domain.UserDTO;
import alz.user.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = {@Autowired})
	private UserMapper userMapper;
	

	public UserDetails loadUserByUsername(Long id) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + id);
		return null;
	}
}
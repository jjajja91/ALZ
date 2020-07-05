package alz.user.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import alz.user.domain.UserDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class UserMapperTests {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Test
	public void testSelect() {
		UserDTO dto = mapper.selectById(1L);
		log.info(dto);
	}
}

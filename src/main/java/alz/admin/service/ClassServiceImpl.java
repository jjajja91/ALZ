package alz.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.admin.mapper.ClassMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ClassServiceImpl implements ClassService {
	
	//mapper 가져와서 사용
	private ClassMapper classMapper;
	
	@Autowired
	public ClassServiceImpl(ClassMapper classMapper) {
		this.classMapper = classMapper;
	}
	

}

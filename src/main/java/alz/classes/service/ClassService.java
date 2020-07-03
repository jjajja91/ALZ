package alz.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.classes.domain.ClassDTO;
import alz.classes.mapper.ClassMapper;

@Service
public class ClassService {

	private ClassMapper classMapper;
	
	@Autowired
	public ClassService(ClassMapper classMapper) {
		this.classMapper = classMapper;
	}
	
	
	public ClassDTO create(ClassDTO classes) 	{
		int affectedRowCount = classMapper.insert(classes);
		ClassDTO openedClass = classMapper.findById(classes.getId());
		return openedClass;
	}

	public ClassDTO readById(Long id) {
		ClassDTO searchedClass = classMapper.findById(id);
		return searchedClass;
	}

	public List<ClassDTO> readAll() {
		List<ClassDTO> classes = classMapper.findAll();
		return classes;
	}

	//chain
	public ClassDTO updateById(Long id, ClassDTO classes) {
		ClassDTO searchedClass = classMapper.findById(id);
		searchedClass.setName(classes.getName()).setDiscription(classes.getDiscription())
		.setOpenAt(classes.getOpenAt()).setCloseAt(classes.getCloseAt())
		.setStartAt(classes.getStartAt()).setEndAt(classes.getEndAt())
		.setState(classes.getState()).setCategoryId(classes.getCategoryId());
		int affectedRowCount = classMapper.updateById(searchedClass);
		return searchedClass;
	}

	public int deleteById(Long id) {
		ClassDTO searchedClass = classMapper.findById(id);
		int affectedRowCount = classMapper.deleteById(id);
		return affectedRowCount;
	}

	
}

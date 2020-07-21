package alz.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.classes.domain.ClassDTO;
import alz.classes.domain.ClassRequestDTO;
import alz.classes.mapper.ClassMapper;

@Service
public class ClassService {

	private ClassMapper classMapper;
	
	@Autowired
	public ClassService(ClassMapper classMapper) {
		this.classMapper = classMapper;
	}
	

	public ClassDTO create(ClassRequestDTO classes) 	{
		ClassDTO classDTO = toEntity(classes);
		int affectedRowCount = classMapper.insert(classDTO);
		ClassDTO openedClass = classMapper.findById(classDTO.getId());
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
		
		searchedClass.setName(classes.getName()).setDescription(classes.getDescription())
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
	
	private ClassDTO toEntity(ClassRequestDTO request) {
		return ClassDTO.builder()
				    .name(request.getName())
				    .description(request.getDescription())
				    .openAt(request.getOpenAt())
				    .closeAt(request.getCloseAt())
				    .startAt(request.getStartAt())
				    .endAt(request.getEndAt())
				    .categoryId(request.getCategoryId())
				    .teacherId(request.getTeacherId())
					.build();
		
		
	}

	
}

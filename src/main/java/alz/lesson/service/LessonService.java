package alz.lesson.service;

import java.util.List;

import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonRequestDTO;
import alz.lesson.domain.LessonResponseDTO;

public interface LessonService {

	LessonDTO create(LessonRequestDTO lessons);
	
	LessonResponseDTO readById(Long id);
	List<LessonDTO> readAll();
	
	LessonDTO updateById(Long id, LessonDTO lessons);
	
	int deleteById(Long id);
	
}

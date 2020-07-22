package alz.lesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonRequestDTO;
import alz.lesson.domain.LessonResponseDTO;
import alz.lesson.mapper.LessonMapper;

@Service
public class LessonServiceImpl implements LessonService {

	private LessonMapper lessonMapper;
	
	@Autowired
	public LessonServiceImpl(LessonMapper lessonMapper) {
		this.lessonMapper = lessonMapper;
	}
	
	public LessonDTO create(LessonRequestDTO lessons) 	{
		LessonDTO lessonDTO = toEntity(lessons);
		int affectedRowCount = lessonMapper.insert(lessonDTO);
//		LessonDTO openedClass = lessonMapper.findById(lessonDTO.getId());
		return lessonDTO;
	}

	public LessonResponseDTO readById(Long id) {
		LessonResponseDTO searchedLessons = lessonMapper.findById(id);
		System.out.println(searchedLessons);
		return searchedLessons;
	}

	public List<LessonDTO> readAll() {
		List<LessonDTO> lessons = lessonMapper.findAll();
		return lessons;
	}

	//chain
	public LessonDTO updateById(Long id, LessonDTO lessons) {
//		LessonDTO searchedLessons = lessonMapper.findById(id);
		
//		searchedLessons.setState(lessons.getState()).setCategoryId(lessons.getCategoryId());
//		int affectedRowCount = lessonMapper.updateById(searchedLessons);
		return null;
	}

	public int deleteById(Long id) {
//		LessonDTO searchedLesson = lessonMapper.findById(id);
		int affectedRowCount = lessonMapper.deleteById(id);
		return affectedRowCount;
	}
	
	private LessonDTO toEntity(LessonRequestDTO request) {
		return LessonDTO.builder()
				    .categoryId(request.getCategoryId())
				    .teacherId(request.getTeacherId())
					.build();
	}

	
}

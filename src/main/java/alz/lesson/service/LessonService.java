package alz.lesson.service;

import java.util.List;

import alz.lesson.domain.CurriculumDetailDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonRequestDTO;
import alz.lesson.domain.LessonResponseDTO;
import alz.lesson.domain.QuickReviewDTO;
import alz.lesson.domain.TeacherDTO;

public interface LessonService {

	LessonDTO create(LessonRequestDTO lessons);
	
	LessonResponseDTO readById(Long id);
	List<CurriculumSubjectDTO> curriculumById(Long id);
	TeacherDTO teacherById(Long id);
	List<QuickReviewDTO> quickReviewById(Long id);
	
	List<LessonDTO> readAll();
	
	LessonDTO updateById(Long id, LessonDTO lessons);
	
	int deleteById(Long id);
	
}
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

	TeacherDTO createTeacher(TeacherDTO teacher);
	LessonDTO create(LessonRequestDTO lessons);

	TeacherDTO teacherByUserId(Long userId);
	List<LessonRequestDTO> lessonsByTeacherId(Long teacherId);
	
	LessonResponseDTO readByLessonId(Long id);
	List<CurriculumSubjectDTO> curriculumByLessonId(Long id);
	TeacherDTO teacherByLessonId(Long id);
	List<QuickReviewDTO> quickReviewByLessonId(Long id);
	
	List<LessonDTO> readAll();

	LessonDTO updateById(Long id, LessonDTO lessons);
	TeacherDTO updateTeacher(TeacherDTO teacher);
	
	int deleteById(Long id);
	
}
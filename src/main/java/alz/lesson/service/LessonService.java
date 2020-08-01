package alz.lesson.service;

import java.util.List;

import alz.lesson.domain.CategoryDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.QuickReviewDTO;
import alz.lesson.domain.TeacherDTO;

public interface LessonService {

	TeacherDTO createTeacher(TeacherDTO teacher);
	int createLesson(LessonDTO lesson);

	TeacherDTO teacherByUserId(Long userId);
	List<LessonDTO> lessonsByTeacherId(Long teacherId);
	
	LessonDTO readByLessonId(Long id);
	LessonDTO basicByLessonId(Long id); // 기본정보만
	List<CurriculumSubjectDTO> curriculumByLessonId(Long id);
	TeacherDTO teacherByLessonId(Long id);
	List<QuickReviewDTO> quickReviewByLessonId(Long id);
	
	List<CategoryDTO> mainCategory();
	List<CategoryDTO> subCategory();
	List<CategoryDTO> lessonLevel();
	
	List<LessonDTO> readAll();

	LessonDTO updateById(Long id, LessonDTO lessons);
	TeacherDTO updateTeacher(TeacherDTO teacher);
	
	int deleteById(Long id);
	
}
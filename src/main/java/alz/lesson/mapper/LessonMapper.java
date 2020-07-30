package alz.lesson.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alz.lesson.domain.CurriculumDetailDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonRequestDTO;
import alz.lesson.domain.LessonResponseDTO;
import alz.lesson.domain.QuickReviewDTO;
import alz.lesson.domain.TeacherDTO;

public interface LessonMapper {

	int insertTeacher(TeacherDTO teacher);
	int insert(LessonDTO classes);
	
	TeacherDTO findTeacherByUserId(Long userId);
	List<LessonRequestDTO> lessonsByTeacherId(Long teacherId);

	LessonResponseDTO findByLessonId(Long id);
	List<CurriculumSubjectDTO> findCurriculumByLessonId(Long id);
	TeacherDTO findTeacherByLessonId(Long id);
	List<QuickReviewDTO> findQuickReviewByLessonId(Long id);

	List<LessonDTO> findAll();

	int updateById(LessonDTO searchedLessons);
	int updateTeacher(TeacherDTO teacher);

	int deleteById(Long id);

}

package alz.lesson.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alz.lesson.domain.CurriculumDetailDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonResponseDTO;
import alz.lesson.domain.QuickReviewDTO;
import alz.lesson.domain.TeacherDTO;

public interface LessonMapper {

	int insertTeacher(TeacherDTO teacher);
	int insert(LessonDTO classes);

	LessonResponseDTO findById(Long id);
	
	List<CurriculumSubjectDTO> findCurriculumById(Long id);
	TeacherDTO findTeacherById(Long id);
	List<QuickReviewDTO> findQuickReviewById(Long id);

	List<LessonDTO> findAll();

	int updateById(LessonDTO searchedLessons);

	int deleteById(Long id);

}

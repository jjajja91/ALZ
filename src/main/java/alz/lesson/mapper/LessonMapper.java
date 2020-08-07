package alz.lesson.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import alz.lesson.domain.CategoryDTO;
import alz.lesson.domain.CurriculumDetailDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonDetailDTO;
import alz.lesson.domain.LessonScheduleDTO;
import alz.lesson.domain.QuickReviewDTO;
import alz.lesson.domain.ScheduleDTO;
import alz.lesson.domain.TeacherDTO;
import alz.lesson.domain.TimeTableDTO;

public interface LessonMapper {

	int insertTeacher(TeacherDTO teacher);
	int insertLesson(LessonDTO lesson);
	int insertSchedule(TimeTableDTO timeTable);
	int insertLessonDetail(LessonDetailDTO detail);
	int insertCurriculumSubject(CurriculumSubjectDTO curriculumSubject);
	int insertCurriculumDetail(CurriculumDetailDTO curriculumDetail);
	
	TeacherDTO findTeacherByUserId(Long userId);
	List<LessonDTO> lessonsByTeacherId(LessonDTO lesson);
	LessonDTO lessonByTeacherId(LessonDTO lesson);

	LessonDTO findByLessonId(Long id);
	LessonDTO findBasicByLessonId(Long id); // 기본정보
	List<CurriculumSubjectDTO> findCurriculumByLessonId(Long id);
	TeacherDTO findTeacherByLessonId(Long id);
	List<QuickReviewDTO> findQuickReviewByLessonId(Long id);
	ScheduleDTO findLessonSchedule(Long lessonId); // 스케줄 불러오기

	List<LessonDTO> findAll();
	
	List<CategoryDTO> findMainCategory();
	List<CategoryDTO> findSubCategory();
	List<CategoryDTO> findLessonLevel();
	
	LessonDetailDTO findLessonDetail(Long lessonId);

	int updateLesson(LessonDTO lesson);
	int updateTeacher(TeacherDTO teacher);
	int updateLessonDetail(LessonDetailDTO detail);
	int updateState(LessonDTO lesson);

	int deleteLesson(Long id);
	int deleteSchedule(Long lessonId);
	int deleteLessonDetail(Long detailId);
	int deleteCurriculum(Long lessonId);
	int deleteCurriculumDetail(Long lessonId);

}

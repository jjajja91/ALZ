package alz.lesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.lesson.domain.CategoryDTO;
import alz.lesson.domain.CurriculumDetailDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.QuickReviewDTO;
import alz.lesson.domain.ScheduleDTO;
import alz.lesson.domain.TeacherDTO;
import alz.lesson.mapper.LessonMapper;

@Service
public class LessonServiceImpl implements LessonService {

	private LessonMapper lessonMapper;
	
	@Autowired
	public LessonServiceImpl(LessonMapper lessonMapper) {
		this.lessonMapper = lessonMapper;
	}
	
	// 강사등록
	public TeacherDTO createTeacher(TeacherDTO teacher) {
		int affectedRowCount = lessonMapper.insertTeacher(teacher);
		return teacher;
	}
	
	// 클래스 기본정보 등록
	public int createLesson(LessonDTO lesson) 	{
		int affectedRowCount = lessonMapper.insertLesson(lesson);
		// 만들어진 클래스 id 보내줌
		int lessonId = lesson.getId().intValue();
		return lessonId;
	}
	
	// 클래스 스케줄 등록
	public int createSchedule(ScheduleDTO schedule) {
		int affectedRowCount = 0;
		
		for(int i=0; i<schedule.getTimeList().size(); i++) {
			affectedRowCount += lessonMapper.insertSchedule(schedule.getTimeList().get(i));
		}
		return affectedRowCount;
	}
	
	// 강사 등록할 때
	public TeacherDTO teacherByUserId(Long userId) {
		TeacherDTO teacher = lessonMapper.findTeacherByUserId(userId);
		return teacher;
	}

	// 클래스 기본정보 등록
	public List<LessonDTO> lessonsByTeacherId(Long teacherId) {
		List<LessonDTO> lessonList = lessonMapper.lessonsByTeacherId(teacherId);
		return lessonList;
	}

	// 클래스 세부
	public LessonDTO readByLessonId(Long id) {
		LessonDTO searchedLessons = lessonMapper.findByLessonId(id);
		return searchedLessons;
	}

	// 클래스 기본정보
	public LessonDTO basicByLessonId(Long id) {
		LessonDTO searchedLessons = lessonMapper.findBasicByLessonId(id);
		return searchedLessons;
	}

	// 커리큘럼 
	public List<CurriculumSubjectDTO> curriculumByLessonId(Long id) {
		List<CurriculumSubjectDTO> curriculumSubject = lessonMapper.findCurriculumByLessonId(id);
		return curriculumSubject;
	}
	
	// 강사
	public TeacherDTO teacherByLessonId(Long id) {
		TeacherDTO teacher = lessonMapper.findTeacherByLessonId(id);
		return teacher;
	}
	
	// 한줄평
	public List<QuickReviewDTO> quickReviewByLessonId (Long id) {
		List<QuickReviewDTO> quickReview = lessonMapper.findQuickReviewByLessonId(id);
		return quickReview;
	}	
	
	// 메인 카테고리
	public List<CategoryDTO> mainCategory () {
		List<CategoryDTO> findMainCategory = lessonMapper.findMainCategory();
		return findMainCategory;
	}	
	
	// 서브 카테고리
	public List<CategoryDTO> subCategory () {
		List<CategoryDTO> findSubCategory = lessonMapper.findSubCategory();
		return findSubCategory;
	}
	
	// 서브 카테고리
	public List<CategoryDTO> lessonLevel () {
		List<CategoryDTO> findLessonLevel = lessonMapper.findLessonLevel();
		return findLessonLevel;
	}	

	public List<LessonDTO> readAll() {
		List<LessonDTO> lessons = lessonMapper.findAll();
		return lessons;
	}
	
	public TeacherDTO updateTeacher(TeacherDTO teacher) {
		int affectedRowCount = lessonMapper.updateTeacher(teacher);
		return teacher;
	}

	public int updateLesson(LessonDTO lesson) {
		int affectedRowCount = lessonMapper.updateLesson(lesson);
		return 0;
	}

	public int deleteById(Long id) {
//		LessonDTO searchedLesson = lessonMapper.findById(id);
		int affectedRowCount = lessonMapper.deleteById(id);
		return affectedRowCount;
	}
	
	private LessonDTO toEntity(LessonDTO request) {
		return LessonDTO.builder()
				    .categoryId(request.getCategoryId())
				    .teacherId(request.getTeacherId())
					.build();
	}


}

package alz.lesson.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.lesson.domain.CurriculumDetailDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.LessonRequestDTO;
import alz.lesson.domain.LessonResponseDTO;
import alz.lesson.domain.QuickReviewDTO;
import alz.lesson.domain.TeacherDTO;
import alz.lesson.mapper.LessonMapper;

@Service
public class LessonServiceImpl implements LessonService {

	private LessonMapper lessonMapper;
	
	@Autowired
	public LessonServiceImpl(LessonMapper lessonMapper) {
		this.lessonMapper = lessonMapper;
	}
	
	public TeacherDTO createTeacher(TeacherDTO teacher) {
		int affectedRowCount = lessonMapper.insertTeacher(teacher);
		return teacher;
	}
	
	public LessonDTO create(LessonRequestDTO lessons) 	{
		LessonDTO lessonDTO = toEntity(lessons);
		int affectedRowCount = lessonMapper.insert(lessonDTO);
//		LessonDTO openedClass = lessonMapper.findById(lessonDTO.getId());
		return lessonDTO;
	}
	
	// 강사 등록할 때
	public TeacherDTO teacherByUserId(Long userId) {
		TeacherDTO teacher = lessonMapper.findTeacherByUserId(userId);
		return teacher;
	}

	// 클래스 기본정보 등록
	public List<LessonRequestDTO> lessonsByTeacherId(Long teacherId) {
		List<LessonRequestDTO> lessonList = lessonMapper.lessonsByTeacherId(teacherId);
		return lessonList;
	}

	// 클래스 세부
	public LessonResponseDTO readByLessonId(Long id) {
		LessonResponseDTO searchedLessons = lessonMapper.findByLessonId(id);
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

	public List<LessonDTO> readAll() {
		List<LessonDTO> lessons = lessonMapper.findAll();
		System.out.println(lessons);
		return lessons;
	}

	//chain
	public LessonDTO updateById(Long id, LessonDTO lessons) {
//		LessonDTO searchedLessons = lessonMapper.findById(id);
		
//		searchedLessons.setState(lessons.getState()).setCategoryId(lessons.getCategoryId());
//		int affectedRowCount = lessonMapper.updateById(searchedLessons);
		return null;
	}
	
	public TeacherDTO updateTeacher(TeacherDTO teacher) {
		int affectedRowCount = lessonMapper.updateTeacher(teacher);
		return teacher;
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

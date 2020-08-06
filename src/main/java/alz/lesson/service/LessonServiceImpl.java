package alz.lesson.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		int updateRowCount;
		int affectedRowCount;
		
		if(lesson.getState()==null) {
			affectedRowCount = lessonMapper.insertLesson(lesson);
		} else {
			// 원래 있던 클래스 지우고 새로만듬
			if(lesson.getState()==1) {
				updateRowCount = lessonMapper.updateLesson(lesson);
			} else {
				affectedRowCount = lessonMapper.insertLesson(lesson);
			}
		}
		
		// 새로운 아이디 넘겨줌
		int lessonId = lesson.getId().intValue();
		return lessonId;
	}
	
	// 클래스 스케줄 등록
	public int createSchedule(ScheduleDTO schedule) {
		int affectedRowCount = 0;
		
		// 원래 있던 스케줄 삭제하고 새로만듬
		int deleteRowCount = lessonMapper.deleteSchedule(schedule.getLessonId());
		
		for(int i=0; i<schedule.getTimeTable().size(); i++) {
			affectedRowCount += lessonMapper.insertSchedule(schedule.getTimeTable().get(i));
		}
		return affectedRowCount;
	}
	
	// 클래스 세부 등록
	public int createLessonDetail(LessonDetailDTO detail) {
		
		// 원래 있던 세부설명 삭제하고 새로만듬
		if(detail.getId()!=null) {
			lessonMapper.deleteLessonDetail(detail.getId());
		}
		// 만들어진 클래스 id 보내줌
		int affectedRowCount = lessonMapper.insertLessonDetail(detail);
		int detailId = detail.getId().intValue();
		return detailId;
	}
	
	// 클래스 커리큘럼 등록
	public int createCurriculum(List<CurriculumSubjectDTO> curriculumList) {
		int affectedRowCount = 0;
		int deleteRowCount = 0;
		
		// 원래 있던 커리큘럼 삭제하고 새로만듬
		if(curriculumList.get(0).getLessonId()!=null) {
		 deleteRowCount += lessonMapper.deleteCurriculum(curriculumList.get(0).getLessonId());
		 deleteRowCount += lessonMapper.deleteCurriculumDetail(curriculumList.get(0).getLessonId());
		}
		
		for(int i=0; i<curriculumList.size(); i++) {
			List<CurriculumDetailDTO> detailList = curriculumList.get(i).getDetailList();
			curriculumList.get(i).setCurriculumOrder(i+1L);
			affectedRowCount += lessonMapper.insertCurriculumSubject(curriculumList.get(i));
			
			for(int j=0; j<detailList.size(); j++) {	
				detailList.get(j).setCurriculumId(curriculumList.get(i).getSubjectId()).setDetailOrder(j+1L);
				affectedRowCount += lessonMapper.insertCurriculumDetail(detailList.get(j));
			}
		}
		
		return affectedRowCount;
	}
		
	// 강사 등록할 때
	public TeacherDTO teacherByUserId(Long userId) {
		TeacherDTO teacher = lessonMapper.findTeacherByUserId(userId);
		return teacher;
	}

	// 클래스 히스토리 기본정보 가져오기
	public List<LessonDTO> lessonsByTeacherId(LessonDTO lesson) {
		List<LessonDTO> lessonList = lessonMapper.lessonsByTeacherId(lesson);
		return lessonList;
	}
	
	// 클래스 작성중 기본정보 가져오기
	public LessonDTO lessonByTeacherId(LessonDTO lesson) {
		LessonDTO searchedlesson = lessonMapper.lessonByTeacherId(lesson);
		return searchedlesson;
	}

	// 클래스 세부
	public LessonDTO readByLessonId(Long id) {
		LessonDTO searchedLessons = lessonMapper.findByLessonId(id);
		return searchedLessons;
	}

	// 클래스 기본정보
	public LessonDTO basicByLessonId(Long id) {
		LessonDTO searchedLessons = lessonMapper.findBasicByLessonId(id);
		System.out.println(searchedLessons);
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
	
	// 난이도
	public List<CategoryDTO> lessonLevel () {
		List<CategoryDTO> findLessonLevel = lessonMapper.findLessonLevel();
		return findLessonLevel;
	}	

	public List<LessonDTO> readAll() {
		List<LessonDTO> lessons = lessonMapper.findAll();
		return lessons;
	}
	
	// 스케줄
	public ScheduleDTO scheduleByLessonId(Long lessonId) {
		ScheduleDTO schedule = lessonMapper.findLessonSchedule(lessonId);
		LessonDTO searchedLesson = lessonMapper.findBasicByLessonId(lessonId);
		if(schedule==null) {
			schedule = new ScheduleDTO();
		}
		schedule.setOpenAt(searchedLesson.getOpenAt());
		schedule.setCloseAt(searchedLesson.getCloseAt());
		
		return schedule;
	}

	public LessonDetailDTO detailByLessonId(Long lessonId) {
		LessonDetailDTO detail = lessonMapper.findLessonDetail(lessonId);
		return detail;
	}
	
	public TeacherDTO updateTeacher(TeacherDTO teacher) {
		int affectedRowCount = lessonMapper.updateTeacher(teacher);
		return teacher;
	}
	
	public int updateLessonDetail(LessonDetailDTO detail) {
		int affectedRowCount = lessonMapper.updateLessonDetail(detail);
		return affectedRowCount;
	}
	
	public int lessonSubmit(Long lessonId) {
		int affectedRowCount = lessonMapper.updateState(lessonId);
		return affectedRowCount;
	}


}

package alz.lesson.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import alz.lesson.domain.CategoryDTO;
import alz.lesson.domain.CurriculumSubjectDTO;
import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.ScheduleDTO;
import alz.lesson.service.LessonServiceImpl;

@RestController
@RequestMapping("/lessons")
public class LessonApiController {

	private LessonServiceImpl lessonService;
	
	@Autowired
	public LessonApiController(LessonServiceImpl lessonService) {
		this.lessonService = lessonService;
	}
	
	@PostMapping
	public ResponseEntity<?> create(@RequestBody LessonDTO classes){
//		LessonDTO openedClass = lessonService.create(classes);
		return ResponseEntity.status(HttpStatus.CREATED).body("");
	}
	
	// 자동완성 클래스 선택
	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id){
		LessonDTO searchedLessons = lessonService.basicByLessonId(id);
		return ResponseEntity.status(HttpStatus.OK).body(searchedLessons);
	}
	
	// 메인 카테고리
	@GetMapping("/mainCategory")
	public ResponseEntity<?> getMainCategory(){
		List<CategoryDTO> list = lessonService.mainCategory();
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	
	// 서브 카테고리
	@GetMapping("/subCategory")
	public ResponseEntity<?> getSubCategory(){
		List<CategoryDTO> list = lessonService.subCategory();
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	
	// 난이도
	@GetMapping("/lessonLevel")
	public ResponseEntity<?> getLessonLevel(){
		List<CategoryDTO> list = lessonService.lessonLevel();
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	
	@PostMapping("/schedule")
	public ResponseEntity<?> createSchedule(@RequestBody ScheduleDTO schedule){
		int affectedRowCount = lessonService.createSchedule(schedule);
		return ResponseEntity.status(HttpStatus.CREATED).body(affectedRowCount);
	}
	
	@PostMapping("/curriculum")
	public ResponseEntity<?> createCurriculum(@RequestBody List<CurriculumSubjectDTO> curriculumList){
		int affectedRowCount = lessonService.createCurriculum(curriculumList);
		return ResponseEntity.status(HttpStatus.CREATED).body(affectedRowCount);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody LessonDTO classes) {
//		LessonDTO updatedClass = lessonService.updateById(id, classes);
		return ResponseEntity.status(HttpStatus.OK).body("");
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
//		int affectedRowCount = lessonService.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body("ok");
	}
}

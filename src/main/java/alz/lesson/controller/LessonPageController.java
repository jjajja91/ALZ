package alz.lesson.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alz.lesson.domain.LessonRequestDTO;
import alz.lesson.domain.TeacherDTO;
import alz.lesson.service.LessonServiceImpl;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/lesson")
@Log4j
public class LessonPageController {
	
	private LessonServiceImpl lessonService;
	
	@Autowired
	public LessonPageController(LessonServiceImpl lessonService) {
		this.lessonService = lessonService;
	}
	
	@GetMapping("/list")
	public void list(Model model){
		model.addAttribute("list", lessonService.readAll());
	}
	
	// 클래스 상세
	@GetMapping("/read")
	public void get(@RequestParam Long id, Model model) {
		model.addAttribute("lesson", lessonService.readByLessonId(id));
		model.addAttribute("curriculum", lessonService.curriculumByLessonId(id));
		model.addAttribute("teacher", lessonService.teacherByLessonId(id));
		model.addAttribute("quickReview", lessonService.quickReviewByLessonId(id));
	}
	
	// 강사등록
	@PostMapping("/registerTeacher")
	public String registerTeacher(TeacherDTO teacher) {
		if(teacher.getId()==null) {
			teacher = lessonService.createTeacher(teacher);
		} else {
			teacher = lessonService.updateTeacher(teacher);
		}
		return "redirect:/lesson/registerBasic?teacherId="+teacher.getId();
	}

	// 강사등록
	@GetMapping("/register")
	public void register(@RequestParam Long userId, Model model) {
		if(userId!=null) {
			model.addAttribute("teacher", lessonService.teacherByUserId(userId));
		}
	}
	
	// 클래스 개설했던 클래스 가져오기
	@GetMapping("/registerBasic")
	public void registerBasic(@RequestParam Long teacherId, Model model) {
		if(teacherId!=null) {
			model.addAttribute("lessons", lessonService.lessonsByTeacherId(teacherId));
		}
	}

}

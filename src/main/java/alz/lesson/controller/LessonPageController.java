package alz.lesson.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alz.lesson.domain.LessonRequestDTO;
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
	
	@GetMapping("/read")
	public void get(@RequestParam Long id, Model model) {
		model.addAttribute("lessons", lessonService.readById(id));
	}
	
	@PostMapping("/register")
	public String register(LessonRequestDTO request) {
		log.info("register: " + request);
		lessonService.create(request);
		return "redirect:/class/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}

}

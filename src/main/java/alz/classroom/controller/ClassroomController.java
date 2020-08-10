package alz.classroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import alz.classroom.service.ClassroomService;
import alz.lesson.domain.LessonDTO;
import alz.lesson.service.LessonService;
import alz.user.domain.UserDTO;
import alz.user.exceptions.UnauthorizedException;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/classroom")
public class ClassroomController {
	
	private LessonService lessonService;
	private ClassroomService classroomService;
	
	@Autowired
	public ClassroomController(LessonService lessonService, ClassroomService classroomService) {
		this.lessonService = lessonService;
		this.classroomService = classroomService;
	}
	
	public UserDTO getLoginUserInfo() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		UserDTO userInfo = (UserDTO)auth.getPrincipal();
		return userInfo;
	}
	
	
	@GetMapping("/student")
	public void classroom (Long lessonId, Model model) {
		Long userId = getLoginUserInfo().getId();
		if (classroomService.checkStudent(lessonId, userId)) {
			LessonDTO lesson = lessonService.readByLessonId(lessonId);
			model.addAttribute("lesson", lesson);
		} else {
			throw new UnauthorizedException();
		}
	}

}

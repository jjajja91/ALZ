package alz.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import alz.admin.domain.BoardCriteriaAdmin;
import alz.admin.domain.BoardPageDTOAdmin;
import alz.admin.service.LessonServiceAdmin;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/lesson/*")
public class LessonAdminController {
	
	private LessonServiceAdmin lessonService;
	
	@Autowired
	public LessonAdminController(LessonServiceAdmin lessonService) {
		this.lessonService = lessonService;
	}
	
	@GetMapping("/lessonReqList")
	public void lessonReqList(BoardCriteriaAdmin cri, Model model) {
		
		   model.addAttribute("list", lessonService.readAll(cri));
			int total = lessonService.getTotal(cri);
				// 페이징
			model.addAttribute("pageMaker", new BoardPageDTOAdmin(cri, total));
	}
	


}

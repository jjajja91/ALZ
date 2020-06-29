package alz.classes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alz.classes.service.ClassService;

@Controller
@RequestMapping("/class")
public class ClassPageController {
	
	private ClassService classService;
	
	@Autowired
	public ClassPageController(ClassService classService) {
		this.classService = classService;
	}
	
	@GetMapping("/list")
	public void list(Model model){
		model.addAttribute("list", classService.readAll());
	}
	
	@GetMapping("/get")
	public void get(@RequestParam Long id, Model model) {
		model.addAttribute("classes", classService.readById(id));
	}

}

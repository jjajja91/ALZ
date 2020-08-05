package alz.admin.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.admin.service.ClassService;
import alz.admin.service.MemberService;
import alz.admin.service.OrdersService;
import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.BoardPageDTO;
import alz.board.service.BoardService;
import alz.file.domain.BoardFileDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class adminPageController {
 
	private ClassService classService;
	private MemberService memberService;
	private OrdersService orderService;

	@Autowired
	public adminPageController(ClassService classService, MemberService memberService, OrdersService orderService) {
		this.memberService = memberService;
		this.classService = classService;
		this.orderService = orderService;
	}
	
	@GetMapping("/index")
	public void index() {
	}
	
	@GetMapping("/tables")
	public String tables() {
		System.out.println("칙촉");
		return "admin/boardAdmin";
	}
}

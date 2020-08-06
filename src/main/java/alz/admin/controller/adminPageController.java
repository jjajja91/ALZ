package alz.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import alz.admin.domain.AdminBoardCriteria;
import alz.admin.domain.AdminBoardPageDTO;
import alz.admin.service.AdminBoardService;
import alz.admin.service.ClassService;
import alz.admin.service.MemberService;
import alz.admin.service.OrdersService;
import alz.board.domain.BoardDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class adminPageController {
 
	
	private ClassService classService;
	private MemberService memberService;
	private OrdersService orderService;
	private AdminBoardService boardService;

	@Autowired
	public adminPageController(ClassService classService, MemberService memberService, OrdersService orderService, AdminBoardService boardService) {
		this.memberService = memberService;
		this.classService = classService;
		this.orderService = orderService;
		this.boardService = boardService;
	}
	
	@GetMapping("/index")
	public void index() {
	}
	

}

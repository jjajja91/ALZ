package alz.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import alz.admin.domain.BoardCriteriaAdmin;
import alz.admin.domain.BoardPageDTOAdmin;
import alz.admin.service.BoardServiceAdmin;
import lombok.extern.log4j.Log4j;

	@Controller
	@Log4j
	@RequestMapping("/admin/board/*")
	public class BoardAdminController {
	

		private BoardServiceAdmin boardService;

		@Autowired
		public BoardAdminController(BoardServiceAdmin boardService) {
					this.boardService = boardService;
		}

		@GetMapping("/boardAdminList")
		public void boardAdminList(BoardCriteriaAdmin cri, Model model) {
			
			   model.addAttribute("list", boardService.readAll(cri));
				int total = boardService.getTotal(cri);
					// 페이징
				model.addAttribute("pageMaker", new BoardPageDTOAdmin(cri, total));
		}
		

	}



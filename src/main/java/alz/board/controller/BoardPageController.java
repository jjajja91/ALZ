package alz.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.board.domain.BoardDTO;
import alz.board.domain.Criteria;
import alz.board.domain.PageDTO;
import alz.board.service.BoardService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardPageController {
 
	private BoardService boardService;
	
	@Autowired
	public BoardPageController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list :" +cri);
		
		model.addAttribute("list", boardService.readAll(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,123));
	}
	
	@GetMapping("/write")
	public void write() {
		
	}
	
	@PostMapping("/write")
	public String write(BoardDTO board, RedirectAttributes rttr) {
		
		log.info("write: " + board);
		
		boardService.create(board);
		
		rttr.addFlashAttribute("result", board.getId());
		
		return "redirect:/board/list";
	}
}

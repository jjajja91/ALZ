package alz.myPage.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;
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

import alz.board.domain.BoardDTO;
import alz.board.exceptions.NoUserException;
import alz.file.domain.BoardFileDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.myPage.domain.MyPagePageDTO;
import alz.myPage.service.MyPageService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage/*")
public class MyPagePageController {

	private MyPageService MyPageService;

	@Autowired
	public MyPagePageController(MyPageService MyPageService) {
		this.MyPageService = MyPageService;
	}

//	@GetMapping("/list")
//	public void list(Model model) {
//		System.out.println("들어와?");
//		model.addAttribute("list", MyPageService.readAll());
//	}

	@PostMapping("/delete")
	public String delete(@RequestParam("id") Long id, @ModelAttribute("cri") MyPageCriteria cri,
			RedirectAttributes rttr) {
		List<BoardFileDTO> fileList = MyPageService.getFileList(id);
		BoardDTO board = MyPageService.readById(id);
		if (MyPageService.deleteById(id) == 1) {
			deleteFiles(fileList);
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/board/list?typeId=" + board.getTypeId();
	}

	@PostMapping("/update")
	public String update(@Valid BoardDTO board, @ModelAttribute("cri") MyPageCriteria cri, RedirectAttributes rttr,
			BindingResult result) {

		MyPageService.update(board.getId(), board);

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
//		}
		return "redirect:/board/list";
	}

	@GetMapping({ "/read", "/update" })
	public void read(@RequestParam("id") Long id, @ModelAttribute("cri") MyPageCriteria cri, Model model) {
		log.info("/read or update");

		model.addAttribute("board", MyPageService.readById(id));
	}

	@GetMapping("/list")
	public void list(@RequestParam("writerId") Long writerId, MyPageCriteria cri, Model model) {
		cri.setWriterId(writerId);
		model.addAttribute("list", MyPageService.readAll(cri));
        int total = MyPageService.getTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}

	@GetMapping("/write")
	public void write(@RequestParam("typeId") Integer typeId, Model model, HttpSession session) {
		if (session.getAttribute("sessionUser") == null) {
			throw new NoUserException();
		}
		model.addAttribute("typeId", typeId);
	}

	private void deleteFiles(List<BoardFileDTO> fileList) {

		if (fileList == null || fileList.size() == 0) {
			return;
		}
		log.info("delete board files.................");
		log.info(fileList);

		fileList.forEach(file -> {
			try {
				Path files = Paths
						.get("C:\\upload\\" + file.getUploadPath() + "\\" + file.getUuid() + "_" + file.getFileName());
				Files.deleteIfExists(files);
				if (Files.probeContentType(files).startsWith("image")) {
					Path thumbNail = Paths.get(
							"C:\\upload\\" + file.getUploadPath() + "\\s_" + file.getUuid() + "_" + file.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
}

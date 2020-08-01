package alz.myPage.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.board.exceptions.NoUserException;
import alz.file.domain.BoardFileDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.myPage.domain.MyPagePageDTO;
import alz.myPage.service.MyPageService;
import alz.user.domain.UserDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage/*")
public class MyPagePageController {

	private MyPageService MyPageService;
	private PasswordEncoder passwordEncoder;

	@Autowired
	public MyPagePageController(MyPageService MyPageService, PasswordEncoder passwordEncoder) {
		this.MyPageService = MyPageService;
		this.passwordEncoder = passwordEncoder;
	}
	
	//회원 탈퇴
	@PostMapping("/deleteAcc")
	public String delete(UserDTO user, RedirectAttributes attr) {
		String result ="";
	    if (MyPageService.selectById(user)) {	
	    	 int deleteAcc = MyPageService.DeleteAcc(user.getId());
	    		 if(deleteAcc != 0) {
	 				result = "redirect:/logout";
	    		 } 
	    		
			}  else {
			attr.addAttribute("verify", "no");
			result = "redirect:/myPage/deleteAccResult";
			}
		return result;
	}

	@PostMapping("/modifyAcc")
	public String modifyAcc(UserDTO user, RedirectAttributes attr) {
		String result ="";
	     if (MyPageService.selectById(user)) {	
	    	 	result = "redirect:/modify";
			}  else {
			attr.addAttribute("verify", "no");
			result = "redirect:/myPage/modifyAccResult";
			}
		return result;
	}
	
	@GetMapping("/boardList")
	public void boardList(@RequestParam("writerId") Long writerId, MyPageCriteria cri, Model model) {
		cri.setWriterId(writerId);
		model.addAttribute("list", MyPageService.readAll(cri));
        int total = MyPageService.getTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}

	@GetMapping("/commentList")
	public void commentList(@RequestParam("writerId") Long writerId, MyPageCriteria cri, Model model) {
		cri.setWriterId(writerId);
		model.addAttribute("list", MyPageService.commentReadAll(cri));
        int total = MyPageService.getTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}
	
	@GetMapping("/likeList")
	public void likeList(@RequestParam("writerId") Long writerId, MyPageCriteria cri, Model model) {
		cri.setWriterId(writerId);
		model.addAttribute("list", MyPageService.likeReadAll(cri));
        int total = MyPageService.getTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}
	
	 @GetMapping("/deleteAcc")
	 public String deleteAcc() {

	  return "/myPage/deleteAccount";
	}
	 
	 @GetMapping("/modifyAcc")
	 public String modifyAcc() {

	  return "/myPage/pwdChk";
	}
	 
	 @GetMapping(value = "/deleteAccResult")
	 public String deleteAccResult(@RequestParam String verify) {
	
	  return "myPage/deleteAccount";
	}

	 @GetMapping(value = "/modifyAccResult")
	 public String modifyAccResult(@RequestParam String verify) {
		 
	  return "myPage/pwdChk";
	}
}

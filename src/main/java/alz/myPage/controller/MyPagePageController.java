package alz.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.lesson.domain.LessonDTO;
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
	
	public UserDTO getLoginUserInfo() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		UserDTO userInfo = (UserDTO)auth.getPrincipal();
		return userInfo;
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
	
	//내 정보 수정
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
	
	//진행중인 내 클래스
	@GetMapping(value = "/activeLesson")
	public String activeLession(MyPageCriteria cri, Model model) {
		cri.setId(getLoginUserInfo().getId());
		model.addAttribute("list", MyPageService.myLessonList(cri));
        int total = MyPageService.getTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));		
		return "myPage/myLessonList";
	}
	
	//완료된 내 클래스
		@GetMapping(value = "/finishedLesson")
		public String finishedLesson(MyPageCriteria cri, Model model) {
			cri.setId(getLoginUserInfo().getId());
			model.addAttribute("list", MyPageService.finishedLessonList(cri));
	        int total = MyPageService.getTotal(cri);
			model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
			return "myPage/finishedLessonList";
		}
	
		//환불된 클래스
		@GetMapping(value = "/refundedLesson")
		public String refundedLesson(MyPageCriteria cri, Model model) {
			cri.setId(getLoginUserInfo().getId());
			model.addAttribute("list", MyPageService.refundedLesson(cri));
	        int total = MyPageService.getTotal(cri);
			model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
			return "myPage/refundedList";
		}

	//내 게시물
	@GetMapping("/boardList")
	public void boardList(MyPageCriteria cri, Model model) {
		cri.setId(getLoginUserInfo().getId());
		model.addAttribute("list", MyPageService.readAll(cri));
        int total = MyPageService.getTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}

	//내 댓글
	@GetMapping("/commentList")
	public void commentList(MyPageCriteria cri, Model model) {
		cri.setId(getLoginUserInfo().getId());
		model.addAttribute("list", MyPageService.commentReadAll(cri));
        int total = MyPageService.getTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}
	
	//내 좋아요
	@GetMapping("/likeList")
	public void likeList(MyPageCriteria cri, Model model) {
		cri.setId(getLoginUserInfo().getId());
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

package alz.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.board.domain.CommentDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.myPage.domain.MyPagePageDTO;
import alz.myPage.service.MyPageService;
import alz.order.domain.MerchandiseCriteria;
import alz.order.domain.MerchandisePageDTO;
import alz.order.service.MerchandiseService;
import alz.user.domain.UserDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage/*")
public class MyPagePageController {

	private MyPageService myPageService;
	private MerchandiseService merchandiseService ;

	@Autowired
	public MyPagePageController(MyPageService myPageService, MerchandiseService merchandiseService) {
		this.myPageService = myPageService;
		this.merchandiseService = merchandiseService;
	}
	
	// 로그인한 유저 정보 가져오기
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
		user.setId(getLoginUserInfo().getId());
		System.out.println(user);
	    if (myPageService.selectById(user)) {	
	    	 int deleteAcc = myPageService.deleteAcc(user);
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
	     if (myPageService.selectById(user)) {	
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
		model.addAttribute("list", myPageService.myLessonList(cri));
        int total = myPageService.getActiveLessonTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));		
		return "myPage/myLessonList";
	}
	
		//완료된 내 클래스
		@GetMapping(value = "/finishedLesson")
		public String finishedLesson(MyPageCriteria cri, Model model) {
			cri.setId(getLoginUserInfo().getId());
			model.addAttribute("list", myPageService.finishedLessonList(cri));
	        int total = myPageService.getFinishedLessonTotal(cri);
			model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
			return "myPage/finishedLessonList";
		}
		
//		// 강의중인 클래스
//		@GetMapping(value = "/teachingLesson")
//		public String teachingLesson(MyPageCriteria cri, Model model) {
//			cri.setId(getLoginUserInfo().getId());
//			model.addAttribute("list", myPageService.teachingLessonList(cri));
//	        int total = myPageService.getTeachingLessonTotal(cri);
//			model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
//			return "myPage/finishedLessonList";
//		}
//		
//		// 강의했던 클래스
//		@GetMapping(value = "/teachedLesson")
//		public String teachedLesson(MyPageCriteria cri, Model model) {
//			cri.setId(getLoginUserInfo().getId());
//			model.addAttribute("list", myPageService.teachedLessonList(cri));
//	        int total = myPageService.getTeachedLessonTotal(cri);
//			model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
//			return "myPage/finishedLessonList";
//		}
	
		//환불된 클래스
		@GetMapping(value = "/refundedLesson")
		public String refundedLesson(MyPageCriteria cri, Model model) {
			cri.setId(getLoginUserInfo().getId());
			model.addAttribute("list", myPageService.refundedLesson(cri));
	        int total = myPageService.getRefundedLessonTotal(cri);
			model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
			return "myPage/refundedList";
		}

	//내 게시물
	@GetMapping("/boardList")
	public void boardList(MyPageCriteria cri, Model model) {
		cri.setId(getLoginUserInfo().getId());
		model.addAttribute("list", myPageService.readAll(cri));
		Long total = myPageService.getMyBoardTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}

	//내 댓글
	@GetMapping("/commentList")
	public void commentList(MyPageCriteria cri, Model model) {
		cri.setId(getLoginUserInfo().getId());
	    model.addAttribute("list", myPageService.getMyCommentList(cri));
		Long total = myPageService.getMyCommentTotal(cri);
		model.addAttribute("pageMaker", new MyPagePageDTO(cri, total));
	}
	
	//내 좋아요
	@GetMapping("/likeList")
	public void likeList(MyPageCriteria cri, Model model) {
		cri.setId(getLoginUserInfo().getId());
		model.addAttribute("list", myPageService.getMyLikeList(cri));
		Long total = myPageService.getMyLikeTotal(cri);
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

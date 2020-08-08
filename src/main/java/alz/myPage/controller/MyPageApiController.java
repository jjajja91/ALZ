package alz.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import alz.board.domain.BoardDTO;
import alz.board.domain.CommentDTO;
import alz.lesson.domain.LessonDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.myPage.service.MyPageService;
import alz.user.domain.UserDTO;

@RestController
@RequestMapping("/myPages")
public class MyPageApiController {

		private MyPageService myPageService;

	@Autowired
	public MyPageApiController(MyPageService myPageService) {
		this.myPageService = myPageService;
	}
	
	
	public UserDTO getLoginUserInfo() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		UserDTO userInfo = (UserDTO)auth.getPrincipal();
		return userInfo;
	}
	
	// 검색 결과 글목록
	@GetMapping(value = "/{pageNum}/{amount}" , produces =MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<?> boardList(@PathVariable Integer pageNum, @PathVariable Integer amount) 
	{		System.out.println("여기 들어옴?");
	MyPageCriteria cri = new MyPageCriteria();
			cri.setId(getLoginUserInfo().getId()).setPageNum(pageNum).setAmount(amount);
			List<LessonDTO> list = myPageService.myLessonList(cri);

			return ResponseEntity.status(HttpStatus.OK).body(list);
		}
	
	@GetMapping(value = "/commentList/{pageNum}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> myCommentList(@PathVariable Integer pageNum){
		System.out.println("이거임?");
		MyPageCriteria cri = new MyPageCriteria(pageNum, 10, getLoginUserInfo().getId());
		List<CommentDTO> commentList = myPageService.getMyCommentList(cri);
		return ResponseEntity.status(HttpStatus.OK).body(commentList);
	}

	@GetMapping(value = "/likeList/{pageNum}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> mylikeList(@PathVariable Integer pageNum){
		MyPageCriteria cri = new MyPageCriteria(pageNum, 10, getLoginUserInfo().getId());
		List<BoardDTO> likeList = myPageService.getMyLikeList(cri);
		return ResponseEntity.status(HttpStatus.OK).body(likeList);
	}

	// 글 수 카운트
//	@GetMapping(value = { "typeId/{typeId}/type/{type}/keyword/{keyword}", "typeId/{typeId}/type/{type}" }, produces = {
//			MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public int totalNumber(@PathVariable String type, @PathVariable Integer typeId,
//			@PathVariable(name = "keyword", required = false) String keyword) {
//			BoardCriteria cri = new BoardCriteria();
//
//		if (keyword != null) {
//			cri.setKeyword(keyword).setType(type).setTypeId(typeId);
//		}
//
//		int total = boardService.getTotal(cri);
//
//		return total;
//	}




}

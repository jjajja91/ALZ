package alz.myPage.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import alz.board.domain.BoardCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.LikeDTO;
import alz.board.exceptions.TemporaryServerException;
import alz.board.exceptions.UnsatisfiedContentException;
import alz.board.service.BoardService;
import alz.file.domain.BoardFileDTO;
import alz.lesson.domain.LessonDTO;
import alz.myPage.domain.MyPageCriteria;
import alz.myPage.service.MyPageService;
import alz.user.domain.UserDTO;

@RestController
@RequestMapping("/myPage")
public class MyPageApiController {

		private MyPageService MyPageService;

	@Autowired
	public MyPageApiController(MyPageService MyPageService) {
		this.MyPageService = MyPageService;
	}
	
	
	public UserDTO getLoginUserInfo() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		UserDTO userInfo = (UserDTO)auth.getPrincipal();
		return userInfo;
	}
	
	// 검색 결과 글목록
	@GetMapping(value = {"/{pageNum}/{amount}" }, produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<?> boardList(@PathVariable Integer pageNum, @PathVariable Integer amount) 
	{		System.out.println("여기 들어옴?");
	MyPageCriteria cri = new MyPageCriteria();
			cri.setId(getLoginUserInfo().getId()).setPageNum(pageNum).setAmount(amount);
			List<LessonDTO> list = MyPageService.myLessonList(cri);

			return ResponseEntity.status(HttpStatus.OK).body(list);
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

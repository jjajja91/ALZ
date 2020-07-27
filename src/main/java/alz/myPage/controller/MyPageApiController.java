package alz.myPage.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

import alz.myPage.domain.MyPageCriteria;
import alz.board.domain.BoardDTO;
import alz.board.domain.LikeDTO;
import alz.board.exceptions.TemporaryServerException;
import alz.board.exceptions.UnsatisfiedContentException;
import alz.myPage.service.MyPageService;
import alz.file.domain.BoardFileDTO;

@RestController
@RequestMapping("/myPage")
public class MyPageApiController {

	private MyPageService MyPageService;

	@Autowired
	public MyPageApiController(MyPageService MyPageService) {
		this.MyPageService = MyPageService;
	}
	
	// 댓글 수
	/*
	 * @GetMapping(value = "/comments/{id}", produces =
	 * MediaType.APPLICATION_JSON_VALUE) public ResponseEntity<?>
	 * countComments(@PathVariable Long id){ Long commentsCnt =
	 * MyPageService.getCommentsCnt(id); return
	 * ResponseEntity.status(HttpStatus.OK).body(commentsCnt); }
	 */
	/*
	 * @GetMapping(value = "/getFileList", produces =
	 * MediaType.APPLICATION_JSON_UTF8_VALUE) public
	 * ResponseEntity<List<BoardFileDTO>> getFileList(Long boardId) {
	 * List<BoardFileDTO> boardFiles = MyPageService.getFileList(boardId); return
	 * ResponseEntity.status(HttpStatus.OK).body(boardFiles); }
	 */
	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> create(@RequestBody @Valid BoardDTO board, BindingResult result) {
		if (result.hasErrors()) {
			FieldError error = result.getFieldError();
			if (result.getFieldError().getCode().indexOf("NotNull") != -1)
				throw new TemporaryServerException(error);
			else
				throw new UnsatisfiedContentException(error);
		} else {
			MyPageService.create(board);
		}
		return ResponseEntity.status(HttpStatus.CREATED).body(board);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id) {
		BoardDTO searchedBoard = MyPageService.readById(id);
		return ResponseEntity.status(HttpStatus.OK).body(searchedBoard);
	}

	@GetMapping
	public ResponseEntity<?> readAll() {
		List<BoardDTO> boards = MyPageService.readAll();
		return ResponseEntity.status(HttpStatus.OK).body(boards);
	}

	// 검색 결과 글목록
	@GetMapping(value = {"{writerId}/{pageNum}/{amount}"}, produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<?> searchList( @PathVariable Integer writerId, @PathVariable Integer pageNum,	@PathVariable Integer amount) {
		System.out.println("들어는 오니?");
		MyPageCriteria cri = new MyPageCriteria();
		cri.setPageNum(pageNum).setAmount(amount).setWriterId(writerId);
		List<BoardDTO> boards = MyPageService.readAll(cri);

		return ResponseEntity.status(HttpStatus.OK).body(boards);
	}

	// 글 수 카운트
	
	/*
	 * @GetMapping(value = { "typeId/{typeId}/type/{type}/keyword/{keyword}",
	 * "writerId/{writerId}/type/{type}" }, produces = {
	 * MediaType.APPLICATION_JSON_UTF8_VALUE }) public int totalNumber(@PathVariable
	 * String type, @PathVariable Integer writerId,
	 * 
	 * @PathVariable(name = "keyword", required = false) String keyword) {
	 * MyPageCriteria cri = new MyPageCriteria();
	 * 
	 * 
	 * int total = MyPageService.getTotal(cri);
	 * 
	 * return total; }
	 */
	 

	@PutMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody @Valid BoardDTO board,
			BindingResult result) {

		if (result.hasErrors()) {
			FieldError error = result.getFieldError();
			if (result.getFieldError().getCode().indexOf("NotNull") != -1)
				throw new TemporaryServerException(error);
			else
				throw new UnsatisfiedContentException(error);
		} else {
			BoardDTO updatedBoard = MyPageService.updateById(id, board);
			return ResponseEntity.status(HttpStatus.OK).body(updatedBoard);
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = MyPageService.deleteById(id);
		return ResponseEntity.status(HttpStatus.OK).body("ok");
	}
	
	// 좋아요 관련
	
	// 좋아요 수
	@GetMapping(value = "/like/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> countLike(@PathVariable Long id){
		Long likeCnt = MyPageService.getLikeCnt(id);
		return ResponseEntity.status(HttpStatus.OK).body(likeCnt);
	}
	
	// 좋아요 생성
	@PostMapping("/like")
	public ResponseEntity<?> addLike(@RequestBody LikeDTO like) {
		MyPageService.addLike(like);
		return ResponseEntity.status(HttpStatus.OK).body("좋아요");
	}
	
	// 좋아요 해제
	@DeleteMapping(value = "/like/{userId}/{boardId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> removeLike(@PathVariable Long userId, @PathVariable Long boardId){
		LikeDTO likeDTO = new LikeDTO();
		likeDTO.setUserId(userId).setBoardId(boardId);
		boolean isRemoved = MyPageService.removeLike(likeDTO);
		return ResponseEntity.status(HttpStatus.OK).body(isRemoved);
	}
	
	// 좋아요 여부 확인
	@GetMapping(value = "/like/{userId}/{boardId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> isLike(@PathVariable Long userId, @PathVariable Long boardId){
		LikeDTO likeDTO = new LikeDTO();
		likeDTO.setUserId(userId).setBoardId(boardId);
		boolean isLike = MyPageService.isLike(likeDTO);
		return ResponseEntity.status(HttpStatus.OK).body(isLike);
	}

}

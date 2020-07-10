//package alz.user.controller;
//
//import java.text.DateFormat;
//import java.util.Date;
//import java.util.Locale;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import alz.user.domain.UserDTO;
//import alz.user.service.UserService;
//
//
//@RestController
//@RequestMapping("/users")
//public class UserApiController {
//
//	private UserService userService;
//
//	@Autowired
//	public UserApiController(UserService userService) {
//		this.userService = userService;
//	}
//
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String index() {
//		return "/portal/main";
//	}
//
//	@ModelAttribute("path")
//	public String getContextPath(HttpServletRequest request) {
//		return request.getContextPath();
////		/login 을 출력합니다
//	}
//
//	@ModelAttribute("serverTime")
//	public String getServerTime(Locale locale) {
//
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//
//		return dateFormat.format(date);
//	}
//
//	@RequestMapping(value = "/callJoin", method = RequestMethod.GET)
//	public String callJoin() {
//		return "user/anonymous/join";
//	}
//	
//	@RequestMapping(value = "/callLogin", method = RequestMethod.GET)
//	public String calllogin(HttpServletRequest request) {
//		return "user/users/login";
//	}
//	
//	@RequestMapping(value = "/callModify", method = RequestMethod.GET)
//	public ModelAndView callUpdate(HttpServletRequest request) {
//
//		HttpSession session = request.getSession();
//		UserDTO user = (UserDTO)session.getAttribute("sessionUser");
//
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("sessionUser", userService.readById(user));
//
//		mv.setViewName("/user/users/Modify");
//
//		return mv;
//	}
//	
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String callLogout(UserDTO user, HttpSession session) {
//
//		session.invalidate();
//
//		return "user/users/logout";
//	}
//	
//	/*----------------------------------------------------------------------------------------*/
//	@RequestMapping(value = "/create", method = RequestMethod.POST)
//	public String Insert(HttpServletRequest request, UserDTO user) {
//		
//		userService.create(user);
//		
//		return "user/anonymous/joinInfo";
//	}
//	
//	@RequestMapping(value = "/updateById", method = RequestMethod.POST)
//	public ModelAndView Modify(HttpServletRequest request, UserDTO user) {
//		
//		ModelAndView mv = new ModelAndView();
//		HttpSession session = request.getSession();
//		
//		UserDTO dto = userService.updateById(user);
//		
//		if(dto == null) {
//			mv.setViewName("/user/users/Modify");
//		} else { 
//			session.setAttribute("sessionUser", dto);
//			mv.setViewName("/user/users/ModifyInfo");
//		}
//		
//		return mv;
//	}
//	
//	@RequestMapping(value = "/deleteById", method = RequestMethod.GET)
//	public String Delete(HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		UserDTO user = (UserDTO) session.getAttribute("sessionUser");
//		
//		userService.deleteById(user);
//		session.invalidate();
//		
//		return "user/users/logout";
//	}
//	
//	@RequestMapping(value="/login",method=RequestMethod.POST)
//	public String login(UserDTO user, HttpSession session) {
//		
//		UserDTO dto = userService.readById(user);
//		session.setAttribute("sessionUser", dto);
//		
////		if(mem == null) {
////			return "identity/user/login";
////		}
//		
//		return "user/users/loggedInfo";
//	}
//	/*---------------------------------------------------------------------------------------*/
//	@PostMapping
//	public ResponseEntity<?> create(@RequestBody UserDTO user) {
//		UserDTO openedUser = userService.create(user);
//		return ResponseEntity.status(HttpStatus.CREATED).body(openedUser);
//	}
//
//	@GetMapping("/{id}")
//	public ResponseEntity<?> readOne(@PathVariable String email) {
//		UserDTO selectByEmail = userService.readByEmail(email);
//		return ResponseEntity.status(HttpStatus.OK).body(selectByEmail);
//	}
//	
//	@GetMapping
//	public ResponseEntity<?> readAll() {
//		List<UserDTO> user = userService.readAll();
//		return ResponseEntity.status(HttpStatus.OK).body(user);
//	}
//
//	@PutMapping("/{id}")
//	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody UserDTO user) {
//		UserDTO updatedUser = userService.updateById(id, user);
//		return ResponseEntity.status(HttpStatus.OK).body(updatedUser);
//	}
//
//	@DeleteMapping("/{id}")
//	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
//		int affectedRowCount = userService.deleteById(id);
//		return ResponseEntity.status(HttpStatus.OK).body("ok");
//	}
//}

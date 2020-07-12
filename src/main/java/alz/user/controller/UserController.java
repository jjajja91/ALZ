package alz.user.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import alz.user.domain.UserDTO;
import alz.user.exceptions.TemporaryServerException;
import alz.user.exceptions.UnsatisfiedContentException;
import alz.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
//	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
//	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String login(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String index() {
//		return "home";
//	}
	
	@ModelAttribute("path")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
//		/login 을 출력합니다
	}
	
	@ModelAttribute("serverTime")
	public String getServerTime(Locale locale) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		return dateFormat.format(date);
	}

	@RequestMapping(value = "/callJoin", method = RequestMethod.GET)
	public String callJoin() {
		return "user/anonymous/join";
	}
	
	@RequestMapping(value = "/callLogin", method = RequestMethod.GET)
	public String calllogin(HttpServletRequest request) {
		return "user/users/login";
	}
	
	@RequestMapping(value = "/callModify", method = RequestMethod.GET)
	public ModelAndView callUpdate(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("sessionUser");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("sessionUser", userService.readById(user));
		
		mv.setViewName("/user/users/Modify");
		
		return mv;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String callLogout(UserDTO user, HttpSession session) {

		session.invalidate();

		return "user/users/logout";
	}
	
	/*----------------------------------------------------------------------------------------*/	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Insert(@RequestBody @Valid @ModelAttribute UserDTO user, Model model, BindingResult result, HttpSession session, HttpServletRequest request) {
		UserDTO dto = userService.readById(user);
		
		if (dto != null) {
//			model.addAttribute("message", "같은 아이디가 있습니다.");
			System.out.println("같은 회원 정보가 있습니다.");
			return "user/anonymous/join";
		}
		
		userService.create(user);
		model.addAttribute("email", request.getParameter("email"));
		model.addAttribute("nickname", request.getParameter("nickname"));
		model.addAttribute("password", request.getParameter("password"));
		
		return "user/anonymous/joinInfo";
	}
	
	@RequestMapping(value = "/updateById", method = RequestMethod.POST)
	public ModelAndView Modify(@RequestBody @Valid UserDTO user, BindingResult result, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		UserDTO dto = userService.updateById(user);
		
		if(dto == null) {
			mv.setViewName("/user/users/Modify");
		} else { 
			session.setAttribute("sessionUser", dto);
			mv.setViewName("/user/users/ModifyInfo");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/deleteById", method = RequestMethod.GET)
	public String Delete(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("sessionUser");
		
		userService.deleteById(user, request);
		session.invalidate();
		
		return "user/users/logout";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestBody @ModelAttribute UserDTO user, Model model, HttpServletRequest request, HttpSession session) {
		
		UserDTO dto = userService.readById(user);
		session.setAttribute("sessionUser", dto);
		
		userService.readById(user);
		model.addAttribute("email", request.getParameter("email"));
		
		if(dto == null) {
			System.out.println("로그인 정보가 틀렸습니다.");
			return "user/users/login";
		}
		
		return "user/users/loggedInfo";
	}
}

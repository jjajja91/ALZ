package alz.user.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import alz.user.domain.UserDTO;
import alz.user.service.UserService;
import alz.user.sms.Coolsms;

@Controller
public class UserController {
   
   @Autowired
   UserService userService;
   
   @ModelAttribute("path")
   public String getContextPath(HttpServletRequest request) {
      return request.getContextPath();
//      /login 을 출력합니다
   }
   
   @ModelAttribute("serverTime")
   public String getServerTime(Locale locale) {

      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

      return dateFormat.format(date);
   }
   
   
   
   @RequestMapping(value = "/callSMS", method = RequestMethod.GET)
   public String callSMS() {
	   return "user/anonymous/SMS";
   }

   //문자를 보낼때 맵핑되는 메소드
   @RequestMapping(value = "/sendSms.do")
	 public String sendSms(HttpServletRequest request) throws Exception {
	
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ api키 넣기
	   String api_key = ""; //위에서 받은 api key를 추가
	   String api_secret = "";  //위에서 받은 api secret를 추가
	
	   Coolsms coolsms = new Coolsms(api_key, api_secret);
	   //이 부분은 홈페이지에서 받은 자바파일을 추가한다음 그 클래스를 import해야 쓸 수 있는 클래스이다.
	   
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@번호 넣기
	   HashMap<String, String> set = new HashMap<String, String>();
	   set.put("to", ""); // 수신번호
	
	   set.put("from", (String)request.getParameter("from")); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
	   set.put("text", (String)request.getParameter("text")); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
	   set.put("type", "sms"); // 문자 타입
	
	   System.out.println(set);
	
	   JSONObject result = coolsms.send(set); // 보내기&전송결과받기
	
	   if ((boolean)result.get("status") == true) {
	
	 // 메시지 보내기 성공 및 전송결과 출력
	 System.out.println("성공");
	 System.out.println(result.get("group_id")); // 그룹아이디
	 System.out.println(result.get("result_code")); // 결과코드
	 System.out.println(result.get("result_message")); // 결과 메시지
	 System.out.println(result.get("success_count")); // 메시지아이디
	 System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	   } else {
	
	     // 메시지 보내기 실패
	 System.out.println("실패");
	 System.out.println(result.get("code")); // REST API 에러코드
	 System.out.println(result.get("message")); // 에러메시지
	   }
	
	   return "/user/anonymous/Success"; //문자 메시지 발송 성공했을때 number페이지로 이동함
	 }

   @RequestMapping(value = "/callFindId", method = RequestMethod.GET)
   public String callFindId() {
	   return "user/users/findId";
   }
   
   @RequestMapping(value = "/callFindpw", method = RequestMethod.GET)
   public String callFindpw() {
	   return "user/users/findpw";
   }
   @RequestMapping(value = "/callMypage", method = RequestMethod.GET)
   public String callMypage() {
	   return "/myPage";
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
   
 //아이디 찾기 로직
   @RequestMapping(value = "/findId", method = RequestMethod.POST)
   public String findIdAction(UserDTO user, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
      
      UserDTO dto = userService.findId(user, response);
//      session.setAttribute("sessionUser", dto);

      if (dto == null) {
         System.out.println("일치하는 회원 정보가 없습니다.");
         return "user/users/findId";
      }
      model.addAttribute("email", request.getParameter("email"));
      return "user/users/findIdAfter";
   }
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/anonymous/join";
	}

//   @RequestMapping(value = "/findId", method = RequestMethod.POST)
//	public String findIdAction(HttpServletResponse response, UserDTO user, HttpServletRequest request, Model model) throws Exception{
//	   UserDTO nickname = userService.findId(user);
//	   
//	   if (nickname == null) {
//		   System.out.println("일치하는 회원 정보가 없습니다.");
//		   return "user/users/findId";
//	   }
//	   model.addAttribute("email", userService.findId(user));
//	   model.addAttribute("email", request.getParameter("email"));
//	   userService.findId(user);
//	   return "user/users/findIdAfter";
//	}
   
   	//비밀번호 찾기 로직
   	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
   	public ModelAndView findPasswordAction(HttpServletRequest request, HttpServletResponse response, UserDTO user) throws Exception {
	
   		ModelAndView mv = new ModelAndView();
   		HttpSession session = request.getSession();
   		UserDTO dto = userService.findpw(user);

   		if (dto == null) {
   			mv.setViewName("/user/users/findpw");
   		} else { 
   			mv.setViewName("/user/users/findpwAfter");
   		}
   		mv.addObject("password", request.getParameter("password"));
//	   String referer = (String)request.getHeader("REFERER");
   		return mv;
	}

	// 회원가입 페이지에서 버튼을 누르면 @RequestMapping을 찾아 실행한다.
	// Form의 값들은 HttpServletRequest에 담겨서 넘어온다.
	// Controller에서 받은 Param 값들은 Model에 담아 다시 View 페이지로 전달할 수 있습니다. Model은 데이터만 담는다
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Insert(UserDTO user, HttpServletRequest request, Model model) {

		model.addAttribute("email", request.getParameter("email"));
		model.addAttribute("nickname", request.getParameter("nickname"));
		model.addAttribute("phoneNumber", request.getParameter("phoneNumber"));

		// 회원가입 메서드
		user.setRole("USER");
		userService.create(user);

		return "user/anonymous/joinInfo";
	}

	// ModelAndView는 스프링에서 제공하는 자체 객체로서 데이터랑 view의 이름을 같이 전달함.
	// login시 session.setAttribute 했던 값을 getAttribute( "저장했던 값" )을 통해 호출 할 수 있음
	@RequestMapping(value = "/updateById", method = RequestMethod.POST)
	public ModelAndView Modify(HttpServletRequest request, UserDTO user) {

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		UserDTO dto = userService.updateById(user);

		if (dto == null) {
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

	@GetMapping("/login")
	public String login() {
		return "user/users/login";
	}
	
//	@GetMapping("/async-handler")
//	@ResponseBody
//	public Callable<String> asyncHandler() {
//		SecurityLogger.log("MVC");
//		return () -> {
//				SecurityLogger.log("Callable");
//				return "Async Handler";
//		};
//	}
//
//	@GetMapping("/async-service")
//	@ResponseBody
//	public String asyncService() {
//		SecurityLogger.log("MVC, before async service");
//		userService.asyncService();
//		SecurityLogger.log("MVC, after async service");
//		return "Async Service";
//	}

//   //로그인 시 session.setAttribute( "세션 호출 명", 세션에 담을 값 ); 
//   @RequestMapping(value = "/login", method = RequestMethod.POST)
//   public String login(UserDTO user, HttpSession session, HttpServletRequest request) {
//
//      UserDTO dto = userService.readById(user);
//      session.setAttribute("sessionUser", dto);
//
//      if (dto == null) {
//         System.out.println("로그인 정보가 틀렸습니다.");
//         return "user/users/login";
//      }
//
//	      String referer = (String)request.getHeader("REFERER");
//	      
//      return "user/users/loggedInfo";
//   }

}
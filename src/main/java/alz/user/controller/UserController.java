package alz.user.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

   // 문자를 보낼때 맵핑되는 메소드
   @RequestMapping(value = "/sendSms")
   public String sendSms(HttpServletRequest request) throws Exception {

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ api키 넣기
      String api_key = ""; // 위에서 받은 api key를 추가
      String api_secret = ""; // 위에서 받은 api secret를 추가

      Coolsms coolsms = new Coolsms(api_key, api_secret);
      // 이 부분은 홈페이지에서 받은 자바파일을 추가한다음 그 클래스를 import해야 쓸 수 있는 클래스이다.

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@번호 넣기
      HashMap<String, String> set = new HashMap<String, String>();
      set.put("to", ""); // 수신번호

      set.put("from", (String) request.getParameter("from")); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
      set.put("text", (String) request.getParameter("text")); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
      set.put("type", "sms"); // 문자 타입

      System.out.println(set);

      JSONObject result = coolsms.send(set); // 보내기&전송결과받기

      if ((boolean) result.get("status") == true) {

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

      return "/user/anonymous/Success"; // 문자 메시지 발송 성공했을때 number페이지로 이동함
   }

   @GetMapping("/login")
   public String login() {
      return "user/users/login";
   }
   
   @RequestMapping(value = "/callMypage", method = RequestMethod.GET)
   public String callMypage() {
      return "/myPage";
   }

   @GetMapping("/modify")
   public String callUpdate() {

      return "/user/users/Modify";
   }
   
   @RequestMapping(value = "/find_id_form")
	public String find_id_form() throws Exception {
		return "/user/users/find_id_form";
	}


   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String join() {
      return "user/anonymous/join";
   }

//위에는 페이지로 보내주는
//------------------------------------------------------------------
//아래는 로직
   
   // 아이디 찾기 로직
   @RequestMapping(value = "/find_id", method = RequestMethod.POST)
   public String find_id(@RequestParam("nickname") String nickname,  @Param("phoneNumber") String phoneNumber, HttpServletResponse response, Model md)
		   throws Exception {
	   
	   if (nickname == null && phoneNumber == null) {
		   System.out.println("일치하는 회원 정보가 없습니다.");
		   return "user/users/find_id_form";
	   }
	   md.addAttribute("email", userService.find_id(nickname, phoneNumber, response));
	   return "user/users/find_id";
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
      user.setRole("ROLE_USER");
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
   
   @GetMapping("/socialJoin")
   public String socialJoin(String email, String id, Model model) {
	   model.addAttribute("email", email);
	   model.addAttribute("id", id);
	   return "user/anonymous/socialJoin";
   }
   
   @GetMapping("/socialLogin")
   public String socialLogin(String email, String id, Model model) {
	   model.addAttribute("email", email);
	   model.addAttribute("id", id);
	   return "user/users/socialLogin";
   }
   
   @GetMapping("/kakao/request")
   @ResponseBody
   public Map<String, String> requestKakao(HttpSession session) {
	   
	   	String clientId = "bbee380452a4341a2b39cba2ef0bdefe"; 
 
		String redirectUrl = "http://localhost:8080/kakao/oauth";
		
		String kakaoLoginUrl = 	"https://kauth.kakao.com/oauth/authorize?" + 
								"client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&response_type=code";
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", kakaoLoginUrl);
		
		return map;
   }
   
   
   
   @GetMapping("/kakao/oauth")
   public String kakaoLogin(String code) {
	   String accessToken = userService.getKakaoAccessToken(code);
	   HashMap<String, Object> userInfo = userService.getKakaoUserInfo(accessToken);
	   System.out.println("login Controller : " + userInfo);
	   
	   String email = userInfo.get("email").toString();
	   String password = userInfo.get("id").toString();
	   
	   if(userService.duplicateCheck(email)) {
		   return "redirect:/socialLogin?email="+email+"&id="+password; 
	   } else {
		   return "redirect:/socialJoin?email="+email+"&id="+password;
	   }
   }
   
   @GetMapping("/naver/request")
   @ResponseBody
   public Map<String, String> requestNaver(HttpSession session) throws UnsupportedEncodingException {
	   	SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		session.setAttribute("state", state); 
		
		String clientId = "ukX6QVXRUc7_8u8KKks7";
		
		String redirectUrl = URLEncoder.encode("http://localhost:8080/naver/oauth", "UTF-8");
		
		String naverLoginUrl = 	"https://nid.naver.com/oauth2.0/authorize?response_type=code" + 
								"&client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&state="+(String)session.getAttribute("state");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("url", naverLoginUrl);
		
		return map;
   }
   
   @GetMapping("/naver/oauth")
   public String naverLogin(String code, String state) {
	   String accessToken = userService.getNaverAccessToken(code, state);
	   HashMap<String, Object> userInfo = userService.getNaverUserInfo(accessToken);
	   System.out.println("login Controller : " + userInfo);
	   
	   String email = userInfo.get("email").toString();
	   String password = userInfo.get("id").toString();
	   
	   if(userService.duplicateCheck(email)) {
		   return "redirect:/socialLogin?email="+email+"&id="+password; 
	   } else {
		   return "redirect:/socialJoin?email="+email+"&id="+password;
	   }
	   
   }
   
   
   

//   @GetMapping("/async-handler")
//   @ResponseBody
//   public Callable<String> asyncHandler() {
//      SecurityLogger.log("MVC");
//      return () -> {
//            SecurityLogger.log("Callable");
//            return "Async Handler";
//      };
//   }
//
//   @GetMapping("/async-service")
//   @ResponseBody
//   public String asyncService() {
//      SecurityLogger.log("MVC, before async service");
//      userService.asyncService();
//      SecurityLogger.log("MVC, after async service");
//      return "Async Service";
//   }

}
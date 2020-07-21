package alz.user.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import alz.user.domain.UserDTO;
//import alz.user.exceptions.TemporaryServerException;
//import alz.user.exceptions.UnsatisfiedContentException;
import alz.user.service.UserService;

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
   
   @RequestMapping(value = "/callFindInfo", method = RequestMethod.GET)
   public String callFindInfo() {
	   return "user/users/findInfo";
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
   
   //세션은 생성후 invalidate 메서드를 만나면 삭제됨
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String callLogout(UserDTO user, HttpSession session) {

      session.invalidate();

      return "user/users/logout";
   }
   
   /*----------------------------------------------------------------------------------------*/   
   //회원가입 페이지에서 버튼을 누르면 @RequestMapping을 찾아 실행한다.
   //Form의 값들은 HttpServletRequest에 담겨서 넘어온다.
   //Controller에서 받은 Param 값들은 Model에 담아 다시 View 페이지로 전달할 수 있습니다. Model은 데이터만 담는다
   @RequestMapping(value = "/create", method = RequestMethod.POST)
   public String Insert(UserDTO user, HttpServletRequest request, Model model) {
      
      model.addAttribute("email", request.getParameter("email"));
      model.addAttribute("nickname", request.getParameter("nickname"));
      model.addAttribute("phoneNumber", request.getParameter("phoneNumber"));
      
      // 회원가입 메서드
      userService.create(user);
      
      return "user/anonymous/joinInfo";
   }
   
   //ModelAndView는 스프링에서 제공하는 자체 객체로서 데이터랑 view의 이름을 같이 전달함.
   //login시 session.setAttribute 했던 값을 getAttribute( "저장했던 값" )을 통해 호출 할 수 있음
   @RequestMapping(value = "/updateById", method = RequestMethod.POST)
   public ModelAndView Modify(HttpServletRequest request, UserDTO user) {
      
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

   //로그인 시 session.setAttribute( "세션 호출 명", 세션에 담을 값 ); 
   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public String login(UserDTO user, HttpSession session, HttpServletRequest request) {

      UserDTO dto = userService.readById(user);
      session.setAttribute("sessionUser", dto);

      if (dto == null) {
         System.out.println("로그인 정보가 틀렸습니다.");
         return "user/users/login";
      }

	      String referer = (String)request.getHeader("REFERER");
	      
      return "user/users/loggedInfo";
   }
}
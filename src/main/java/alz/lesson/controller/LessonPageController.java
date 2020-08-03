package alz.lesson.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alz.lesson.domain.LessonDTO;
import alz.lesson.domain.TeacherDTO;
import alz.lesson.service.LessonServiceImpl;
import alz.user.domain.UserDTO;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/lesson")
@Log4j
public class LessonPageController {
   
   private LessonServiceImpl lessonService;
   
   @Autowired
   public LessonPageController(LessonServiceImpl lessonService) {
      this.lessonService = lessonService;
   }
   
   
   public UserDTO getLoginUserInfo() {
      SecurityContext context = SecurityContextHolder.getContext();
      Authentication auth = context.getAuthentication();
      UserDTO userInfo = (UserDTO)auth.getPrincipal();
      return userInfo;
   }
   
   @GetMapping("/list")
   public void list(Model model){
      model.addAttribute("list", lessonService.readAll());
   }
   
   // 클래스 상세
   @GetMapping("/read")
   public void get(@RequestParam Long id, Model model) {
      model.addAttribute("lesson", lessonService.readByLessonId(id));
      model.addAttribute("curriculum", lessonService.curriculumByLessonId(id));
      model.addAttribute("teacher", lessonService.teacherByLessonId(id));
      model.addAttribute("quickReview", lessonService.quickReviewByLessonId(id));
   }

   // 강사등록
   @GetMapping("/register")
   public void register(Model model) {
      UserDTO user = getLoginUserInfo();
      if(user!=null) {
         model.addAttribute("teacher", lessonService.teacherByUserId(user.getId()));
      }
   }
   
   // 강사등록
   @PostMapping("/registerTeacher")
   public String registerTeacher(TeacherDTO teacher) {
      if(teacher.getId()==null) {
         teacher = lessonService.createTeacher(teacher);
      } else {
         teacher = lessonService.updateTeacher(teacher);
      }
      return "redirect:/lesson/registerBasic?teacherId="+teacher.getId();
   }

   
   // 클래스 개설했던 클래스 가져오기
   @GetMapping("/registerBasic")
   public void registerBasic(@RequestParam Long teacherId, Model model) {
      if(teacherId!=null) {
         model.addAttribute("lessons", lessonService.lessonsByTeacherId(teacherId));
      }
      model.addAttribute("mainCategory", lessonService.mainCategory());
      model.addAttribute("subCategory", lessonService.subCategory());
   }
   
   @PostMapping("/registerBasic")
   public String registerDetail(LessonDTO lesson) {
      int lessonId;
      if(lesson.getState()!=1) {
         lessonId = lessonService.createLesson(lesson);
      } else {
         lessonService.updateLesson(lesson);
         lessonId = lesson.getId().intValue();
      }
      return "redirect:/lesson/registerDetail?lessonId="+lessonId;
   }
   
   // 클래스 스케줄&세부 jsp
   @GetMapping("/registerDetail")
   public void registerDetail(@RequestParam Long lessonId, Model model) {
      model.addAttribute("lessons", lessonService.readByLessonId(lessonId));
   }
   
   // 클래스 스케줄&세부 jsp
   @GetMapping("/registerCurriculum")
   public void registerCurriculum(@RequestParam Long lessonId, Model model) {
      model.addAttribute("lessons", lessonService.readByLessonId(lessonId));
   }
   
}
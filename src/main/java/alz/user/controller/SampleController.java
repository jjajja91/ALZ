package alz.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/sample/*")
@Controller
@AllArgsConstructor
public class SampleController {
	
	@GetMapping("/all")
	public void doAll(Model model) {
		log.info("do all can access everyone");
	}

	@GetMapping("/member")
	public void doMember(Model model) {
		log.info("logined member");
	}
	
	@GetMapping("/admin")
	public void doAdmin(Model model) {
		log.info("admin only");
	}
	
//	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
//	@GetMapping("/annoMember")
//	public void doMember2() {
//		log.info("logined annotation member");
//	}
//	
//	@Secured({"ROLE_ADMIN"})
//	@GetMapping("annoAdmin")
//	public void doAdmin2() {
//		log.info("admin annotation only");
//	}
}

package alz.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.board.exceptions.NoUserException;
import alz.order.domain.MerchandiseDTO;
import alz.order.domain.OrderDTO;
import alz.order.service.MerchandiseService;
import alz.order.service.OrderService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/order/*")
public class OrderPageController {

	private OrderService orderService;
	private MerchandiseService merchandiseService;

	@GetMapping("/register")
	public void register() {
	}

	@GetMapping("/list")
	public void list(Model model) {

		log.info("list");
		model.addAttribute("list", orderService.readAll());

	}

	@PostMapping("/register")
	public String register(OrderDTO order, RedirectAttributes rttr) {

		log.info("register: " + order);

		orderService.create(order);

		rttr.addFlashAttribute("result", order.getId());

		return "redirect:/order/list";
	}

	@GetMapping("/get")
	public void get(@RequestParam("id") Long id, Model model) {

		log.info("/get");
		model.addAttribute("orders", orderService.readById(id));
	}

	@PostMapping("/modify")
	public String modify(OrderDTO order, RedirectAttributes rttr, Long Long) {

		log.info("modify:" + order);

		return "redirect:/order/list";
	}

	@PostMapping("/order")
	public void order(@RequestParam("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("sessionUser") == null) {
			throw new NoUserException();
		}
		
		model.addAttribute("merchandise", merchandiseService.readById(id));
	}

}

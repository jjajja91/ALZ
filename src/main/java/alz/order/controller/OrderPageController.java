package alz.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.order.domain.CartDTO;
import alz.order.domain.OrderDTO;
import alz.order.service.CartService;
import alz.order.service.MerchandiseService;
import alz.order.service.OrderService;
import alz.user.domain.UserDTO;
import alz.user.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/order/*")
public class OrderPageController {

	private OrderService orderService;
	private MerchandiseService merchandiseService;
	private UserService userService;
	private CartService cartService;

	@PostMapping("/orderEach")
	public String orderEach(@RequestParam("id") Long id, Model model, HttpSession session, RedirectAttributes rttr) {
		// 로그인이 아니면 로그인 화면으로 보낸다.
		if (session.getAttribute("sessionUser") == null) {
			rttr.addFlashAttribute("buyFail", "1");

			return "redirect:/merchandise/get?num=" + id;

		}

		// 유저 정보 가져오기
		UserDTO user = (UserDTO) session.getAttribute("sessionUser");
		Long userId = user.getId();

		user = userService.userInfo(userId);
		model.addAttribute("userInfo", user);

		List orderList = new ArrayList<OrderDTO>();
		orderList.add(id);

		model.addAttribute("orderList", orderList);
		model.addAttribute("merchandise", merchandiseService.readById(id));

		return "/order/orderForm";

	}

	@PostMapping("/orderForm")
	public void order(long[] cartId, @RequestParam("id") Long id, Model model, HttpSession session,
			RedirectAttributes rttr) {
		if (session.getAttribute("sessionUser") == null) {
			rttr.addFlashAttribute("buyFail", "1");

			return;

		}

		UserDTO user = (UserDTO) session.getAttribute("sessionUser");
		Long userId = user.getId();
		user = userService.userInfo(userId);
		model.addAttribute("userInfo", user);
		model.addAttribute("merchandise", merchandiseService.readById(id));

		List<CartDTO> list = new ArrayList<CartDTO>();

		// 장바구니 목록중 선택한것 가져오기
//		for (int i = 0; i < cartId.length; i++) {
//			long no = 0;
//			CartDTO cartlist = new CartDTO();
//			id = cartId[i];
//			cartlist = cartService.buyList(id);
//
//			list.add(cartlist);
//
//		}

		if (!list.isEmpty()) {
			model.addAttribute("buylist", list);
			System.out.println("list성공?>?" + list);

		}

	}

//	@PostMapping("/orderChecked")
//	public String orderChecked(long[] cartId, Model model, HttpSession session) {
//
//		// 유저 정보 가져오기
//		UserDTO user = (UserDTO) session.getAttribute("sessionUser");
//		Long userId = user.getId();
//
//		user = userService.userInfo(userId);
//		model.addAttribute("userInfo", user);
//
//		List<CartDTO> list = new ArrayList<CartDTO>(); 
//
//		
//
//		return "/order/orderForm";
//
//	}

}

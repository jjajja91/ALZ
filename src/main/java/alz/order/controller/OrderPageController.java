package alz.order.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alz.order.domain.CartDTO;
import alz.order.domain.CartListDTO;
import alz.order.domain.OrderDTO;
import alz.order.service.CartService;
import alz.order.service.MerchandiseService;
import alz.order.service.OrderService;
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
	public String orderEach(Principal pr, @RequestParam("id") Long id, Model model) {

		// 유저 정보 가져오기
		String user = userService.searchId(pr.getName());
		long userId = Long.parseLong(user);
		
		model.addAttribute("userInfo", userService.userInfo(userId));

		List orderList = new ArrayList<OrderDTO>();
		orderList.add(id);

		model.addAttribute("orderList", orderList);
		model.addAttribute("buyList", merchandiseService.readById(id));

		return "/order/orderForm";

	}

	@PostMapping("/orderForm")
	public void order(Principal pr, @RequestParam("cartId") long[] cartId, Model model) throws Exception{

		String user = userService.searchId(pr.getName());
		long userId = Long.parseLong(user);
		
		model.addAttribute("userInfo", userService.userInfo(userId));
		
		List<CartListDTO> list = new ArrayList<CartListDTO>();

		System.out.println(cartId.length);
		// 장바구니 목록중 선택한것 가져오기
		for (int i = 0; i < cartId.length; i++) {
			long no = 0;
			CartListDTO cartList = new CartListDTO();
			no = cartId[i];
			System.out.println("no = " + no);
			cartList = cartService.buyList(no);
			System.out.println("cartList = "+cartList);

			list.add(cartList);

		}

		if (!list.isEmpty()) {
			model.addAttribute("buyList", list);
			System.out.println(list);

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

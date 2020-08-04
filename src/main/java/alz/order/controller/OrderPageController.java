package alz.order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import alz.order.domain.CartListDTO;
import alz.order.domain.MerchandiseDTO;
import alz.order.domain.OrderDTO;
import alz.order.domain.OrderDetailDTO;
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

	public UserDTO getLoginUserInfo() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		UserDTO userInfo = (UserDTO) auth.getPrincipal();
		return userInfo;
	}

	// 상품 상세에서 바로 구매
	@GetMapping("/orderForm")
	public void orderEach(@RequestParam("id") long merchandiseId, Model model) {

		long userId = getLoginUserInfo().getId();

		model.addAttribute("userInfo", userService.userInfo(userId));

		List<MerchandiseDTO> list = new ArrayList<MerchandiseDTO>();

		MerchandiseDTO merchandiseList = new MerchandiseDTO();

		merchandiseList = merchandiseService.readById(merchandiseId);

		list.add(merchandiseList);

		model.addAttribute("buyList", list);

		/* 개별 구매 완료시 해당 아이템이 카트에 있다면 결제 후 카트에서 삭제해주는 것도 필요하겠네 */
	}

	// 장바구니 체크된 항목 구매하기
	@PostMapping("/orderForm")
	public void orderCart(@RequestParam("cartId") long[] cartId, Model model) throws Exception {

		long userId = getLoginUserInfo().getId();

		model.addAttribute("userInfo", userService.userInfo(userId));

		List<CartListDTO> list = new ArrayList<CartListDTO>();

		System.out.println(cartId.length);
		// 장바구니 목록중 선택한것 가져오기
		for (int i = 0; i < cartId.length; i++) {
			long no = 0;
			CartListDTO cartList = new CartListDTO();
			no = cartId[i];
			cartList = cartService.buyList(no);
			list.add(cartList);
		}

		if (!list.isEmpty()) {
			model.addAttribute("buyList", list);
		}

	}

	@GetMapping("/buy")
	public void orderform(@RequestParam("orderId") String orderId, Model model) throws Exception {

		long userId = getLoginUserInfo().getId();

		// 모델에 유저 정보 추가
		model.addAttribute("userInfo", userService.userInfo(userId));
		model.addAttribute("orderId", orderId);

		List<OrderDetailDTO> orderList = orderService.orderResult(orderId);

		model.addAttribute("orderList", orderList);

		// 카트 비우기
		orderService.removeCart(userId);

	}

	@PostMapping("/payForKakao")
	public void payForKakao(@RequestParam("cartId") long[] cartId, Model model,@RequestParam("merchandise") long id,
			@RequestParam("merchandiseName") String[] merchandiseName, @RequestParam("totalPrice") long totalPrice) {

		System.out.println("카카오페이");
		long userId = getLoginUserInfo().getId();

		int merchandises = cartId.length - 1;

		model.addAttribute("userInfo", userService.userInfo(userId));
		model.addAttribute("merchandiseName", merchandiseName[0]);
		model.addAttribute("merchandise", id);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("merchandises", merchandises);

		List<CartListDTO> list = new ArrayList<CartListDTO>();
		System.out.println(cartId.length);
		// 장바구니 목록중 선택한것 가져오기
		for (int i = 0; i < cartId.length; i++) {
			long no = 0;
			CartListDTO cartList = new CartListDTO();
			no = cartId[i];
			cartList = cartService.buyList(no);
			list.add(cartList);
		}

		if (!list.isEmpty()) {
			model.addAttribute("buyList", list);
		}

		System.out.println(list);

	}

	@PostMapping("/addNewOrder")
	@ResponseBody
	public String orderInsert(@RequestBody OrderDTO order, OrderDetailDTO orderDetail, Model model) throws Exception {

		System.out.println("addNewOrder");

		long userId = getLoginUserInfo().getId();

		model.addAttribute("userInfo", userService.userInfo(userId));

//		// 주문번호 생성 -> 자바스크립트로 대체함
//		Calendar cal = Calendar.getInstance();
//		int year = cal.get(Calendar.YEAR);
//		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		String subNum = "";
//
//		for (int i = 1; i <= 6; i++) {
//			subNum += (int) (Math.random() * 10);
//		}
//
//		String orderId = ymd + "_" + subNum; // ex) 20200730_179708

		System.out.println(order.getId());
		// 주문에 유저 아이디와 생성된 주문번호 추가
		order.setUserId(userId);
		// 주문등록
		orderService.insertOrder(order);
		System.out.println("orderInsert Complete");
		//
		orderDetail.setOrderId(order.getId());
		orderDetail.setUserId(userId);
		// 주문 상세 등록
//		orderService.insertOrderDetail(orderDetail);
//		System.out.println("orderDetailInsert Complete");

		return "redirect:/order/buy";

	}

	@PostMapping("/orderDetailInsert")
	@ResponseBody
	public void orderDetailInsert(@RequestBody OrderDetailDTO orderDetail, Model model) throws Exception {

		System.out.println("orderDetailInsert");

		long userId = getLoginUserInfo().getId();
		
		// 주문에 유저 아이디와 생성된 주문번호 추가
		orderDetail.setUserId(userId);
		orderService.orderDetailInsert(orderDetail);
	}

}

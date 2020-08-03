package alz.order.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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

	// 상품 상세에서 바로 구매
	@PostMapping("/orderEach")
	public String orderEach(Principal pr, @RequestParam("id") long merchandiseId, Model model) {

		// 유저 정보 가져오기
		String user = userService.searchId(pr.getName());
		long userId = Long.parseLong(user);

		model.addAttribute("userInfo", userService.userInfo(userId));

		List<MerchandiseDTO> list = new ArrayList<MerchandiseDTO>();

		MerchandiseDTO merchandiseList = new MerchandiseDTO();

		merchandiseList = merchandiseService.readById(merchandiseId);

		list.add(merchandiseList);

		model.addAttribute("buyList", list);

		return "/order/orderForm";

		/* 개별 구매 완료시 해당 아이템이 카트에 있다면 결제 후 카트에서 삭제해주는 것도 필요하겠네 */
	}

	// 장바구니 체크된 항목 구매하기
	@PostMapping("/orderForm")
	public void order(Principal pr, @RequestParam("cartId") long[] cartId, Model model) throws Exception {

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
			cartList = cartService.buyList(no);
			list.add(cartList);
		}

		if (!list.isEmpty()) {
			model.addAttribute("buyList", list);
		}

	}

//	@PostMapping("/buy")
//	public String orderform(@RequestParam("cartId") long[] cartId, OrderAllDTO orderAll, Principal pr, Model model) throws Exception {
//		
//		System.out.println("------post buy-------");
//		// 유저 정보 가져오기
//		String user = userService.searchId(pr.getName());
//		long userId = Long.parseLong(user);
//
//		// 모델에 유저 정보 추가
//		model.addAttribute("userInfo", userService.userInfo(userId));
//
//		// 주문번호 생성
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
//
//		
//		// 주문에 유저 아이디와 생성된 주문번호 추가
//		orderAll.setId(orderId);
//		orderAll.setUserId(userId);
//
//		System.out.println("주문등록");
//		// 주문 등록
//		orderService.addOrder(orderAll);
//		System.out.println("주문등록 완료");
//
//
//		model.addAttribute("orderList", orderAll );
//		
//		List<CartListDTO> list = new ArrayList<CartListDTO>();
//
//		System.out.println("cartId.length : " + cartId.length);
//		// 주문 목록 가져오기
//		for (int i = 0; i < cartId.length; i++) {
//			long no = 0;
//			CartListDTO cartList = new CartListDTO();
//			no = cartId[i];
//			System.out.println("no = " + no);
//			cartList = cartService.buyList(no);
//			System.out.println("cartList = " + cartList);
//
//			list.add(cartList);
//		}
//
//		if (!list.isEmpty()) {
//			model.addAttribute("buyList", list);
//			System.out.println(list);
//		}
//		
//		// 카트 비우기
//		orderService.removeCart(userId);
//		
//		return "redirect:/order/buy";
//	}

	@GetMapping("/buy")
	public void orderform(@RequestParam("cartId") long[] cartId, OrderDTO order, OrderDetailDTO orderDetail,
			Principal pr, Model model) throws Exception {
		// 유저 정보 가져오기
		String user = userService.searchId(pr.getName());
		long userId = Long.parseLong(user);

		// 모델에 유저 정보 추가
		model.addAttribute("userInfo", userService.userInfo(userId));

		// 주문번호 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum; // ex) 20200730_179708

		// 주문에 유저 아이디와 생성된 주문번호 추가
		order.setId(orderId);
		order.setUserId(userId);

		// 주문 등록
		orderService.insertOrder(order);

		// 주문 상세에 주문 번호, 유저 아이디 추가
		orderDetail.setOrderId(orderId);
		orderDetail.setUserId(userId);

		System.out.println("orderDetail.getUserId() : " + orderDetail.getUserId());
		// 주문 상세 등록
		orderService.insertOrderDetail(orderDetail);

		model.addAttribute("orderList", order);

		List<CartListDTO> list = new ArrayList<CartListDTO>();

		System.out.println("cartId.length : " + cartId.length);
		// 주문 목록 가져오기
		for (int i = 0; i < cartId.length; i++) {
			long no = 0;
			CartListDTO cartList = new CartListDTO();
			no = cartId[i];
			System.out.println("no = " + no);
			cartList = cartService.buyList(no);
			System.out.println("cartList = " + cartList);

			list.add(cartList);
		}

		if (!list.isEmpty()) {
			model.addAttribute("buyList", list);
			System.out.println(list);
		}

		// 카트 비우기
		orderService.removeCart(userId);

//		return "redirect:/order/buy";
	}

//	@GetMapping("/buy")
	public void buy(Principal pr, Model model) throws Exception {

		String user = userService.searchId(pr.getName());
		long userId = Long.parseLong(user);

		model.addAttribute("userInfo", userService.userInfo(userId));

//		List<CartListDTO> list = new ArrayList<CartListDTO>();
//
//		// 주문 목록 가져오기
//		for (int i = 0; i < cartId.length; i++) {
//			long no = 0;
//			CartListDTO cartList = new CartListDTO();
//			no = cartId[i];
//			System.out.println("no = " + no);
//			cartList = cartService.buyList(no);
//			System.out.println("cartList = " + cartList);
//
//			list.add(cartList);
//		}
//
//		if (!list.isEmpty()) {
//			model.addAttribute("buyList", list);
//			System.out.println(list);
//		}

	}

	@PostMapping("/payForKakao")
	public void payForKakao(@RequestParam("cartId") long[] cartId, Principal pr, Model model,
			@RequestParam("merchandiseName") String[] merchandiseName, @RequestParam("totalPrice") long totalPrice) {
		String user = userService.searchId(pr.getName());
		long userId = Long.parseLong(user);
		int merchandises = cartId.length -1 ;
		
		model.addAttribute("userInfo", userService.userInfo(userId));
		model.addAttribute("merchandiseName", merchandiseName[0]);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("merchandises", merchandises);

	}

	@PostMapping("/addNewOrder")
	@ResponseBody
	public void orderInsert(Principal pr, @RequestBody OrderDTO order ) throws Exception {

		System.out.println("addNewOrder");
		
		String user = userService.searchId(pr.getName());
		long userId = Long.parseLong(user);

		// 주문번호 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum; // ex) 20200730_179708

		// 주문에 유저 아이디와 생성된 주문번호 추가
		order.setId(orderId);
		order.setUserId(userId);
		

		orderService.insertOrder(order);

	}

}

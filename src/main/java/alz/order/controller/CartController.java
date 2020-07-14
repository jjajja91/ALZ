package alz.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import alz.order.domain.CartDTO;
import alz.order.service.CartService;
import alz.user.domain.UserDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/merchandise/*")
public class CartController {

	private CartService cartService;

	// 장바구니 페이지 연결
	@GetMapping("/cartList")
	public void cartList() {
	}

	// 장바구니 추가
	@PostMapping("/cartInsert")
	public String addCart(@ModelAttribute CartDTO cart, @RequestParam("id") Long id, Model model, HttpSession session) {

		// 저장된 세션에서 닉네임 가져오기
		UserDTO user = (UserDTO) session.getAttribute("sessionUser");
		String cartNick = user.getNickname();

		// 카트에 닉네임, 상품 저장
		cart.setCartNick(cartNick);
		cart.setMerchandiseId(id);
		// 장바구니에 기존 상품이 있는지 검사
		int count = cartService.countCart(cart.getMerchandiseId(), cartNick);
		if (count == 0) {
			// 없으면 insert
			cartService.insertCart(cart);
		}
		// 수량 변경할 필요가 없으므로 생략.
		// else {
		// 있으면 update
		// merchandiseService.updateCart(cart);
		// }
		return "redirect:/merchandise/cart";
	}

	// 장바구니 처리
	@GetMapping("/cart")
	public ModelAndView list(@ModelAttribute CartDTO cart, ModelAndView mav, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		UserDTO user = (UserDTO) session.getAttribute("sessionUser");
		String cartNick = user.getNickname();
		cart.setCartNick(cartNick);

		List<CartDTO> list = cartService.listCart(cartNick); // 장바구니 정보
		int sumMoney = cartService.sumMoney(cartNick); // 장바구니 전체 금액 호출

		map.put("list", list); // 장바구니 정보를 map에 저장
		map.put("count", list.size()); // 장바구니 상품의 유무
		map.put("sumMoney", sumMoney); // 장바구니 전체 금액
		map.put("allSum", sumMoney); // 주문 상품 전체 금액
		mav.setViewName("merchandise/cartList"); // view(jsp)의 이름 저장
		mav.addObject("map", map); // map 변수 저장

		return mav;
	}

	// 장바구니 삭제
	@GetMapping("delete")
	public String delete(@RequestParam long cartNum) {
		cartService.deleteCart(cartNum);
		return "redirect:/merchandise/cart";
	}
}

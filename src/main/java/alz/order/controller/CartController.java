package alz.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alz.order.domain.CartDTO;
import alz.order.domain.MerchandiseCriteria;
import alz.order.domain.MerchandiseDTO;
import alz.order.domain.MerchandisePageDTO;
import alz.order.service.CartService;
import alz.order.service.MerchandiseService;
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
	public String addCart(@ModelAttribute CartDTO cart, @RequestParam("id") Long id, Model model) {

		long userId = 1L;
		cart.setUserId(userId);
		cart.setMerchandiseId(id);
		// 장바구니에 기존 상품이 있는지 검사
		int count = cartService.countCart(cart.getMerchandiseId(), userId);
		if (count == 0) {
			// 없으면 insert
			cartService.insertCart(cart);
		}
		// ..수량 변경할 필요가 없으므로 생략.
		// else {
		// 있으면 update
		// merchandiseService.updateCart(cart);
		// }
		return "redirect:/merchandise/cart";
	}

	// 장바구니 처리
	@GetMapping("/cart")
	public ModelAndView list(@ModelAttribute CartDTO cart, ModelAndView mav) {
		Map<String, Object> map = new HashMap<String, Object>();
		long userId = 1;
		cart.setUserId(userId);

		List<CartDTO> list = cartService.listCart(userId); // 장바구니 정보
		int sumMoney = cartService.sumMoney(userId); // 장바구니 전체 금액 호출
		// 장바구니 전체 긍액에 따라 배송비 구분
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

package alz.order.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public  String addCart(@ModelAttribute CartDTO cart, @RequestParam("id") Long id, Model model, Principal principal) {
		// 저장된 세션에서 닉네임 가져오기
		UserDTO user = (UserDTO) principal;
		Long userId = user.getId();

		String result = "false";
		// 카트에 닉네임, 상품 저장
		cart.setUserId(userId);
		cart.setMerchandiseId(id);
		// 장바구니에 기존 상품이 있는지 검사
		int count = cartService.countCart(cart.getMerchandiseId(), userId);
		if (count == 0) {
			// 없으면 insert
			cartService.insertCart(cart);
			result = "true";
		}
		
		return result;
	}

	// 장바구니 처리
	@GetMapping("/cart")
	public ModelAndView list(@ModelAttribute CartDTO cart, ModelAndView mav, Principal principal) {

		// 장바구니 정보를 담을 map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		// 유저 세션 가져오기
		UserDTO user = (UserDTO) principal;
		Long userId = user.getId();
		cart.setUserId(userId);

		List<CartDTO> list = cartService.listCart(userId); // 장바구니 정보
		int sumMoney = cartService.sumMoney(userId); // 장바구니 전체 금액 호출

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
	public String delete(@RequestParam long id) {
		cartService.deleteCart(id);
		return "redirect:/merchandise/cart";
	}

	// 카트 삭제
	@PostMapping("delete")
	@ResponseBody
	public String deleteCart(@RequestParam(value = "chkbox[]") List<String> chArr, CartDTO cart, Principal principal)
			throws Exception {
		log.info("delete cart");

		UserDTO user = (UserDTO) principal;
		Long userId = user.getId();

		String result = "0";
		long id = 0;

		if (user != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				id = Long.parseLong(i);
				cart.setId(id);
				cartService.delete(cart);
			}
			result = "1";
		}
		log.info(id);
		return result;
		
	}
}
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
import alz.order.service.MerchandiseService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/merchandise/*")
public class MerchandisePageController {

	private MerchandiseService merchandiseService;

	@GetMapping("/register")
	public void register() {
	}

//	@GetMapping("/list")
//	public void list(Model model) {
//
//		log.info("list");
//		model.addAttribute("list", merchandiseService.readAll());
//
//	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute @Valid MerchandiseDTO md, BindingResult result) {
		// 에러가 있는지 검사
		if( result.hasErrors() ) {

			// 에러를 List로 저장
			List<ObjectError> list = result.getAllErrors();
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "/merchandise/register";
		}
		
		merchandiseService.create(md);
		return "redirect:/merchandise/list";
	}

	@GetMapping("/list")
	public void list(MerchandiseCriteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", merchandiseService.readAll(cri));

		int total = merchandiseService.getTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new MerchandisePageDTO(cri, total));
	}

//	@PostMapping("/register")
//	public String register(MerchandiseDTO merchandise, RedirectAttributes rttr) {
//
//		log.info("register: " + merchandise);
//
//		merchandiseService.create(merchandise);
//
//		rttr.addFlashAttribute("result", merchandise.getId());
//
//		return "redirect:/merchandise/list";
//	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("id") Long id, @ModelAttribute("cri") MerchandiseCriteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("merchandise", merchandiseService.readById(id));
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") Long id, @ModelAttribute("cri") MerchandiseCriteria cri,
			RedirectAttributes rttr) {

		log.info("remove..." + id);
		if (merchandiseService.deleteById(id) == id) {
			rttr.addFlashAttribute("result", "success");
		}

//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/merchandise/list" + cri.getListLink();
	}

	@PostMapping("/modify")
	public String modify(@RequestParam("id") Long id, @ModelAttribute("cri") MerchandiseCriteria cri,
			MerchandiseDTO merchandise, RedirectAttributes rttr) {
		log.info("modify:" + merchandise);

		if (merchandiseService.updateById(id, merchandise) != null) {
			rttr.addFlashAttribute("result", "success");
		}

//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/merchandise/list" + cri.getListLink();
	}
	
	
	@GetMapping("/cartList")
	public void cartList() {
	}

	@PostMapping("/cartInsert")
	public String addCart(@ModelAttribute CartDTO cart, @RequestParam("id") Long id, Model model) {

		long userId = 1L;
		cart.setUserId(userId);
		cart.setMerchandiseId(id);
//		 장바구니에 기존 상품이 있는지 검사
		int count = merchandiseService.countCart(cart.getMerchandiseId(), userId);
		if(count == 0){		
//			 없으면 insert
			merchandiseService.insertCart(cart);
		} 
// ..수량 변경할 필요가 없으므로 생략.
//		else {
//			 있으면 update
//			merchandiseService.updateCart(cart);
//		}
		return "redirect:/merchandise/cart";
	}
	
	
	@GetMapping("/cart")
	public ModelAndView list(@ModelAttribute CartDTO cart, ModelAndView mav){
		Map<String, Object> map = new HashMap<String, Object>();
		long userId = 1;
		cart.setUserId(userId);
		
		List<CartDTO> list = merchandiseService.listCart(userId); // 장바구니 정보 
		int sumMoney = merchandiseService.sumMoney(userId); // 장바구니 전체 금액 호출
		// 장바구니 전체 긍액에 따라 배송비 구분
		// 배송료(10만원이상 => 무료, 미만 => 2500원)
		map.put("list", list);				// 장바구니 정보를 map에 저장
		map.put("count", list.size());		// 장바구니 상품의 유무
		map.put("sumMoney", sumMoney);		// 장바구니 전체 금액
		map.put("allSum", sumMoney);	// 주문 상품 전체 금액 
		mav.setViewName("merchandise/cartList");	// view(jsp)의 이름 저장
		mav.addObject("map", map);			// map 변수 저장
		
		return mav;

	}
	
	// 3. 장바구니 삭제
		@GetMapping("delete")
		public String delete(@RequestParam long cartNum){
			merchandiseService.deleteCart(cartNum);
			return "redirect:/merchandise/cart";
		}
}

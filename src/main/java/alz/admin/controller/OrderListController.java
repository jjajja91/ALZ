package alz.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import alz.admin.service.OrdersService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class OrderListController {
 
	private OrdersService orderService;

	@Autowired
	public OrderListController(OrdersService orderService) {
		this.orderService = orderService;
	}
	
	@GetMapping("/order/orderMain")
	public void orderMain(Model model) {
		model.addAttribute("list", orderService.orderList());
	}
	
	@GetMapping("/order/orderCanceled")
	public void orderCanceled() {
	}
	
	@GetMapping("/order/orderDetail")
	public void orderDetail() {
	}
	
	
}

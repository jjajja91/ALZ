package alz.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import alz.order.domain.OrderDTO;
import alz.order.service.OrderService;
import alz.user.domain.UserDTO;
import alz.user.service.UserService;

@RestController
@RequestMapping("/orders")
public class OrderApiController {

	private OrderService orderService;
	private UserService userService;
	
	public UserDTO getLoginUserInfo() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		UserDTO userInfo = (UserDTO)auth.getPrincipal();
		return userInfo;
	}

	@Autowired
	public OrderApiController(OrderService orderService, UserService userService) {
		this.orderService = orderService;
		this.userService = userService;
	}

	@PostMapping("/addNewOrder")
	public ResponseEntity<?> create(@RequestBody OrderDTO order) throws Exception {
		long userId = getLoginUserInfo().getId();

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
		
		System.out.println("id : " + order.getId());
		System.out.println("method: " + order.getMethod());
		System.out.println("name : "+ order.getName());
		System.out.println("phone : " + order.getPhone());
		System.out.println("state : " + order.getState());
		System.out.println("sysdate : " + order.getOrderAt());
		System.out.println("price : " + order.getTotalPrice());
		System.out.println("userId: " + order.getUserId());

		

		orderService.insertOrder(order);
		return ResponseEntity.status(HttpStatus.CREATED).body("");
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id) {
		return ResponseEntity.status(HttpStatus.OK).body("");
	}

	@GetMapping
	public ResponseEntity<?> readAll() {
		return ResponseEntity.status(HttpStatus.OK).body("");
	}

//	@PutMapping("/{id}")
//	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody OrderDTO order) {
//		OrderDTO updatedOrder = orderService.updateById(id, order);
//		return ResponseEntity.status(HttpStatus.OK).body(updatedOrder);
//	}
//	
//	@DeleteMapping("/{id}")
//	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
//		int affectedRowCount = orderService.deleteById(id);
//		return ResponseEntity.status(HttpStatus.OK).body(affectedRowCount);
//	}

}

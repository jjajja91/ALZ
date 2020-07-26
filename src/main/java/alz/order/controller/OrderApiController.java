//package alz.order.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import alz.order.domain.OrderDTO;
//import alz.order.service.OrderService;
//
//@RestController
//@RequestMapping("/orders")
//public class OrderApiController {
//
//	private OrderService orderService;
//
//	@Autowired
//	public OrderApiController(OrderService orderService) {
//		this.orderService = orderService;
//	}
//
//	@PostMapping
//	public ResponseEntity<?> create(@RequestBody OrderDTO order) {
//		OrderDTO registeredOrder = orderService.createOrder(order);
//		return ResponseEntity.status(HttpStatus.CREATED).body(registeredOrder);
//	}
//
//	@GetMapping("/{id}")
//	public ResponseEntity<?> readOne(@PathVariable Long id) {
//		OrderDTO searchedOrder = orderService.
//		return ResponseEntity.status(HttpStatus.OK).body(searchedOrder);
//	}
//
//	@GetMapping
//	public ResponseEntity<?> readAll() {
//		List<OrderDTO> orders = orderService.readAll();
//		return ResponseEntity.status(HttpStatus.OK).body(orders);
//	}
//
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
//
//}

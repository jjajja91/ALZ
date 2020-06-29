package alz.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import alz.order.domain.OrderDTO;
import alz.order.service.OrderService;

@RestController
@RequestMapping("/orders")
public class OrderApiController {

	private OrderService orderService;

	@Autowired
	public OrderApiController(OrderService orderService) {
		this.orderService = orderService;
	}

	@PostMapping
	public ResponseEntity<?> create(@RequestBody OrderDTO order) {
		OrderDTO registeredOrder = orderService.create(order);
		return null;
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> readOne(@PathVariable Long id) {
		OrderDTO searchedOrder = orderService.readById(id);
		return null;
	}

	@GetMapping
	public ResponseEntity<?> readAll() {
		List<OrderDTO> orders = orderService.readAll();
		return null;
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> updateOne(@PathVariable Long id, @RequestBody OrderDTO order) {
		OrderDTO updatedOrder = orderService.updateById(id, order);
		return null;
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteOne(@PathVariable Long id) {
		int affectedRowCount = orderService.deleteById(id);
		return null;
	}

}

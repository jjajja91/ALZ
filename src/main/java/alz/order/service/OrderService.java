package alz.order.service;

import java.util.List;

import alz.order.domain.OrderDTO;
import alz.order.domain.OrderDetailDTO;

public interface OrderService {

	public void insertOrder(OrderDTO order) throws Exception;
	public void insertOrderDetail(OrderDetailDTO order) throws Exception;
	public void removeCart(Long userId) throws Exception;
	
	public List<OrderDetailDTO> orderResult(String orderId);
	public void orderDetailInsert(OrderDetailDTO orderDetail) throws Exception;
	public OrderDTO findOrderer(String orderId);
	
}

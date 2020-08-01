package alz.order.service;

import alz.order.domain.OrderAllDTO;
import alz.order.domain.OrderDTO;
import alz.order.domain.OrderDetailDTO;

public interface OrderService {

	public void insertOrder(OrderDTO order) throws Exception;
	public void insertOrderDetail(OrderDetailDTO order) throws Exception;
	public void removeCart(Long userId) throws Exception;
	
	public void addOrder(OrderAllDTO orderAll) throws Exception;
	
}

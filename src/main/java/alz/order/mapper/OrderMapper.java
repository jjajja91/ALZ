package alz.order.mapper;

import alz.order.domain.OrderAllDTO;
import alz.order.domain.OrderDTO;
import alz.order.domain.OrderDetailDTO;

public interface OrderMapper {

	public void removeCart(Long userId);

	public void insertOrder(OrderDTO order);

	public void insertOrderDetail(OrderDetailDTO order);

	// 
	public void addOrder(OrderAllDTO orderAll);

	public void addOrderDetail(OrderAllDTO orderAll);

}

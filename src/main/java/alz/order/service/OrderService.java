package alz.order.service;

import java.util.List;

import alz.order.domain.OrderDTO;
import alz.order.domain.OrderDetailDTO;

public interface OrderService {

	public List<OrderDTO> listMyOrderGoods(OrderDTO OrderDTO) throws Exception;
	public void addNewOrder(List<OrderDTO> myOrderList) throws Exception;
	public OrderDTO findMyOrder(long id) throws Exception;
}

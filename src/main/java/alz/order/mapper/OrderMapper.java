package alz.order.mapper;

import java.util.List;

import alz.order.domain.OrderDTO;
import alz.order.domain.OrderDetailDTO;

public interface OrderMapper {
	
	public List<OrderDTO> listMyOrderGoods(OrderDTO orderDTO);

	public void insertNewOrder(List<OrderDTO> myOrderList);

	public void removeGoodsFromCart(List<OrderDTO> myOrderList);

	public OrderDTO findMyOrder(long id);

}

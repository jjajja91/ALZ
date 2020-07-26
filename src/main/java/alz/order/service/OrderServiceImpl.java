package alz.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.order.domain.MerchandiseDTO;
import alz.order.domain.OrderDTO;
import alz.order.domain.OrderDetailDTO;
import alz.order.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	// mapper 가져올 것
	private OrderMapper orderMapper;

	@Autowired
	public OrderServiceImpl(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	public List<OrderDTO> listMyOrderGoods(OrderDTO OrderDTO) throws Exception{
		List<OrderDTO> orderGoodsList;
		orderGoodsList=orderMapper.listMyOrderGoods(OrderDTO);
		return orderGoodsList;
	}
	
	public void addNewOrder(List<OrderDTO> myOrderList) throws Exception{
		orderMapper.insertNewOrder(myOrderList);
		//카트에서 주문 상품 제거한다.
		orderMapper.removeGoodsFromCart(myOrderList);
	}	
	
	public OrderDTO findMyOrder(long id) throws Exception{
		return orderMapper.findMyOrder(id);
	}




}

package alz.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	@Override
	public void insertOrder(OrderDTO order) throws Exception {
		orderMapper.insertOrder(order);
	}

	@Override
	public void insertOrderDetail(OrderDetailDTO order) throws Exception {
		orderMapper.insertOrderDetail(order);
	}

	@Override
	public void removeCart(Long userId) throws Exception {
		orderMapper.removeCart(userId);
	}


	@Override
	public List<OrderDetailDTO> orderResult(String orderId) {
		return orderMapper.orderResult(orderId);
	}


	@Override
	public void orderDetailInsert(OrderDetailDTO orderDetail) throws Exception {
		orderMapper.orderDetailInsert(orderDetail);
		
	}



}

package alz.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import alz.order.domain.OrderAllDTO;
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


	@Transactional
	@Override
	public void addOrder(OrderAllDTO orderAll) throws Exception {
		orderMapper.addOrder(orderAll);
		orderMapper.addOrderDetail(orderAll);
	}





}

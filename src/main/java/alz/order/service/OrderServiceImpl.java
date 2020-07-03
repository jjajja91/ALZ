package alz.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.order.domain.MerchandiseDTO;
import alz.order.domain.OrderDTO;
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
	public OrderDTO create(OrderDTO order) {
		int affectedRowCount = orderMapper.insert(order);
		OrderDTO openMerchandise = orderMapper.selectById(order.getId());
		return openMerchandise;
	}

	@Override
	public OrderDTO readById(Long id) {
		OrderDTO searchedOrder = orderMapper.selectById(id);
		return searchedOrder;
	}

	@Override
	public List<OrderDTO> readAll() {
		List<OrderDTO> orders = orderMapper.selectAll();
		return orders;
	}

	@Override
	public OrderDTO updateById(Long id, OrderDTO order) {
		OrderDTO searchedOrder = orderMapper.selectById(id);
		searchedOrder.setOrderAt(order.getOrderAt()).setPrice(order.getPrice())
		.setState(order.getState());
		int affectedRowCount = orderMapper.updateById(searchedOrder);
		return searchedOrder;
	}

	@Override
	public int deleteById(Long id) {
		OrderDTO searchedOrder = orderMapper.selectById(id);
		int affectedRowCount = orderMapper.deleteById(id);
		return affectedRowCount;
	}

}

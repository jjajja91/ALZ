package alz.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import alz.order.domain.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {

	//mapper 가져올 것
	
	@Override
	public OrderDTO create(OrderDTO order) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderDTO readById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDTO> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderDTO updateById(Long id, OrderDTO order) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteById(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

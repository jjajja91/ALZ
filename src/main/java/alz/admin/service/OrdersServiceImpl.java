package alz.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.admin.mapper.OrdersMapper;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	//mapper 가져와서 사용
	private OrdersMapper ordersMapper;
	
	@Autowired
	public OrdersServiceImpl(OrdersMapper ordersMapper) {
		this.ordersMapper = ordersMapper;
	}
	

}

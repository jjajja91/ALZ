package alz.order.service;

import java.util.List;

import alz.order.domain.OrderDTO;

public interface OrderService {

	OrderDTO create(OrderDTO order);

	OrderDTO readById(Long id);

	List<OrderDTO> readAll();

	OrderDTO updateById(Long id, OrderDTO order);

	int deleteById(Long id);

}

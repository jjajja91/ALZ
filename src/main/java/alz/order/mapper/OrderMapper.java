package alz.order.mapper;

import java.util.List;

import alz.order.domain.OrderDTO;

public interface OrderMapper {
	
	int insert(OrderDTO order);
	
	OrderDTO selectById(Long id);
	
	List<OrderDTO> selectAll();
	
	int updateById(OrderDTO order);
	
	int deleteById(Long id);

}

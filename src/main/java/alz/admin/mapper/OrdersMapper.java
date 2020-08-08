package alz.admin.mapper;

import java.util.List;

import alz.admin.domain.OrderCriteria;
import alz.order.domain.OrderAllDTO;

public interface OrdersMapper {

	public List<OrderAllDTO> orderList();
	public List<OrderAllDTO> orderListPaging(OrderCriteria cri);
}

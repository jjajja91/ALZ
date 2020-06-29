package alz.order.mapper;

import java.util.List;

import alz.order.domain.MerchandiseDTO;

public interface MerchandiseMapper {
	
	int insert(MerchandiseDTO merchandise);
	
	MerchandiseDTO selectById(Long id);
	
	List<MerchandiseDTO> selectAll();
	
	int updateById(MerchandiseDTO merchandise);
	
	int deleteById(Long id);

}

package alz.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import alz.order.domain.CartDTO;
import alz.order.domain.MerchandiseCriteria;
import alz.order.domain.MerchandiseDTO;

public interface MerchandiseMapper {

	int insert(MerchandiseDTO merchandise);

	MerchandiseDTO selectById(Long id);

	List<MerchandiseDTO> selectAll();

	int updateById(MerchandiseDTO merchandise);

	int deleteById(Long id);

	int update(MerchandiseDTO merchandise);

	List<MerchandiseDTO> getListWithPaging(MerchandiseCriteria cri);

	int getTotalCount(MerchandiseCriteria cri);

}

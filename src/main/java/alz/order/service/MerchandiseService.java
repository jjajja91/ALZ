package alz.order.service;

import java.util.List;

import alz.order.domain.MerchandiseCriteria;
import alz.order.domain.MerchandiseDTO;

public interface MerchandiseService {

	MerchandiseDTO create(MerchandiseDTO merchandise);

	MerchandiseDTO readById(Long id);

//	List<MerchandiseDTO> readAll();
	
	List<MerchandiseDTO> readAll(MerchandiseCriteria cri);

	MerchandiseDTO updateById(Long id, MerchandiseDTO merchandise);
	
	int deleteById(Long id);

	MerchandiseDTO update(MerchandiseDTO merchandise);
	
	int getTotal(MerchandiseCriteria cri);

}

package alz.order.service;

import java.util.List;

import alz.order.domain.MerchandiseDTO;

public interface MerchandiseService {

	MerchandiseDTO create(MerchandiseDTO merchandise);

	MerchandiseDTO readById(Long id);

	List<MerchandiseDTO> readAll();

	MerchandiseDTO updateById(Long id, MerchandiseDTO merchandise);

	int deleteById(Long id);

}

package alz.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import alz.order.domain.MerchandiseDTO;

@Service
public class MerchandiseServiceImpl implements MerchandiseService {
	
	//mapper 가져와서 사용

	@Override
	public MerchandiseDTO create(MerchandiseDTO merchandise) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MerchandiseDTO readById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MerchandiseDTO> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MerchandiseDTO updateById(Long id, MerchandiseDTO merchandise) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteById(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

package alz.order.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.classes.domain.ClassDTO;
import alz.order.domain.MerchandiseDTO;
import alz.order.mapper.MerchandiseMapper;

@Service
public class MerchandiseServiceImpl implements MerchandiseService {
	
	//mapper 가져와서 사용
	private MerchandiseMapper merchandiseMapper;
	
	@Autowired
	public MerchandiseServiceImpl(MerchandiseMapper merchandiseMapper) {
		this.merchandiseMapper = merchandiseMapper;
	}

	@Override
	public MerchandiseDTO create(MerchandiseDTO merchandise) {
		int affectedRowCount = merchandiseMapper.insert(merchandise);
		MerchandiseDTO createdMerchandise = merchandiseMapper.selectById(merchandise.getId());
		return createdMerchandise;
	}

	@Override
	public MerchandiseDTO readById(Long id) {
		MerchandiseDTO merchandise = merchandiseMapper.selectById(id);
		return merchandise;
	}

	@Override
	public List<MerchandiseDTO> readAll() {
		List<MerchandiseDTO> merchandises = merchandiseMapper.selectAll();
		return merchandises;
	}

	@Override
	public MerchandiseDTO updateById(Long id, MerchandiseDTO merchandise) {
		MerchandiseDTO searchedMerchandise = merchandiseMapper.selectById(id);

		
		searchedMerchandise.setId(merchandise.getId()).setCodeType(merchandise.getCodeType())
						.setName(merchandise.getName()).setDiscription(merchandise.getDiscription())
						.setClosedAt(merchandise.getClosedAt()).setOriginPrice(merchandise.getOriginPrice())
						.setSalePrice(merchandise.getSalePrice()).setDiscountRate(merchandise.getDiscountRate())
						.setDiscountDeadline(merchandise.getDiscountDeadline()).setDisplayState(merchandise.getDisplayState());
						
		return searchedMerchandise;
	}

	@Override
	public int deleteById(Long id) {
		MerchandiseDTO merchandise = merchandiseMapper.selectById(id);
		int affectedRowCount = merchandiseMapper.deleteById(id);
		
		return affectedRowCount;
	}

}

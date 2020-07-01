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
	
	private MerchandiseMapper merchandiseMapper;

	@Autowired
	public MerchandiseServiceImpl(MerchandiseMapper merchandiseMapper) {
		this.merchandiseMapper = merchandiseMapper;
	}

	@Override
	public MerchandiseDTO create(MerchandiseDTO merchandise) {
		int affectedRowCount = merchandiseMapper.insert(merchandise);
		MerchandiseDTO registeredMerchandise = merchandiseMapper.selectById(merchandise.getId());
		return registeredMerchandise;
	}

	@Override
	public MerchandiseDTO readById(Long id) {
		MerchandiseDTO searchedMerchandise = merchandiseMapper.selectById(id);
		return searchedMerchandise;
	}

	@Override
	public List<MerchandiseDTO> readAll() {
		List<MerchandiseDTO> merchandises = merchandiseMapper.selectAll();
		return merchandises;
	}

	@Override
	public MerchandiseDTO updateById(Long id, MerchandiseDTO merchandise) {
		MerchandiseDTO updatedMerchandise = merchandiseMapper.selectById(id);
		
		updatedMerchandise.setCodeType(merchandise.getCodeType()).setName(merchandise.getName())
		.setDescription(merchandise.getDescription()).setUpdatedAt(merchandise.getUpdatedAt())
		.setClosedAt(merchandise.getClosedAt()).setOriginPrice(merchandise.getOriginPrice())
		.setSalePrice(merchandise.getOriginPrice());
	
		int affectedRowCount = merchandiseMapper.updateById(updatedMerchandise);
		return updatedMerchandise;
	}

	@Override
	public int deleteById(Long id) {
		int affectedRowCount = merchandiseMapper.deleteById(id);
		return affectedRowCount;
	}

}

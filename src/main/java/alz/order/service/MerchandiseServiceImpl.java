package alz.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.order.domain.MerchandiseDTO;
import alz.order.mapper.MerchandiseMapper;

@Service
public class MerchandiseServiceImpl implements MerchandiseService {

	// mapper 가져와서 사용

	private MerchandiseMapper merchandiseMapper;

	@Autowired
	public MerchandiseServiceImpl(MerchandiseMapper merchandiseMapper) {
		this.merchandiseMapper = merchandiseMapper;
	}

	@Override
	public MerchandiseDTO create(MerchandiseDTO merchandise) {
		int merchandiseRowCnt = merchandiseMapper.insert(merchandise);
		MerchandiseDTO createMerchandise = merchandiseMapper.selectById(merchandise.getId());

		return createMerchandise;
	}

	@Override
	public MerchandiseDTO readById(Long id) {
		MerchandiseDTO searchMerchandise = merchandiseMapper.selectById(id);
		return searchMerchandise;
	}

	@Override
	public List<MerchandiseDTO> readAll() {
		List<MerchandiseDTO> merchandises = merchandiseMapper.selectAll();
		return merchandises;
	}

	@Override
	public MerchandiseDTO updateById(Long id, MerchandiseDTO merchandise) {
		MerchandiseDTO searchMerchandise = merchandiseMapper.selectById(id);
		searchMerchandise.setId(merchandise.getId()).setCodeType(merchandise.getCodeType())
				.setName(merchandise.getName()).setDiscription(merchandise.getDiscription())
				.setRegisteAt(merchandise.getRegisteAt()).setClosedAt(merchandise.getClosedAt())
				.setOriginPrice(merchandise.getOriginPrice()).setSalePrice(merchandise.getSalePrice())
				.setDiscountRate(merchandise.getDiscountRate()).setDiscountDeadline(merchandise.getDiscountDeadline())
				.setDisplayState(merchandise.getDisplayState());
		int merchandiseRowCnt = merchandiseMapper.updateById(searchMerchandise);
		return searchMerchandise;
	}

	@Override
	public int deleteById(Long id) {
		MerchandiseDTO searchMerchandise = merchandiseMapper.selectById(id);
		int merchandiseRowCnt = merchandiseMapper.deleteById(id);
		return merchandiseRowCnt;
	}

}

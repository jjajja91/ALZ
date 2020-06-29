package alz.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import alz.order.domain.PaymentDTO;

@Service
public class PaymentServiceImpl implements PaymentService {

	//mapper 가져오기
	
	@Override
	public PaymentDTO create(PaymentDTO payment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaymentDTO readById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PaymentDTO> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaymentDTO updateById(Long id, PaymentDTO payment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteById(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

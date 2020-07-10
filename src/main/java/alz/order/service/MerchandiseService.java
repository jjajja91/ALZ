package alz.order.service;

import java.util.List;

import alz.order.domain.CartDTO;
import alz.order.domain.MerchandiseCriteria;
import alz.order.domain.MerchandiseDTO;

public interface MerchandiseService {

	MerchandiseDTO create(MerchandiseDTO merchandise);

	MerchandiseDTO readById(Long id);

	List<MerchandiseDTO> readAll();

	List<MerchandiseDTO> readAll(MerchandiseCriteria cri);

	MerchandiseDTO updateById(Long id, MerchandiseDTO merchandise);

	int deleteById(Long id);

	MerchandiseDTO update(MerchandiseDTO merchandise);

	int getTotal(MerchandiseCriteria cri);

	// 1. 장바구니추가
	public void insertCart(CartDTO cart);

	// 2. 장바구니 목록
	List<CartDTO> listCart(long id);

	// 3. 장바구니 삭제
	public void deleteCart(long cartNum);

	// 4. 장바구니 수정
	public void modifyCart(CartDTO cart);

	// 5. 장바구니 금액 합계
	public int sumMoney(long id);

	// 6. 장바구니 상품확인
	public int countCart(long gdsNum, long id);

	// 7. 장바구니 상품수량 변경
	public void updateCart(CartDTO cart);

}

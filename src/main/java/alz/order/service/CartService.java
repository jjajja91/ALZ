package alz.order.service;

import java.util.List;

import alz.order.domain.CartDTO;
import alz.order.domain.MerchandiseCriteria;
import alz.order.domain.MerchandiseDTO;

public interface CartService {

	// 1. 장바구니추가
	public void insertCart(CartDTO cart);

	// 2. 장바구니 목록
	List<CartDTO> listCart(String cartNick);

	// 3. 장바구니 삭제
	public void deleteCart(long cartId);

	// 4. 장바구니 수정
	public void modifyCart(CartDTO cart);

	// 5. 장바구니 금액 합계
	public int sumMoney(String cartNick);

	// 6. 장바구니 상품확인
	public int countCart(long merchandiseId, String cartNick);

	// 7. 장바구니 상품수량 변경
	public void updateCart(CartDTO cart);

}

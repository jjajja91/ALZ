package alz.order.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import alz.order.domain.CartDTO;
import alz.order.domain.MerchandiseCriteria;
import alz.order.domain.MerchandiseDTO;
import alz.order.mapper.CartMapper;
import alz.order.mapper.MerchandiseMapper;
import lombok.extern.log4j.Log4j;
import alz.classes.domain.ClassDTO;

@Service
@Log4j
public class CartServiceImpl implements CartService {

	private CartMapper cartMapper;

	@Autowired
	public CartServiceImpl(CartMapper cartMapper) {
		this.cartMapper = cartMapper;
	}

	@Override
	public void insertCart(CartDTO cart) {
		cartMapper.insertCart(cart);
	}

	@Override
	public List<CartDTO> listCart(String cartNick) {
		return cartMapper.listCart(cartNick);
	}

	@Override
	public void deleteCart(long cartId) {
		cartMapper.deleteCart(cartId);
	}

	@Override
	public void modifyCart(CartDTO cart) {
		cartMapper.modifyCart(cart);
	}

	@Override
	public int sumMoney(String cartNick) {
		return cartMapper.sumMoney(cartNick);
	}

	@Override
	public int countCart(long merchandiseId, String cartNick) {
		return cartMapper.countCart(merchandiseId, cartNick);
	}

	@Override
	public void updateCart(CartDTO cart) {
		cartMapper.updateCart(cart);
	}

}

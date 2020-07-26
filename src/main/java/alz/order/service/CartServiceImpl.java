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
import alz.lesson.domain.LessonDTO;


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
	public List<CartDTO> listCart(long userId) {
		return cartMapper.listCart(userId);
	}

	@Override
	public void deleteCart(long id) {
		cartMapper.deleteCart(id);
	}

	@Override
	public void modifyCart(CartDTO cart) {
		cartMapper.modifyCart(cart);
	}

	@Override
	public int sumMoney(long userId) {
		return cartMapper.sumMoney(userId);
	}

	@Override
	public int countCart(long merchandiseId, long userId) {
		return cartMapper.countCart(merchandiseId, userId);
	}

	@Override
	public void updateCart(CartDTO cart) {
		cartMapper.updateCart(cart);
	}

	@Override
	public void delete(CartDTO cart) {
		cartMapper.delete(cart);
	}

}

package alz.order.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Setter
@Getter
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CartDTO {
	private long cartId;
	private String cartNick;
	private long merchandiseId;
	private long amount;
	private Date addDate;
	private String name; // 상품 이름
	private int originPrice; // 상품 단가
	private int money; // 상품 가격
}

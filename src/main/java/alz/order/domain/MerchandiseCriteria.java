package alz.order.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MerchandiseCriteria {

	private int pageNum;
	private int amount;
	
	public MerchandiseCriteria() {
		this(1,10);
	}

	public MerchandiseCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}

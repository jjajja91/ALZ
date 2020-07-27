package alz.myPage.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Getter
@Setter
@ToString
@Accessors(chain=true)
public class MyPageCriteria {

	private int pageNum;
	private int amount;
	private int writerId;
	
	public MyPageCriteria() {
		this(1,10);
	}
	
	public MyPageCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public MyPageCriteria(int pageNum, int amount, int writerId) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.writerId = writerId;
	}
	
	/*
	 * public String[] getTypeArr() { return type == null? new String[] {}:
	 * type.split(""); }
	 */
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("writerId", this.getWriterId())
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount());
				
		return builder.toUriString();
	}
	
}

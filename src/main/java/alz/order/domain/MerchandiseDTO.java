package alz.order.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Getter
@Setter
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MerchandiseDTO {

//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Long id;
	private String codeType;
	private String name;
	private String description;
	private Date registerAt;
	private Date updatedAt;
	private Date closedAt;
	private Long originPrice;
	private Long salePrice;
	private Double discountRate;
	private Date discountDeadline;
	private Integer displayState;
	private Long userId;
	private Long refId;
	private Long merchandiseId;

}

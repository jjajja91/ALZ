package alz.order.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

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
	@NotBlank(message = "상품명을 입력해주세요")
	@Size(min=1, max=50, message="제목은 50자 이내로 입력해주세요")
	private String name;
	@NotBlank(message = "상품 타입을 선택해주세요")
	private String codeType;
	@NotBlank(message = "상품 내용을 입력해주세요")
	@Size(min=1, max=500, message="내용은 500자 이내로 입력해주세요")
	private String description;
	private Date registerAt;
	private Date updatedAt;
	@NotBlank(message = "상품 마감일을 입력해주세요")
	private Date closedAt;
	@NotNull(message = "상품 가격을 입력해주세요")
	private Long originPrice;
	private Long salePrice;
	private Double discountRate;
	private Date discountDeadline;
	private Integer displayState;
	private Long userId;
	@NotNull(message = "서버 오류입니다")
	private Long refId;
	@NotNull(message = "서버 오류입니다")
	private Long merchandiseId;

}

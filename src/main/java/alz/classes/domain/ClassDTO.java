package alz.classes.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

@Getter
@Setter
@Builder
@Accessors(chain=true)
@NoArgsConstructor
@AllArgsConstructor
public class ClassDTO {

	private Long id;
	private String name;
	private String discription;
	private Date openAt;
	private Date closeAt;
	private String startAt;
	private String endAt;
	private String state;
	private Long studentCnt;
	private Long likeCnt;
	private Long reservCnt;
	private Double rate;
	private Long categoryId;
	private Long teacherId;
	
}

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
public class ClassRequestDTO {
	
		private String name;
		private String description;
		private Date openAt;
		private Date closeAt;
		private String startAt;
		private String endAt;
		private Long categoryId;
		private Long teacherId;
		
}

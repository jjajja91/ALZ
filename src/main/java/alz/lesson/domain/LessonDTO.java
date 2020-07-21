package alz.lesson.domain;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

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
@Accessors(chain=true)
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LessonDTO {

	private Long id;
	@NotEmpty
	private Long teacherId;
	private Long categoryId;
	private String categoryName;
	private String title;
	private String lessonType;
	private String lessonLevel;
	private Long minStudent;
	private Long maxStudent;
	private Long currentStudent;
	private String state;
	private Date openAt;
	private Date closeAt;
	private String startAt;
	private String endAt;
	
}

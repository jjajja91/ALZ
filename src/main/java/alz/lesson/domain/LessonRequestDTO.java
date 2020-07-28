package alz.lesson.domain;

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
public class LessonRequestDTO {
	
	private Long teacherId;
	private Long categoryId;
	private String title;
	private String lessonType;
	private String lessonLevel;
	private Long minStudent;
	private Long maxStudent;
	private Date openAt;
	private Date closeAt;
	private String startAt;
	private String endAt;
		
}

package alz.lesson.domain;

import java.sql.Date;
import java.util.List;

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
public class ScheduleDTO {

	private Long id;
	@NotEmpty
	private Long lessonId;
	private List<timeTableDTO> timeList;
}
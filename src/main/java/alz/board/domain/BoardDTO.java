package alz.board.domain;

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
public class BoardDTO {
	
	private Long id;
	private String title;
	private String content;
	private Date writtenAt;
	private Date updatedAt;
	private Long depth;
	private Long bOrder;
	private Long likeCnt;
	private Long commentCnt;
	private Long viewCnt;
	private Long writerId;
	private Long parentId;
	private Long typeId;


}

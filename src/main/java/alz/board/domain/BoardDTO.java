package alz.board.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import alz.file.domain.BoardFileDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Getter
@Setter
@ToString
@Builder
@Accessors(chain=true)
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	
	private Long id;
	@NotBlank
	private String title;
	@NotBlank
	private String content;
	private Date writtenAt;
	private Date updatedAt;
	private Long bOrder;
	private Long likeCnt;
	private Long commentCnt;
	private Long viewCnt;
	private String nickname;
	private Long parentId;
	private Long typeId;
	
	private List<BoardFileDTO> fileList;

		
	


}

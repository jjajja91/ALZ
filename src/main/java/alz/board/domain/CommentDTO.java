package alz.board.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

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
public class CommentDTO {
	
	private Long id;
	@NotBlank(message = "글 내용을 입력해주세요")
	@Size(min=1, max=2000, message="내용은 2000자 이내로 입력해주세요")
	private String content;
	private Date writtenAt;
	private Date updatedAt;
	private Long likeCnt;
	private Long commentCnt;
	private String commentCode;
	private Long boardId;
	private String nickname;
	private Long depth;
	private String deleted;

}

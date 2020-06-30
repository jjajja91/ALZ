package alz.user.domain;

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
public class UserDTO {

	private Long id;
	private String email;
	private String nickName;
	private String password;
	private String role;
	private Integer certificationState;
	private Date recentlogAt;
	private Date modifiedAt;
	private String introduce;
	private Long likeCnt;
	private Long boardCnt;
	private Long reservCnt;
	private Long commentCnt;
	private String state;
	private Date startAt;
	private Date endAt;
	
}

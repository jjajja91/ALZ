package alz.user.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {

	private Long id;
	private String email;
	private String nickName;
	private String password;
	private String role;
	private int certificationState;
	private Date recentlogAt;
	private Date modifiedAt;
	private String introduce;
	private Long likeCnt;
	private Long boardCnt;
	private Long reservCnt;
	private Long commentCnt;
	
}

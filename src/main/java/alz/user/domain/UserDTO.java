package alz.user.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

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
	@NotBlank(message = "이메일을 입력해주세요")
//	@Pattern(regexp="^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$", message="이메일 형식에 맞게 작성해주세요.")
	private String email;
	@NotBlank(message = "닉네임을 입력해주세요")
	@Pattern(regexp="^[가-힣ㄱ-ㅎㅏ-ㅣ]*${6,12}", message="닉네임은 6~12자리 이내의 한글로 작성해주세요.")
	private String nickname;
	@NotBlank(message = "비밀번호를 입력해주세요")
	@Pattern(regexp="[1-9]{6,12}", message = "비밀번호는 6~12자리 이내의 숫자로 입력해주세요.")
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

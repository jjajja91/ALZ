package alz.user.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.security.crypto.password.PasswordEncoder;

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
	private String nickname;
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
	private String phoneNumber;
	private String state;
	private Date startAt;
	private Date endAt;
	
	public void encodePassword(PasswordEncoder passwordEncoder) {
		this.password = passwordEncoder.encode(this.password);
	}
	
}

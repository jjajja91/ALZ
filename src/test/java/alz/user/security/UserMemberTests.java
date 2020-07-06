package alz.user.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class UserMemberTests {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testInsertMember() {
		String sql = "insert into alz_user(id, email, nickName, password, role, introduce) values(?,?,?,?,?,?)";
		for (int i = 0; i < 20; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(4, pwencoder.encode("pw" + i));

				if (i < 10) {
					pstmt.setLong(1, i);
					pstmt.setString(2, "user" + i + "@aaa.com");
					pstmt.setString(3, "일반사용자" + i);
					pstmt.setString(5, "ROLE_USER");
					pstmt.setString(6, "하-위" + i);
				} else if (i < 15) {
					pstmt.setLong(1, i);
					pstmt.setString(2, "manager" + i + "@aaa.com");
					pstmt.setString(3, "운영자" + i);
					pstmt.setString(5, "ROLE_MANAGER");
					pstmt.setString(6, "하-위" + i);
				} else {
					pstmt.setLong(1, i);
					pstmt.setString(2, "admin" + i + "@aaa.com");
					pstmt.setString(3, "관리자" + i);
					pstmt.setString(5, "ROLE_ADMIN");
					pstmt.setString(6, "하-위" + i);
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
					}
				}
			}
		} // end for
	}

	@Test
	public void testInsertState() {
		String sql = "insert into alz_user_state(id, state) values(?,?)";
		for (int i = 0; i < 20; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				if (i < 10) {
					pstmt.setLong(1, i);
					pstmt.setString(2, "1");
				} else if (i < 15) {
					pstmt.setLong(1, i);
					pstmt.setString(2, "2");
				} else {
					pstmt.setLong(1, i);
					pstmt.setString(2, "3");
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
					}
				}
			}
		} // end for
	}
}

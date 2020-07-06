<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily UI | #001 - Sign Up</title>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

html {
	height: 100%;
}

body {
	/* background-color: #555555; */
	background-color: #354152;
	color: #7e8ba3;
	font: 300 1rem/1.5 Helvetica Neue, sans-serif;
	margin: 0;
	min-height: 100%;
}

.align {
	align-items: center;
	display: flex;
	flex-direction: row;
}

.align__item--start {
	align-self: flex-start;
}

.align__item--end {
	align-self: flex-end;
}

.site__logo {
	margin-bottom: 2rem;
}

input {
	border: 0;
	font: inherit;
}

input::placeholder {
	/* color: #ffe4c9; */
	color: #6d6d69;
}

.form__field {
	margin-bottom: 1rem;
}

.form input {
	outline: 0;
	padding: 0.5rem 1rem;
}

.form input[type="email"], .form input[type="password"] {
	width: 100%;
}

.grid {
	margin: 0 auto;
	max-width: 25rem;
	width: 100%;
}

h2 {
	font-size: 2.75rem;
	font-weight: 100;
	margin: 0 0 1rem;
	text-transform: uppercase;
}

svg {
	height: auto;
	max-width: 100%;
	vertical-align: middle;
}

a {
	color: #7e8ba3;
}

.register {
	box-shadow: 0 0 250px #000;
	text-align: center;
	padding: 4rem 2rem;
}

.register input[type="email"], .register input[type="password"], .register input[type="text"], .register input[type="submit"] {
	border: 1px solid #242c37;
	border-radius: 999px;
	background-color: transparent;
	text-align: center;
}

.register input[type="email"], .register input[type="password"], .register input[type="text"] {
	background-repeat: no-repeat;
	background-size: 1.5rem;
	background-position: 1rem 50%;
}

.register input[type="button"] {
	background-color: transparent;
	text-align: center;
	color: #7e8ba3;
	margin-left: 10px;
}

.register input[type="email"] {
	background-image:
		url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="#242c37"><path d="M256.017 273.436l-205.17-170.029h410.904l-205.734 170.029zm-.034 55.462l-205.983-170.654v250.349h412v-249.94l-206.017 170.245z"/></svg>');
}

.register input[type="password"] {
	background-image:
		url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="#242c37"><path d="M195.334 223.333h-50v-62.666c0-61.022 49.645-110.667 110.666-110.667 61.022 0 110.667 49.645 110.667 110.667v62.666h-50v-62.666c0-33.452-27.215-60.667-60.667-60.667-33.451 0-60.666 27.215-60.666 60.667v62.666zm208.666 30v208.667h-296v-208.667h296zm-121 87.667c0-14.912-12.088-27-27-27s-27 12.088-27 27c0 7.811 3.317 14.844 8.619 19.773 4.385 4.075 6.881 9.8 6.881 15.785v22.942h23v-22.941c0-5.989 2.494-11.708 6.881-15.785 5.302-4.93 8.619-11.963 8.619-19.774z"/></svg>');
}

.register input[type="submit"] {
	/* background-image: linear-gradient(160deg, #af7e67 0%, #5f3d1a 100%); */
	background-image: linear-gradient(160deg, #8ceabb 0%, #378f7b 100%);
	color: #fff;
	margin-bottom: 6rem;
	width: 100%;
}

.btn {
margin-left: 10px;
}

</style>
</head>
<body class="align">
	<div class="grid align__item">
		<div class="register">
			<h2>Sign Up</h2>
				<form onSubmit="return formCheck()" class="form" name="registerForm" action="/member/register" method="post">
<!-- 				<form onSubmit="return formCheck()" class="form" name="registerForm" action="registerAction.jsp" method="post"> -->
				<div class="form__field">
					<input type="text" placeholder="Your ID" name="userid" id="userid" onkeydown="inputIdcheck" required> 
					<!--onkeydown은 사용자가 중복체크를 하고 난 뒤 아이디 입력란에 사용 가능한 아이디를 지우고 새로운 아이디를 입력했을 경우  중복처리 안된 걸로 처리되도록-->
					<input type="button" class="btn" value="Confirm ID" onclick="openIdCheck()"></button> <!--중복확인 버튼 누르면 해당 창을 띄움  -->
					<input type="hidden" name="idDuplication" value="idUncheck"> <!--value가 idUncheck이면 중복체크 안한것  -->
				</div>
			
				<div class="form__field">
					<input type="password" placeholder="Your Name" name="name" id="name" required>
				</div>

				<div class="form__field">
					<input type="email" placeholder="info@mailaddress.com" name="email" id="email" required>
				</div>

				<div class="form__field">
					<input type="password" placeholder="Your Password" name="password" id="password" required> 
				</div>

				<div class="form__field">
					<input type="submit" value="Sign Up">
				</div>
			</form>
			<p>
				Already have an account? <a href="#">Sign in</a>
			</p>
		</div>
	</div>
	<script>
		function openIdCheck() {
			var userid = document.getElementById("userid").value;
			if (userid) {
				url = "/duplicationForm.jsp?userid=" + userid;
				window.open(url, "chkid", "width=400,height=200");
			} else {
				alert("아이디를 입력하세요");
			}
		}

		//폼의 모든 필드의 유효성 검사

		function formCheck() {
			// 아이디와 패스워드가 적합한지 검사할 정규식
			var re = /^[a-zA-Z0-9]{4,12}$/;
			// 이메일이 적합한지 검사할 정규식
			var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			var id = document.getElementById("userid");
			var psw = document.getElementById("password");
			var name = document.getElementById("name");
			var email = document.getElementById("email");

			if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
				return false;
			}

			if (!check(re, psw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
				return false;
			}
			if (email.value == "") {
				alert("이메일을 입력해 주세요");
				email.focus();
				return false;
			}

			if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
				return false;
			}

			if (registerForm.name.value == "") {
				alert("이름을 입력해 주세요");
				registerForm.name.focus();
				return false;
			}
			return true;
		}

		function check(re, what, message) {
			if (re.test(what.value)) {
				return true;
			}
			alert(message);
			what.value = "";
			what.focus();
			//return false;
		}

		/*중복체크 통과 후 입력된 아이디를 제거하고 새로 입력하면 중복체크 다시 안된 걸로 하기 위함  */
		function inputIdcheck() {
			document.userInfo.idDuplication.value = "idUncheck";
		}
	</script>
</body>
</html>
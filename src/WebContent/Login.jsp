<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="Login-css.css" />
</head>
<body>
	<div id="outercontainer">
		<div id="top">
		
		</div>
		<br>
		<div id="middle">
		
			<div class="whiteText" style="font-size:50px; padding-bottom: 10px; ">
				Login<br>
			</div>
			<form action="Validate" id="signUpform" method="POST">
				<strong>
				Username <br>
				<input type="text" name="userName" value="" style="width:250px;">
				<span id="userNameEmpty" style="color:red;"></span>
				<br>
				Password <br>
				<input type="password" name="password" value="" style="width:250px;">
				<span id="passwordEmpty" style="color:red;"></span>
				<br>
				<span id="dontmatch" style="color:red;"></span>
				</strong>
			</form>
			<button type="submit" form="signUpform" method="POST" value="Submit" style="opacity:0.8; background-color:#000033; color:white;">Login</button>
		
		</div>
		<br>
		<script type="text/javascript">
			var userNameEmpty = <%=session.getAttribute("usernameEmpty")%>;
			var dontmatch = <%=session.getAttribute("dontmatch")%>;
			var passwordEmpty = <%=session.getAttribute("passwordEmpty")%>;
			
			if(userNameEmpty === true) document.getElementById("userNameEmpty").innerHTML = "Username cannot be empty!";
			else document.getElementById("userNameEmpty").innerHTML = "";
			if(passwordEmpty === true) document.getElementById("passwordEmpty").innerHTML = "Password cannot be empty!";
			else document.getElementById("passwordEmpty").innerHTML = "";
			if((dontmatch === true) && (userNameEmpty === false) && (passwordEmpty ===false) ) document.getElementById("dontmatch").innerHTML = "Password and Username do not match";
			else document.getElementById("dontmatch").innerHTML = "";
		</script>
		
		<div id="bottom">
		
		</div>
	</div>

</body>
</html>
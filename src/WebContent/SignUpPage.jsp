<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="SignUp-css.css" />
	<title>Sign Up</title>
</head>
<body>
	<div id="outercontainer">
		<div id="top"></div>
		<br>
		<div id="middle">
		
			<div class="whiteText" style="font-size:50px; padding-bottom: 10px; ">
				Sign Up <br>
			</div>
			<form action="SignUpServlet" id="signUpform" method="POST">
				<strong>
				Username <br>
				<input type="text" name="userName" value="" style="width:250px;">
				<span id="userNameEmpty" style="color:red;"></span>
				<span id="userNameExists" style="color:red;"></span>
				<br>
				Password <br>
				<input type="password" name="password" value="" style="width:250px;">
				<span id="passwordEmpty" style="color:red;"></span>
				<br>
				Image URL<br>
				<input type="text" name="image-url" value="" style="width:250px;">
				<span id="imageEmpty" style="color:red;"></span>
				<br>
				</strong>
			</form>
			
			<button type="submit" form="signUpform" method="POST" value="Submit" style="opacity:0.8; background-color:#000033; color:white;">Sign Up</button>
		
		</div>
		<br>
		<script type="text/javascript">
			var userNameEmpty = <%=session.getAttribute("usernameEmpty")%>;
			var userNameExists = <%=session.getAttribute("usernameExists")%>;
			var passwordEmpty = <%=session.getAttribute("passwordEmpty")%>;
			var imageEmpty = <%=session.getAttribute("imageEmpty")%>;
			
			if(userNameEmpty === true) document.getElementById("userNameEmpty").innerHTML = "Username cannot be empty!";
			else document.getElementById("userNameEmpty").innerHTML = "";
			if(userNameExists === true) document.getElementById("userNameExists").innerHTML = "Username already exists!";
			else document.getElementById("userNameExists").innerHTML = "";
			if(imageEmpty === true) document.getElementById("imageEmpty").innerHTML = "Image cannot be empty!";
			else document.getElementById("imageEmpty").innerHTML = "";
			if(passwordEmpty === true) document.getElementById("passwordEmpty").innerHTML = "Password cannot be empty!";
			else document.getElementById("passwordEmpty").innerHTML = "";
		</script>
		
		<div id="bottom">
		</div>
		<script type="text/javascript">
		</script>
	</div>
</body>
</html>
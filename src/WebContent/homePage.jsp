<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>LibraMate</title>
		<link rel="stylesheet" type="text/css" href="home-css.css" />
		<script type="text/javascript">
			window.onload = function(){
				var xhttp = new XMLHttpRequest();
				var url = "LoadJSON";
				xhttp.open("GET",url,false);
				xhttp.send();
		};
		</script>
	</head>
	<body>
	<div id="outercontainer">
		<div id="top"></div>
		<div id="middle">
			<div id="title">
				LibraMate
			</div>
			<form name="searchBar" method="GET" action= "search">
						<div id="searchBar"><input type="text" name="searchTerm" style="width:40%; height: 20px;"></div>
						<table align="center">
							<tr>
								<td align="left"><input type=radio id="type1" name="searchType" value="intitle" checked= "checked"><strong>Title</strong></td>
								<td align="left"><input type = radio id="type2" name="searchType" value="isbn"> <strong>ISBN</strong></td>
							</tr>
							<tr>
								<td align="left"><input type=radio id="type3" name="searchType" value="inauthor"> <strong>Author</strong> </td>
								<td align="left"><input type=radio id="type4" name="searchType" value="subject"> <strong>Genre</strong> </td>
						</table>
						<input type="hidden" value="0" id="searchIdentifier" name="searchIdentifier">
					</form>
			<div id="SignUpButton">
			  	<form method="GET" action="SignUpPage.jsp">
					<button>SIGN UP</button>
				</form>
			</div>
			
			<br>
			<div id="LoginButton">
				<form method="GET" action="Login.jsp">
					<button>LOGIN</button>
				</form>
			</div>
		</div>
		<div id="bottom"></div>
	</div>
	</body>
</html>
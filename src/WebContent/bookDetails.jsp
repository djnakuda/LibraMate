<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Results</title>
		<link rel="stylesheet" type="text/css" href="bookDetails-css.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<style>
		.dropbtn {
		    background-color: black;
		    color: white;
		    padding: 20px;
		    font-size: 32px;
		    border: none;
		    cursor: pointer;
		    padding-right: 40px;
		    margin-left: 100px;
		}
		
		.dropbtn:hover, .dropbtn:focus {
		    background-color: black;
		}
		
		.dropdown {
		    position: relative;
		    display: inline-block;
		}
		
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #737373;
		    min-width: 160px;
		    font-size: 32px;
		    overflow: auto;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    z-index: 1;
		    color: white;
		     margin-left: 100px;
		}
		
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		}
		
		.dropdown a:hover {background-color: #ddd}
		
		.show {display:block;}
		
		#outerContainer{
			background-color: #4db8ff;
			width:100%;
		}
		#topnav{
			overflow: hidden;
			background-color: #39ac73;
			padding-bottom: 10px;
			margin-bottom: 20px;
			width:100%;
		}
		#mainbody{
			width:100%;
		}
		 .whiteText{
		    display: block;
		    color: black;
		    padding: 14px 16px;
		    font-family: Arial;
		    color:  #f2f2f2;
		    text-shadow:
		    -1px -1px 0 #000,
		    1px -1px 0 #000,
		    -1px 1px 0 #000,
		     1px 1px 0 #000; 
		    text-decoration: none; 
		}
		#topnav input[type=text] {
		    float: left;
		    padding: 6px;
		    border: none;
		    margin-top: 8px;
		    margin-right: 16px;
		    font-size: 17px;
		    margin-top:27px;
		    width: 40%;
		}
		#topnav table{
			float: left;
			margin-top: 20px;
		}
		.img-border{
			border-width: 5px;
			border-color: gray;
			border-style: solid;
			margin-right: 20px;
		}
		#mainBody{
			height:1000px;
		}
		.btn {
			    border: none; /* Remove borders */
			    padding: 12px 16px; /* Some padding */
			    font-size: 16px; /* Set a font size */
			    cursor: pointer; /* Mouse pointer on hover */
			    position: relative;
				left: 465px;
				bottom: -65px;
				cursor:pointer;
				width: 0;
				font-size: 17pt;
				background-color: transparent;
			}
			.book{
				float: left;
				width: 400px;
				text-align:center;
				padding 5px;
				padding-bottom: 20px;
				
			}
			.clear{
				clear: both;
			}
			.book-imgs{
				align="middle"
			}
			.bookTitle{
				color:black;
				font-weight:bold;
				text-decoration: none;
			}	
	</style>
		<script>
			function findGetParameter(parameterName) {
			    var result = null,
			        tmp = [];
			    var items = location.search.substr(1).split("&");
			    for (var index = 0; index < items.length; index++) {
			        tmp = items[index].split("=");
			        if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
			    }
			    return result;
			}
			
			var xhttp = new XMLHttpRequest();
			var url = document.URL;
			var bookId = findGetParameter("id");
			url = "https://www.googleapis.com/books/v1/volumes/" + bookId;
			xhttp.open("GET",url,false);
			xhttp.send();
			var x = JSON.parse(xhttp.responseText);
			
			function displayBook()
			{
				var description = "";
				if(x.volumeInfo.description) description = x.volumeInfo.description;
				
				
				document.write("<img src=" + x.volumeInfo.imageLinks.thumbnail + "><br>");		
				document.write("<div class=\"whitetext\">");
				document.write("<strong>");
				document.write(x.volumeInfo.title);
				document.write(" by " + x.volumeInfo.authors + "<br><br>");
				document.write("Publisher: "); 
				document.write("</div>");
				document.write(x.volumeInfo.publisher + "<br><br>");
				document.write("Description: <br>")
				document.write("<p>"+ description +"</p>");
				document.write("</strong>");
				var rating = x.volumeInfo.averageRating;
				document.write("Ratings: <br>")
				if(rating){
					for(i = 0; i < rating;i++)
					{
						document.write("<i class= \"fa fa-star\" style=\"color:orange; font-size:50px;\"></i>");
					}
					for(i = 0;i  < (5-rating);i++)
					{
						
						document.write("<span class=\"fa fa-star\" style=\" font-size:50px;\"></span>");
					}
				}
				else{
					for(i = 0; i < 5;i++)
					{
						document.write("<span class=\"fa fa-star\" style=\" font-size:50px;\"></span>");
					}
				}
				document.write("<br>");
				//document.write("</div>");
				
				
				
				
			}
		</script>
		<script>
			/* When the user clicks on the button, 
			toggle between hiding and showing the dropdown content */
			function myFunction() {
			    document.getElementById("myDropdown").classList.toggle("show");
			}
			
			// Close the dropdown if the user clicks outside of it
			window.onclick = function(event) {
			  if (!event.target.matches('.dropbtn')) {
			
			    var dropdowns = document.getElementsByClassName("dropdown-content");
			    var i;
			    for (i = 0; i < dropdowns.length; i++) {
			      var openDropdown = dropdowns[i];
			      if (openDropdown.classList.contains('show')) {
			        openDropdown.classList.remove('show');
			      }
			    }
			  }
			}
	</script>
	<body>
		<div id="topnav">
          	<a href="homePage.jsp" class="whiteText" style="font-size: 50px; float: left;">LibraMate </a>
		 	<button class="btn"><i id="filtersubmit" class="fa fa-book" onclick="changeIcon()"></i></button>
		 	<form  method="GET" action="search" name="myform">
		 		<input type="text" placeholder="Search.." name="searchTerm">
		 		<input type="hidden" value="0" id="searchIdentifier" name="searchIdentifier">
		 		<table id="optionsTablet">
			 		<tr>
			 			 <td align="left"><input type=radio id="type1" name="searchType" value="intitle" checked= "checked"><strong>Title</strong></td>
			 			<td align="left"><input type = radio id="type2" name="searchType" value="isbn"> <strong>ISBN</strong></td>
			 		</tr>
			 		<tr>
			 			<td align="left"><input type=radio id="type3" name="searchType" value="inauthor"> <strong>Author</strong> </td>
	                	<td align="left"><input type=radio id="type4" name="searchType" value="subject"> <strong>Genre</strong> </td>
	                </tr>
                </table>
		 	</form>
		 	<% if(!(session.getAttribute("currUser").equals(""))){%>
			 	<a id="imageLink" href="UserHome.jsp">
			 	<img src="" style="border-radius: 50%; width:75px; float:right" class="img-border" id="profile_picture">
			 	</a>
			 <%} %>
		 	<script type="text/javascript">
			 	var imgLink = "<%=session.getAttribute("CurrUserImg")%>";
				document.getElementById("profile_picture").src= imgLink;
				document.getElementById("imageLink").href = "PopulateUserInfo?username=" + "<%= session.getAttribute("currUser")%>";
				function changeIcon()
				{
					var currIcon = document.getElementById("filtersubmit").className;
					if(currIcon == "fa fa-book") 
					{
							document.getElementById("filtersubmit").className ="fa fa-user";
							document.getElementById("optionsTablet").style = "opacity:0.0";
							document.getElementById("searchIdentifier").value= "1";
					}
					else if(currIcon == "fa fa-user")
					{
						document.getElementById("filtersubmit").className ="fa fa-book";
						document.getElementById("optionsTablet").style = "opacity:1.0";
						document.getElementById("searchIdentifier").value= "0";
					}
				}	
			</script>
       </div>
			<div id="resultsDisplay">
				<script>displayBook();</script>
			</div>
			<%if(!(session.getAttribute("currUser").equals(""))){ %>
				<div class="dropdown">
					<button onclick="myFunction()" class="dropbtn">Library</button>
					  <div id="myDropdown" class="dropdown-content">
					    <a href="" id="readLink">Read</a>
					    <a href="" id="favoriteLink">Favorite</a>
					  </div>
					</div>
			<%} %>
			<script>
				console.log(findGetParameter("id"));
				document.getElementById("readLink").href = "readServlet?id=" + findGetParameter("id") +"&booktoAdd=" + x.volumeInfo.title;
				document.getElementById("favoriteLink").href = "favoriteServlet?id=" + findGetParameter("id") +"&booktoAdd=" + x.volumeInfo.title;
			</script>
	</body>
</html>
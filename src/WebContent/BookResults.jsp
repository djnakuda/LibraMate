<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
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

	
	
	function createBookdiv()
	{	
		var xhttp = new XMLHttpRequest();
		var url = document.URL;
		var searchTerm = findGetParameter("searchTerm");
		var searchType = findGetParameter("searchType");
		url = "https://www.googleapis.com/books/v1/volumes?q=" + searchType+ ":" + searchTerm + "&maxResults=12";
		xhttp.open("GET",url,false);
		xhttp.send();
		var x = JSON.parse(xhttp.responseText);
		
		if(x.items){
			document.write("<table align=\"center\" cellpadding =\"10\"");
			var i = 0;
			var j = 0;
			
			while(i < x.items.length)
			{
				j = 0;
				document.write("<tr>");
				while(j < 4 ){
					
					if(i == x.items.length) break;
					
					var img = null;
					var title = null;
					var author = null;
					var id = null;
					
					if(x.items[i].volumeInfo)
					{
						if(x.items[i].volumeInfo.title) {title = x.items[i].volumeInfo.title;}
						if(x.items[i].volumeInfo.authors) {author =  x.items[i].volumeInfo.authors;}
						if(x.items[i].id) {id = x.items[i].id;}
						if(x.items[i].volumeInfo.imageLinks){
							if(x.items[i].volumeInfo.imageLinks.thumbnail) img = x.items[i].volumeInfo.imageLinks.thumbnail;
						}
					}	
									
					if(img != null && title != null && author != null)
					{ 	
						document.write("<td align=\"center\" width = \"28%\">");
						document.write("<img src="+ img +"style=\"height:50%; width:50%\">");
						document.write("<br>")
						document.write("<strong>");
						document.write("<a href=\"bookDetailsServlet?id=" + id + "\">" )
						document.write(title + "<br>"); 
						document.write("</a>");
						document.write("by " +author + "<br>"); 
						document.write("</strong>");
						document.write("</td>");
						j++;
					}
					 i++;
				}
				document.write("</tr>");
			}
			document.write("</table>");
		}
		else
		{
			document.write("No Results to Display")
			document.write("<br><br><br><br><br><br><br><br><br><br>");
			document.write("<br><br><br><br><br><br><br><br><br><br>");
			document.write("<br><br><br><br><br><br><br><br><br><br>");
			document.write("<br><br><br><br><br><br><br><br><br><br>");
		}
	} 

</script>
</head>
<body>
	<div id="outerContainer">
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
       <div id="mainBody">
       		<script>
				 	createBookdiv();
			</script>
       </div>
     </div>


</body>
</html>
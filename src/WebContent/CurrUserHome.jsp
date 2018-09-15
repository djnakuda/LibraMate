<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
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
		#leftSide{
			float:left;
			margin-left: 20px;
			width: 30%;
			height:100%;
		}
		#followersAndFollowing{
			background-color: #008ae6;
			float:left;
			margin-top: 30px;
			width: 300px;
		}
		#headingOfTable
		{
			border-bottom: lightblue 2px solid;
			text-align: center;
			width:100%;
		}
		.tab {
    		overflow: hidden;
    		border: 1px solid #ccc;
			}
		.tab2 {
    		overflow: hidden;
			}
		.tab button {
		    float: left;
		    border: none;
		    outline: none;
		    cursor: pointer;
		    padding: 14px 16px;
		    transition: 0.3s;
		    font-size: 17px;
		    width:50%;
		}
		.tab2 button {
		    float: left;
		    border: none;
		    outline: none;
		    cursor: pointer;
		    padding: 14px 16px;
		    transition: 0.3s;
		    font-size: 17px;
		    width:50%;
		}
		.tab2 button:hover {
		    background-color:  #004d80;
		}
		.tab button:hover {
		    background-color:  #004d80;
		}

		/* Create an active/current tablink class */
		.tab button.active {
		    background-color:  #004d80;
		}
		.tab2 button.active {
		    background-color:  #004d80;
		}

		/* Style the tab content */
		.tabcontent {
		    display: none;
		    padding: 6px 12px;
		    border: 1px solid #008ae6;;
		    border-top: none;
		    display: block;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    font-family: Arial;
		    color:  #f2f2f2;
		    text-shadow:
		    -1px -1px 0 #000,
		    1px -1px 0 #000,
		    -1px 1px 0 #000,
		     1px 1px 0 #000;
		}
		.tabcontent2{
		    display: none;
		    padding: 6px 12px;
		    border: 1px solid #008ae6;;
		    border-top: none;
		    display: block;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    font-family: Arial;
		    color:  #f2f2f2;
		    text-shadow:
		    -1px -1px 0 #000,
		    1px -1px 0 #000,
		    -1px 1px 0 #000,
		     1px 1px 0 #000;
		}
		.tablinks{
			display: block;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    font-family: Arial;
		    color:  #f2f2f2;
		    text-shadow:
		    -1px -1px 0 #000,
		    1px -1px 0 #000,
		    -1px 1px 0 #000,
		     1px 1px 0 #000;
		     background-color:  #008ae6;
		}
		.tablinks2{
			display: block;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    font-family: Arial;
		    color:  #f2f2f2;
		    text-shadow:
		    -1px -1px 0 #000,
		    1px -1px 0 #000,
		    -1px 1px 0 #000,
		     1px 1px 0 #000;
		     background-color:  #008ae6;
		}

		#rightside{
			width: 65%;
			float:left;
		}

		#rightside button{
			border-radius: 0px;
			font-family: Arial;
			color: #ffffff;
			font-size: 20px;
			background-color: #003d66;
			padding: 10px 20px 10px 20px;
			text-decoration: none;
		    text-shadow:
		    -1px -1px 0 #000,
		    1px -1px 0 #000,
		    -1px 1px 0 #000,
		     1px 1px 0 #000;
		     font-weight: bold;
		     border-style: solid;
		     border-color: #003d66;

		}
		#booksDisplay{
			background-color:  #008ae6;
		}
		html, body{
			pading: 0;
			margin: 0;
		}
		/*#filtersubmit {
		    position: relative;
		    z-index: 1;
		    left: -50px;
		    bottom: -35px;
		    cursor:pointer;
		    width: 0;
		    font-size: 16pt;
		}*/
		.btn {
			    border: none; /* Remove borders */
			    padding: 12px 16px; /* Some padding */
			    font-size: 16px; /* Set a font size */
			    cursor: pointer; /* Mouse pointer on hover */
			    position: relative;
				left: 530px;
				bottom: -70px;
				cursor:pointer;
				width: 0;
				font-size: 17pt;
				background-color: transparent;
			}
			
	</style>
	
	<script type="text/javascript">
		function createBooks(){
		<% ArrayList<String> displayList = (ArrayList<String>)session.getAttribute("favoriteBooks"); 
       		if(displayList.size() == 0){ %>
       			document.write("No Book Found!");
       			<%}else
           		{ %>
           			document.write("<table>");
           			<% for(int i= 0; i < displayList.size();i++ )
           			{
           				if((i%2) == 0){%>
           				document.write("<tr>");
           			<%} %>
           				document.write("<td>");
           				
           				var xhttp = new XMLHttpRequest();
           				var searchTerm = "<%=displayList.get(i)%>";
           				var url = "https://www.googleapis.com/books/v1/volumes?q=intitle:" + searchTerm + "&maxResults=1";
           				xhttp.open("GET",url,false);
           				xhttp.send();
           				var x = JSON.parse(xhttp.responseText);
           				
           				if(x && x.items[0] && x.items[0].volumeInfo && x.items[0].volumeInfo.imageLinks && x.items[0].volumeInfo.imageLinks.thumbnail){
	           				document.write("<img src=" + x.items[0].volumeInfo.imageLinks.thumbnail + "><br>");		
	        				document.write("<br><strong>");
	        				document.write(x.items[0].volumeInfo.title);
	        				document.write("</strong>");
           				}
           				
           				document.write("</td>");
           			<% if((i%7) == 6){%> 
           			 document.write("</tr>");
           			<%} }  		%>
           			
           		 document.write("</table>");
    			<% } %>       		
       		}
		
		function createBooks2(){
			<% ArrayList<String> displayList2 = (ArrayList<String>)session.getAttribute("readBooks"); 
	       		if(displayList.size() == 0){ %>
	       			document.write("No Book Found!");
	       			<%}else
	           		{ %>
	           			document.write("<table>");
	           			<% for(int i= 0; i < displayList2.size();i++ )
	           			{
	           				if((i%2) == 0){%>
	           				document.write("<tr>");
	           			<%} %>
	           				document.write("<td>");
	           				
	           				var xhttp = new XMLHttpRequest();
	           				var searchTerm = "<%=displayList2.get(i)%>";
	           				var url = "https://www.googleapis.com/books/v1/volumes?q=intitle:" + searchTerm + "&maxResults=1";
	           				xhttp.open("GET",url,false);
	           				xhttp.send();
	           				var x = JSON.parse(xhttp.responseText);
	           				
	           				if(x && x.items[0] && x.items[0].volumeInfo && x.items[0].volumeInfo.imageLinks && x.items[0].volumeInfo.imageLinks.thumbnail){
		           				document.write("<img src=" + x.items[0].volumeInfo.imageLinks.thumbnail + "><br>");		
		        				document.write("<br><strong>");
		        				document.write(x.items[0].volumeInfo.title);
		        				document.write("</strong>");
	           				}
	           				
	           				document.write("</td>");
	           			<% if((i%7) == 6){%> 
	           			 document.write("</tr>");
	           			<%} }  		%>
	           			
	           		 document.write("</table>");
	    			<% } %>       		
	       		}
	</script>
</head>
<body>
	<div id="outerContainer">
		<div id=topnav>
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
		 	<a href="" id="profile-pic-link"><img src="" style="border-radius: 50%; width:75px; float:right" class="img-border" id="profile-pic"></a>
       </div>

       <div id="mainBody">
       		<div id="leftSide">
       			<img src="" style="border-radius: 50%; width:300px; float: left;"class="img-border" id= "profile-pic-2">
       			<div id="followersAndFollowing">
       				<div id="headingOfTable">
       					<span class="whiteText" style="font-size: 24pt" id="table_heading">@Username</span>
       				</div>
       				<div class="tab">
				        <button class="tablinks" onclick="openCity(event, 'Followers')" id="defaultOpen">Followers</button>
				        <button class="tablinks" onclick="openCity(event, 'Following')">Following</button>
				     </div>

				     <div id="Followers" class="tabcontent">
							<span id="followers" style="text-align: left;"></span>
				      </div>

				      <div id="Following" class="tabcontent">
				        <span id="following" style="text-align: left;"></span>
				      </div>
       				
       			</div>
       		</div>

       		<div id="rightside">
       			<span class="whiteText" style="font-size: 32pt;" id="username_library">Username's Library</span>
       			<button><a href="homePage.jsp"><span class="whiteText">Log out</span></a></button>
       			<br>

       			<div id="booksDisplay">
       				<div class="tab2">
				        <button class="tablinks2" onclick="openCity2(event, 'Read')" id="defaultOpen" style="width:100px;">Read</button>
				        <button class="tablinks2" onclick="openCity2(event, 'Favorite')" style="width:150px;">Favorites</button>
				     </div>

				     <div id="Read" class="tabcontent2">
							<script>createBooks2()</script> 
				      </div>

				      <div id="Favorite" class="tabcontent2">
				       	 <script>createBooks()</script> 
				      </div>
       			</div>
       			
       		</div>

       		<script>
				document.getElementById("defaultOpen").click();
				function openCity(evt, cityName) {
				    var i, tabcontent, tablinks;
				    tabcontent = document.getElementsByClassName("tabcontent");
				    for (i = 0; i < tabcontent.length; i++) {
				        tabcontent[i].style.display = "none";
				    }
				    tablinks = document.getElementsByClassName("tablinks");
				    for (i = 0; i < tablinks.length; i++) {
				        tablinks[i].className = tablinks[i].className.replace(" active", "");
				    }
				    document.getElementById(cityName).style.display = "block";
				    evt.currentTarget.className += " active";
				}

				function openCity2(evt, cityName) {
				    var i, tabcontent, tablinks;
				    tabcontent = document.getElementsByClassName("tabcontent2");
				    for (i = 0; i < tabcontent.length; i++) {
				        tabcontent[i].style.display = "none";
				    }
				    tablinks = document.getElementsByClassName("tablinks2");
				    for (i = 0; i < tablinks.length; i++) {
				        tablinks[i].className = tablinks[i].className.replace(" active", "");
				    }
				    document.getElementById(cityName).style.display = "block";
				    evt.currentTarget.className += " active";
				}

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
				
				var followersList = "<%=session.getAttribute("followers") %>";
				var followingList = "<%=session.getAttribute("following") %>";
				document.getElementById("followers").innerHTML = followersList; //code to write to the followers
				document.getElementById("following").innerHTML = followingList; //code to write to the following
				document.getElementById("profile-pic").src = "<%=session.getAttribute("CurrUserImg") %>"; //code to write to the following
				document.getElementById("profile-pic-link").href = "CurrUserHome.jsp";
				document.getElementById("profile-pic-2").src = "<%=session.getAttribute("CurrUserImg") %>";
				document.getElementById("table_heading").innerHTML = "@"+"<%=session.getAttribute("username")%>";
				document.getElementById("username_library").innerHTML = "<%=session.getAttribute("username")%>" + "'s Library";
			</script>
       	
       </div>

	</div>

</body>
</html> 
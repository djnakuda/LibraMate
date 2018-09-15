package assignment2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PopulateUserInfo
 */
@WebServlet("/PopulateUserInfo")
public class PopulateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username =request.getParameter("username");
		String currUser = (String)request.getSession().getAttribute("currUser");
		request.getSession().setAttribute("username",username );
		request.getSession().setAttribute("alreadyFollower",  false );
		
		
		Users ourUsers = (Users)request.getSession().getAttribute("Users");
		
		for(int i = 0; i < ourUsers.getUsers().size(); i++)
		{		
			if(username.equals(ourUsers.getUsers().get(i).getUsername()))
			{
				ArrayList<String> followersList = ourUsers.getUsers().get(i).getFollowers();
				String followers = "";
				for(int j = 0; j < followersList.size();j++)
				{
					followers += "@" + followersList.get(j) + "<br>";
				}
				request.getSession().setAttribute("followers",followers );
				ArrayList<String> followingList = ourUsers.getUsers().get(i).getFollowing();
				String following = "";
				for(int j = 0; j < followingList.size();j++)
				{
					following += "@" + followingList.get(j) + "<br>";
				}
				request.getSession().setAttribute("following",following );
				request.getSession().setAttribute("img-url", ourUsers.getUsers().get(i).getImageURL());
				
				ArrayList<String> readBooks = ourUsers.getUsers().get(i).getLibrary().getRead();
				ArrayList<String> favoriteBooks = ourUsers.getUsers().get(i).getLibrary().getFavorite();
				request.getSession().setAttribute("readBooks",readBooks );
				request.getSession().setAttribute("favoriteBooks",favoriteBooks );
				
				for(int j = 0;j < ourUsers.getUsers().get(i).getFollowers().size();j++)
				{
					if(ourUsers.getUsers().get(i).getFollowers().get(j).equals(currUser))
					{
						request.getSession().setAttribute("alreadyFollower",  true );
					}
				}
			}
		}
		
		
		String toGoPage = "";
		
		if(currUser.equals(username))
		{
			toGoPage = "/CurrUserHome.jsp";
		}
		else {
			toGoPage ="/OtherUserPage.jsp";
		}
		
		ServletContext sc = getServletContext();
		sc.getRequestDispatcher(toGoPage).forward(request, response);
	}

}

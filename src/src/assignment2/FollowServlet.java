package assignment2;

import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class FollowServlet
 */
@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currUser = (String)request.getSession().getAttribute("currUser");
		String userTofollow = (String)request.getParameter("userTofollow");
		Users ourUsers = (Users)request.getSession().getAttribute("Users");
		
		for(int i = 0; i < ourUsers.getUsers().size();i++)
		{
			if(currUser.equals(ourUsers.getUsers().get(i).getUsername()))
			{
				if(!ourUsers.getUsers().get(i).getFollowing().contains(userTofollow))
					ourUsers.getUsers().get(i).getFollowing().add(userTofollow);			
			}
			
			if(userTofollow.equals(ourUsers.getUsers().get(i).getUsername()))
			{
				if(!ourUsers.getUsers().get(i).getFollowers().contains(currUser)) 
					ourUsers.getUsers().get(i).getFollowers().add(currUser);			
			}
		}
		
		request.getSession().setAttribute("Users", ourUsers);
		fileWriter("/WEB-INF/Assignment3.json",ourUsers);
		
		String forwardPage = "/PopulateUserInfo?username=" + userTofollow; 
		
		ServletContext sc = getServletContext();
		sc.getRequestDispatcher(forwardPage).forward(request, response);	
	}
	
	private void fileWriter(String fileName, Users users)
	{
		try {
			ServletContext context = getServletContext();
			String path = context.getRealPath(fileName);
			FileWriter fw = new FileWriter(path);
			new Gson().toJson(users,fw);
			fw.close();
		} catch (IOException ioe) {
			System.out.println(ioe.getMessage());
		}
	}

}

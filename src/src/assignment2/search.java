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
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String forwardPage ="";		
		String searchIdentifier = request.getParameter("searchIdentifier");
		if(searchIdentifier.trim().equals("0")) 
		{
			forwardPage = "/BookResults.jsp";
		}
		else { 
			forwardPage = "/UserResults.jsp";
			String searchTerm = request.getParameter("searchTerm");
			ArrayList<User> displayList = new ArrayList<User>();
			Users ourUsers = (Users)request.getSession().getAttribute("Users");
			for(int i = 0; i < ourUsers.getUsers().size();i++)
			{
				if(ourUsers.getUsers().get(i).getUsername().startsWith(searchTerm.trim())){
					displayList.add(ourUsers.getUsers().get(i));
				}
			}
			
			request.getSession().setAttribute("displayList", displayList);
			
		}
		
		ServletContext sc = getServletContext();
		sc.getRequestDispatcher(forwardPage).forward(request, response);
	}

}

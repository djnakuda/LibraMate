package assignment2;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String forwardPage = "";
		boolean found = false;
		
		Users ourUsers = (Users)request.getSession().getAttribute("Users");
		for(int i = 0; i < ourUsers.getUsers().size(); i++)
		{
			if(userName != null && password != null) {
				if(userName.equals(ourUsers.getUsers().get(i).getUsername()) && password.equals(ourUsers.getUsers().get(i).getPassword()))
				{
					found = true;
					request.getSession().setAttribute("currUser", userName);
					request.getSession().setAttribute("CurrUserImg", ourUsers.getUsers().get(i).getImageURL());
				}
			}
		}
		
		if(found)
		{
			forwardPage = "/UserInitial.jsp";
			request.getSession().setAttribute("dontmatch", false);
		}
		else 
		{
			forwardPage = "/Login.jsp";
			request.getSession().setAttribute("dontmatch", true);
		}

		
		if(userName.equals("")) request.getSession().setAttribute("usernameEmpty", true);
		else request.getSession().setAttribute("usernameEmpty", false);
		
		if(password.equals("")) request.getSession().setAttribute("passwordEmpty", true);
		else request.getSession().setAttribute("passwordEmpty", false);
	
				
		ServletContext sc = getServletContext();
		sc.getRequestDispatcher(forwardPage).forward(request, response);
	}

}

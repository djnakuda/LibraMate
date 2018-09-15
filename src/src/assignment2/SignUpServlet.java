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
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html");
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String image_url = request.getParameter("image-url");
		Users ourUsers = (Users)request.getSession().getAttribute("Users");
		String forwardPage = "";
		
		boolean ifUserNameExists = ourUsers.checkIfUserNameExists(userName);
		
		if(ifUserNameExists || password.equals("") || image_url.equals("") || userName.equals("")) { 
			forwardPage = "/SignUpPage.jsp";
		}
		else
		{
			ourUsers.addUser(userName, password, image_url);
			request.getSession().setAttribute("Users", ourUsers);
			request.getSession().setAttribute("currUser", userName);
			fileWriter("/WEB-INF/Assignment3.json",ourUsers);
			forwardPage = "/UserResult.jsp";
		}
		if(ifUserNameExists) request.getSession().setAttribute("usernameExists", true);
		else request.getSession().setAttribute("usernameExists", false);
		
		if(userName.equals("")) request.getSession().setAttribute("usernameEmpty", true);
		else request.getSession().setAttribute("usernameEmpty", false);
		
		if(password.equals("")) request.getSession().setAttribute("passwordEmpty", true);
		else request.getSession().setAttribute("passwordEmpty", false);
		
		if(image_url.equals("")) request.getSession().setAttribute("imageEmpty", true);
		else request.getSession().setAttribute("imageEmpty", false);
		
		
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


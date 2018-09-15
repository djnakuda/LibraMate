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
 * Servlet implementation class favoriteServlet
 */
@WebServlet("/favoriteServlet")
public class favoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String currUser = (String)request.getSession().getAttribute("currUser");
	Users ourUsers = (Users)request.getSession().getAttribute("Users");
	String bookToAdd = request.getParameter("bookToAdd");
	
	for(int i = 0; i < ourUsers.getUsers().size();i++)
	{
		if(currUser.equals(ourUsers.getUsers().get(i).getUsername()))
		{
			if(!ourUsers.getUsers().get(i).getLibrary().getFavorite().contains(bookToAdd)) {
				ourUsers.getUsers().get(i).getLibrary().getFavorite().contains(bookToAdd);			
			}
		}
	}
	
	request.getSession().setAttribute("Users", ourUsers);
	fileWriter("/WEB-INF/Assignment3.json",ourUsers);
	String id = request.getParameter("id");
	String forwardPage = "/bookDetailsServlet?id=" + id;
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


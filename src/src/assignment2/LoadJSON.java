package assignment2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class LoadJSON
 */
@WebServlet("/LoadJSON")
public class LoadJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		BufferedReader br;
		String line = "";
		String fileString ="";
		String relativeWebPath = "/WEB-INF/Assignment3.json";
		InputStream input = getServletContext().getResourceAsStream(relativeWebPath);
		Gson gson = new Gson();
		
		
		if(input != null) {
			InputStreamReader isr = new InputStreamReader(input);
			br = new BufferedReader(isr);
			try {
				
				line = br.readLine();
				while (line != null) {
					fileString += line;
					fileString += "\n";
					line = br.readLine();
				}
			}
			catch (IOException ioe) {
				System.out.println(ioe.getMessage());
				}
		isr.close();
		br.close();
		}
		
		
		Users ourUsers = gson.fromJson(fileString, Users.class);

		session.setAttribute("Users", ourUsers);
		session.setAttribute("currUser", "");
	
		ServletContext sc = getServletContext();
		sc.getRequestDispatcher("/homePage.jsp").forward(request, response);
		
	}   

}

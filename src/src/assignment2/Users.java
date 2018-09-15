package assignment2;

import java.util.ArrayList;

public class Users {
	private ArrayList<User> users;

	public ArrayList<User> getUsers() {
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}
	
	public void printUserNames() {
		for(int i = 0; i <users.size();i++)
		{
			System.out.println(users.get(i).getUsername());
		}
	}
	
	public boolean checkIfUserNameExists(String userName)
	{
		for(int i = 0; i < users.size();i++)
		{
			if(userName.equals(users.get(i).getUsername()))
				return true;
		}
		
		return false;
	}
	
	public void addUser(String userName, String password, String image_url)
	{
		users.add(new User(userName,password,image_url));
	}
}

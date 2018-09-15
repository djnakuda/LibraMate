package assignment2;

import java.util.ArrayList;

public class User {
	private String username;
	private String password;
	private String imageURL;
	private ArrayList<String> followers;
	private ArrayList<String> following;
	private Library library;
	
	User(String userName,String password, String imageURL)
	{
		this.username = userName;
		this.password = password;
		this.imageURL = imageURL;
		this.followers = new ArrayList<String>();
		this.following = new ArrayList<String>();
		this.library = new Library();
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public Library getLibrary() {
		return library;
	}

	public void setLibrary(Library library) {
		this.library = library;
	}

	public ArrayList<String> getFollowers() {
		return followers;
	}

	public void setFollowers(ArrayList<String> followers) {
		this.followers = followers;
	}

	public ArrayList<String> getFollowing() {
		return following;
	}

	public void setFollowing(ArrayList<String> following) {
		this.following = following;
	}

}

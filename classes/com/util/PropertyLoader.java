package com.util;

import java.util.ResourceBundle;

public class PropertyLoader {
	private static ResourceBundle resourceBundle;
	
	static {
		resourceBundle = ResourceBundle.getBundle("tgmc");
	}
	
	public static String getDBUserName() {
		return resourceBundle.getString("db_username");
	}
	
	public static String getDBPassword() {
		return resourceBundle.getString("db_password");
	}
}

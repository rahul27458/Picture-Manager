package com.sappers.classes;
public class EmailCheck {
	
	
	
	public void emailSend(String user_id)
	{
		Email email=new Email();
		String to=user_id;
		String subject="xyz";
	
		String messageText="<a href='http://localhost:8080/xyz/EmailValidation?email_id="+to+"'>Click here  to activate u r account</a>";

		if(email.GmailSend(to, subject, messageText))
		{
		System.out.print("sent");
		}else{
		System.out.print("failed");
		}
	}

}
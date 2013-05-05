package com.sappers.classes;


import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
public class Email
{
    public boolean GmailSend  (String to,String subject,String messageText)
    {
        String from ="abcdef"; //Never works
        String host="smtp.gmail.com", user="webmasterdarklord@gmail.com", pass="darklord6254851";
        String SSL_FACTORY ="javax.net.ssl.SSLSocketFactory";
        boolean sessionDebug = true;
        Properties props = System.getProperties();
        props.put("mail.host", host);
        props.put("mail.transport.protocol.", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        Session mailSession = Session.getDefaultInstance(props,null);
        mailSession.setDebug(sessionDebug);
        Message msg =new MimeMessage(mailSession);
	
        try
        {
        	InternetAddress fromadd=new InternetAddress(from);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setContent(messageText,"text/html");
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            return true;
        }

        catch(Exception err)
        {
        //	err.printStackTrace();
            return false;
        }


    }
}



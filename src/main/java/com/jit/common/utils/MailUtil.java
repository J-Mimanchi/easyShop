package com.jit.common.utils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.util.Properties;
/**
 * 
* @ClassName: MailUtils  
* @Description: 发送邮件辅助类
* @date 2017年12月12日 下午4:17:25    
* Company www.igeekhome.com
*
 */
public class MailUtil {
	/**
	 * 
	* @Title: sendMail  
	* @Description: 实现发送邮件
	* @param email：接收邮件的地址
	* @param emailMsg：发送邮件的内容
	* @throws AddressException
	* @throws MessagingException
	 */
	public static void sendMail(String email,String subject ,String emailMsg)
			throws AddressException, MessagingException {
		// 1.创建一个程序与邮件服务器会话对象 Session

		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "SMTP");
		props.setProperty("mail.host", "smtp.qq.com");//smtp.126.com
		props.setProperty("mail.smtp.auth", "true");// 指定验证为true

		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("1428533225", "glikfkijccquffjc");//授权码
			}
		};

		Session session = Session.getInstance(props, auth);

		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);

		message.setFrom(new InternetAddress("1428533225@qq.com")); // 设置发送者

		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者

		message.setSubject(subject);
		// message.setText("这是一封激活邮件，请<a href='#'>点击</a>");

		message.setContent(emailMsg, "text/html;charset=utf-8");

		// 3.创建 Transport用于将邮件发送

		Transport.send(message);
	}
	
	public static void main(String[] args)
    {
	    try
        {
            sendMail("xingbaojiang43@gmail.com", "用户激活","123");
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       
    }
}

package com.monstar.books.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monstar.books.member.util.Gmail;


@Controller
public class EmailController extends Authenticator {
	
	public EmailController() {}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("fldus612@gmail.com", "loicqzazhmhprimv");
	}
	
	 //단일 메시지 발송
    @RequestMapping("/find/sendEmail")
    @ResponseBody
    public Map<String, String> sendOne(@RequestParam(value="to") String to) {
    	String from="fldus612@gmail.com";
		String subject="웹몬스타 :: 인증번호입니다.";
		
		Random rand = new Random(); 
        String numStr = "";
        for(int i=0; i<4; i++) {
        	String ran = Integer.toString(rand.nextInt(10)); 
        	numStr += ran;
        }
		String content="인증번호 : "+numStr;
		
		
		Properties p=new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
//		p.put("mail.smtp.port", "587");
		
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{// 지메일에서 사용하는 형식
			Authenticator auth=new Gmail();
			Session ses=Session.getInstance(p,auth);
			ses.setDebug(true);
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e){
			e.printStackTrace();
		}
        System.out.println("asdasdasdasdas지메이이이이이일 : "+p);
        
        Map<String, String> response = new HashMap<>();
        response.put("numStr", numStr);
        return response;
    }
}// controller
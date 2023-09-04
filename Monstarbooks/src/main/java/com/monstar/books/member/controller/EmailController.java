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
        
        
        String content = "<div\n" + 
        		"        style=\"background: #F7F8F9; margin: 0; padding: 15px; cursor: default; letter-spacing: -.03em; font-family: 'Apple SD Gothic Neo', Helvetica, arial, '나눔고딕', 'Nanum Gothic', '돋움', Dotum, Tahoma, Geneva, sans-serif;\">\n" + 
        		"        <table cellspacing=\"0\" cellpadding=\"0\"\n" + 
        		"            style=\"max-width: 680px; width: 100%; margin: 0 auto; border-collapse: collapse;\">\n" + 
        		"            <tbody>\n" + 
        		"                <tr>\n" + 
        		"                    <td align=\"center\" valign=\"top\">\n" + 
        		"                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"background-color: #000d82; color: #ffffff; border-bottom: 0; font-weight: bold; line-height: 100%; vertical-align: middle; font-family: 'Nunito Sans', Helvetica, Roboto, Arial, sans-serif; border-radius: 10px 10px 0 0;\">\n" + 
        		"                            <tr>\n" + 
        		"                                <td style=\"padding: 25px 40px; display: block;\">\n" + 
        		"                                    <h1 style=\"font-size: 25px; font-weight: 600; color: #ffffff; background-color: inherit; margin: 0; text-align: left;line-height: 1.2em;\">몬스타북스<br>인증번호</h1>\n" + 
        		"                                </td>\n" + 
        		"                            </tr>\n" + 
        		"                        </table>\n" + 
        		"                    </td>\n" + 
        		"                </tr>\n" + 
        		"                <tr>\n" + 
        		"                    <td colspan=\"2\" style=\"padding: 40px 10px; background: white; border: 1px solid #E5E8EB;\">\n" + 
        		"                        <div\n" + 
        		"                            style=\"max-width: 490px; width: 100%; margin: 0 auto; font-size: 13px; color: #373a3c; line-height: 1.8em; text-align: center;\">\n" + 
        		"                            <h1\n" + 
        		"                                style=\"font-size: 28px; font-weight: 600; color: #000d82;; text-align: center; line-height: 1.4em; \">\n"+numStr + 
        		"                            </h1>\n" + 
        		"                        </div>\n" + 
        		"                    </td>\n" + 
        		"                </tr>\n" + 
        		"\n" + 
        		"            </tbody>\n" + 
        		"\n" + 
        		"                <tr>\n" + 
        		"                    <td colspan=\"2\" style=\"text-align: left; padding: 29px 0 50px 0;\">\n" + 
        		"                        <p style=\"padding: 14px 0 0; margin: 0; line-height: 1.8em; color: #808991; font-size: 11px;\">\n" + 
        		"                            본 메일은 발신전용 메일로, 회신되지 않습니다.\n" + 
        		"                        <p\n" + 
        		"                            style=\"padding: 8px 0 0; margin: 0; color: #808991; font-size: 14px; font-family: Tahoma, helvetica; \">\n" + 
        		"                            © MONSTARBOOKS Corp.</p>\n" + 
        		"                    </td>\n" + 
        		"                </tr>\n" + 
        		"            </tbody>\n" + 
        		"        </table>\n" + 
        		"    </div>";	
		
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
        
        Map<String, String> response = new HashMap<String, String>();
        response.put("numStr", numStr);
        return response;
    }
}// controller
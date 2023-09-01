package com.monstar.books.member.controller;

import java.util.Random;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Balance;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class SmsController {

    final DefaultMessageService messageService;

    public SmsController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSTHWBE8PSASOKA", "RMRUD22P4FNYFSUY9AOYU5ZZSUXAV9T5", "https://api.coolsms.co.kr");
    }

    
    //단일 메시지 발송
    @RequestMapping("/find/sendSMS")
    public String sendOne(@RequestParam(value="to") String to) {
    	System.out.println();
        Message message = new Message();
        Random rand = new Random(); 
        String numStr = "";
        for(int i=0; i<4; i++) {
        	String ran = Integer.toString(rand.nextInt(10)); 
        	numStr += ran;
        }
        
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01063843834");
        message.setTo(to); // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
        message.setText(":::웹몬스타::: 인증번호[" + numStr + "]");
        System.out.println(message.getText());
        
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return numStr;
    }

      
    //잔액 조회 예제
    @GetMapping("/get-balance")
    public Balance getBalance() {
        Balance balance = this.messageService.getBalance();
        System.out.println(balance);

        return balance;
    }//balace
}//controller